package dcsc.mvc.controller.classes;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.classes.Book;
import dcsc.mvc.domain.classes.BookState;
import dcsc.mvc.domain.classes.ClassSchedule;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.classes.Search;
import dcsc.mvc.domain.coupon.Coupon;
import dcsc.mvc.domain.coupon.IssueCoupon;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.service.classes.BookService;
import dcsc.mvc.service.classes.ClassesService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/class")
public class MainClassController {
	private final ClassesService classesService;
	private final BookService bookService;
	
	/**
	 * 공개된 클래스 리스트
	 * */
	@RequestMapping("/classList")
	public void selectByStateOpen(Model model) {
		// 로그인 했을 경우
		Student student = new Student("kim1234", null, null, null, null, null, null, null, null);
		
		List<Classes> list = classesService.selectAll();
		
		model.addAttribute("list", list);
	}
	
	/**
	 * 클래스 검색
	 * */
	@RequestMapping("/classSearch")
	public ModelAndView classSearch(Search search) {
		List<Classes> list = classesService.selectByFilter(search);
		
		ModelAndView modelAndView = new ModelAndView("/main/class/classList");
		modelAndView.addObject("list", list);
		return modelAndView;
	}
	
	/**
	 * 신규 클래스 검색
	 * */
	@RequestMapping("/newClass")
	public ModelAndView selectNewClass() {
		List<Classes> list = classesService.selectNewClass();

		ModelAndView modelAndView = new ModelAndView("/main/class/classList");
		modelAndView.addObject("list", list);
		return modelAndView;
	}
	
	/**
	 * 익일 예약 가능한 클래스 검색
	 * */
	@RequestMapping("/nearClass")
	public ModelAndView selectNearClass() {
		List<ClassSchedule> list = classesService.selectNearClass();

		ModelAndView modelAndView = new ModelAndView("/main/class/nearClass");
		modelAndView.addObject("list", list);
		return modelAndView;
	}
	
	/**
	 * 클래스 상세 페이지
	 * */
	@RequestMapping("/{classId}")
	public String selectByClassId(@PathVariable Long classId, Model model) {
		Classes classes = classesService.selectByClassId(classId);
		model.addAttribute("classes", classes);
		return "/main/class/classDetail";
	}
	
	/**
	 * 클래스 예약 페이지
	 * */
	@RequestMapping("/bookForm")
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
	@RequestMapping("/bookComplete")
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
}
