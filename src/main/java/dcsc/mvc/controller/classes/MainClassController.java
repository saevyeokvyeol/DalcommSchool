package dcsc.mvc.controller.classes;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.classes.Book;
import dcsc.mvc.domain.classes.ClassCategory;
import dcsc.mvc.domain.classes.ClassImage;
import dcsc.mvc.domain.classes.ClassSchedule;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.classes.Search;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.service.classes.BookService;
import dcsc.mvc.service.classes.ClassesService;
import dcsc.mvc.util.Link;
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
	public String bookForm(Book book) {
		return "/main/class/bookForm";
	}
}
