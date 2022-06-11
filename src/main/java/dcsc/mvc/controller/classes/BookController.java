package dcsc.mvc.controller.classes;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.classes.Book;
import dcsc.mvc.domain.classes.BookState;
import dcsc.mvc.domain.classes.ClassSchedule;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.coupon.IssueCoupon;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.service.classes.BookService;
import dcsc.mvc.service.classes.ClassesService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BookController {
	private final ClassesService classesService;
	private final BookService bookService;
	
	private final int SIZE = 10;
	private final int BLOCK_COUNT = 5;
	
	/**
	 * 클래스 예약 페이지
	 * */
	@RequestMapping("/main/book/bookForm")
	public ModelAndView bookForm(Book book, Long classId, Long scheduleId) {
		ModelAndView modelAndView = new ModelAndView("main/class/bookForm");
		
		Classes classes = classesService.selectByClassId(classId);
		ClassSchedule schedule = classesService.selectScheduleByscheduleId(scheduleId);
		
		modelAndView.addObject("classes", classes);
		modelAndView.addObject("schedule", schedule);
		return modelAndView;
	}
	
	/**
	 * 클래스 예약 등록
	 * */
	@RequestMapping("/main/book/bookComplete")
	public ModelAndView insertBook(Book book, Classes classes, ClassSchedule schedule, Student student, IssueCoupon issueCoupon) {
		book.setClasses(classes);
		book.setClassSchedule(schedule);
		book.setStudent(student);
		
		if(issueCoupon.getIssueNo() > 0L) {
			book.setIssueCoupon(issueCoupon);
			
		}
		book.setBookState(new BookState(1L, null));
		
		book = bookService.insert(book);
		
		ModelAndView modelAndView = new ModelAndView("main/class/bookComplete");
		modelAndView.addObject("book", book);
		
		return modelAndView;
	}
	
	/**
	 * 예약ID로 예약 조회
	 * */
	@RequestMapping("/main/mypage/book/{bookId}")
	public String selectByBookId(@PathVariable Long bookId, Model model){
		String studentId = "kim1234";
		Book book = bookService.selectByBookId(bookId);
		model.addAttribute("book", book);
		return "main/mypage/bookDetail";
	}
	
	/**
	 * 예약 캘린더
	 * */
	@RequestMapping("/main/mypage/bookCalendar")
	public String selectByStudentId(){
		
		return "main/mypage/bookCalendar";
	}
	
	/**
	 * 학생ID로 예약 조회
	 * */
	@RequestMapping("/main/mypage/bookList")
	public String selectByStudentId(Model model, @RequestParam(defaultValue = "1") int page){
		String studentId = "kim1234";
		
		Pageable pageable = PageRequest.of((page - 1), SIZE, Direction.DESC, "bookId");
		
		Page<Book> list = bookService.selectPageByStudentId(studentId, pageable);

		int temp = (page - 1) % BLOCK_COUNT;
		int startPage = page - temp;

		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		
		return "main/mypage/bookList";
	}
}
