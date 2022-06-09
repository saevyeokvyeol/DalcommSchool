package dcsc.mvc.controller.classes;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	private final int SIZE = 9;
	private final int BLOCK_COUNT = 5;
	
	/**
	 * 공개된 클래스 리스트
	 * */
	@RequestMapping("/classList")
	public void selectByStateOpen(Model model, @RequestParam(defaultValue = "1") int page) {
		// 로그인 했을 경우
		Student student = new Student("kim1234", null, null, null, null, null, null, null, null);
		
		Pageable pageable = PageRequest.of(page - 1, SIZE);
		
		// 공개된 리스트 목록 가져오기
		Page<Classes> list = classesService.selectByFilter(new Search(), pageable);
		
		// 학생의 마이리스트 가져오기
		List<Likes> likeList = likeService.selectByStudentId(student.getStudentId());

		// 마이 리스트에 추가했을 경우 체크
		for(Likes l : likeList) {
			for(Classes c : list.getContent()) {
				if(c.getClassId() == l.getClasses().getClassId()) {
					c.setLikeId(l.getLikeId());
					break;
				}
			}
		}
		
		int temp = (page - 1) % BLOCK_COUNT;
		int startPage = page - temp;

		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("page", page);
		model.addAttribute("list", list);
	}
	
	/**
	 * 클래스 검색
	 * */
	@RequestMapping("/classSearch")
	public ModelAndView classSearch(Search search, @RequestParam(defaultValue = "1") int page) {
		// 로그인 했을 경우
		Student student = new Student("kim1234", null, null, null, null, null, null, null, null);

		Pageable pageable = PageRequest.of(page - 1, SIZE);
		
		// 공개된 리스트 목록 가져오기
		Page<Classes> list = classesService.selectByFilter(search, pageable);
		
		// 학생의 마이리스트 가져오기
		List<Likes> likeList = likeService.selectByStudentId(student.getStudentId());

		// 마이 리스트에 추가했을 경우 체크
		for(Likes l : likeList) {
			for(Classes c : list.getContent()) {
				if(c.getClassId() == l.getClasses().getClassId()) {
					c.setLikeId(l.getLikeId());
					break;
				}
			}
		}
		
		int temp = (page - 1) % BLOCK_COUNT;
		int startPage = page - temp;

		ModelAndView modelAndView = new ModelAndView("main/class/classList");
		modelAndView.addObject("blockCount", BLOCK_COUNT);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("page", page);
		modelAndView.addObject("list", list);
		modelAndView.addObject("title", "클래스 검색");
		
		return modelAndView;
	}
	
	/**
	 * 신규 클래스 검색
	 * */
	@RequestMapping("/newClass")
	public ModelAndView selectNewClass(@RequestParam(defaultValue = "1") int page) {
		// 로그인 했을 경우
		Student student = new Student("kim1234", null, null, null, null, null, null, null, null);

		Pageable pageable = PageRequest.of(page - 1, SIZE);
		
		// 공개된 리스트 목록 가져오기
		Page<Classes> list = classesService.selectNewClass(pageable);
		
		// 학생의 마이리스트 가져오기
		List<Likes> likeList = likeService.selectByStudentId(student.getStudentId());

		// 마이 리스트에 추가했을 경우 체크
		for(Likes l : likeList) {
			for(Classes c : list.getContent()) {
				if(c.getClassId() == l.getClasses().getClassId()) {
					c.setLikeId(l.getLikeId());
					break;
				}
			}
		}
		
		int temp = (page - 1) % BLOCK_COUNT;
		int startPage = page - temp;

		ModelAndView modelAndView = new ModelAndView("main/class/classList");
		modelAndView.addObject("blockCount", BLOCK_COUNT);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("page", page);
		modelAndView.addObject("list", list);
		modelAndView.addObject("title", "신규 클래스");
		return modelAndView;
	}
	
	/**
	 * 익일 예약 가능한 클래스 검색
	 * */
	@RequestMapping("/nearClass")
	public ModelAndView selectNearClass(@RequestParam(defaultValue = "1") int page) {
		// 로그인 했을 경우
		Student student = new Student("kim1234", null, null, null, null, null, null, null, null);

		Pageable pageable = PageRequest.of(page - 1, SIZE);
		
		// 공개된 리스트 목록 가져오기
		Page<ClassSchedule> list = classesService.selectNearClass(pageable);
		
		// 학생의 마이리스트 가져오기
		List<Likes> likeList = likeService.selectByStudentId(student.getStudentId());

		// 마이 리스트에 추가했을 경우 체크
		for(Likes l : likeList) {
			for(ClassSchedule c : list.getContent()) {
				if(c.getClasses().getClassId() == l.getClasses().getClassId()) {
					c.getClasses().setClassId(l.getLikeId());
					break;
				}
			}
		}
		
		int temp = (page - 1) % BLOCK_COUNT;
		int startPage = page - temp;

		ModelAndView modelAndView = new ModelAndView("main/class/nearClass");
		modelAndView.addObject("blockCount", BLOCK_COUNT);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("page", page);
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
		return "main/class/classDetail";
	}
}
