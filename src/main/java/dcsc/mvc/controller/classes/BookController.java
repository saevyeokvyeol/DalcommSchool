package dcsc.mvc.controller.classes;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	/**
	 * 클래스 예약 페이지
	 * */
	@RequestMapping("/main/book/bookForm")
	public ModelAndView bookForm(Book book, Long classId, Long scheduleId) {
		ModelAndView modelAndView = new ModelAndView("/main/class/bookForm");
		
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
	public String insertBook(Book book, Classes classes, ClassSchedule schedule, Student student, IssueCoupon issueCoupon) {
		book.setClasses(classes);
		book.setClassSchedule(schedule);
		book.setStudent(student);
		
		if(issueCoupon.getIssueNo() > 0L) {
			book.setIssueCoupon(issueCoupon);
			
		}
		book.setBookState(new BookState(1L, null));
		
		bookService.insert(book);
		
		return "/main/class/bookComplete";
	}
	
	/**
	 * 예약ID로 예약 조회
	 * */
	@RequestMapping("/main/mypage/book/{bookId}")
	public String selectByBookId(@PathVariable Long bookId, Model model){
		String studentId = "kim1234";
		List<Book> list = bookService.selectByStudentId(studentId);
		model.addAttribute("list", list);
		return "/main/mypage/bookDetail";
	}
	
	/**
	 * 학생ID로 예약 조회
	 * */
	@RequestMapping("/main/mypage/book")
	public String selectByStudentId(Model model){
		String studentId = "kim1234";
		List<Book> list = bookService.selectByStudentId(studentId);
		model.addAttribute("list", list);
		return "/main/mypage/bookList";
	}
}
