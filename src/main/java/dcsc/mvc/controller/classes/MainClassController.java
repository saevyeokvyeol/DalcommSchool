package dcsc.mvc.controller.classes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import dcsc.mvc.domain.classes.Likes;
import dcsc.mvc.domain.classes.Search;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.service.classes.ClassesService;
import dcsc.mvc.service.classes.LikeService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/class")
public class MainClassController {
	private final ClassesService classesService;
	private final LikeService likeService;
	
	/**
	 * 공개된 클래스 리스트
	 * */
	@RequestMapping("/classList")
	public void selectByStateOpen(Model model) {
		// 로그인 했을 경우
		Student student = new Student("kim1234", null, null, null, null, null, null, null, null);
		
		List<Classes> list = classesService.selectAll();
		
		List<Likes> likeList = likeService.selectByStudentId(student.getStudentId());

		for(Likes l : likeList) {
			for(Classes c : list) {
				if(c.getClassId() == l.getClasses().getClassId()) {
					c.setLikeId(l.getLikeId());
					break;
				}
			}
		}
		
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
}
