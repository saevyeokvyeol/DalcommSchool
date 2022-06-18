package dcsc.mvc.controller.classes;

import java.io.File;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dcsc.mvc.domain.classes.ClassCategory;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.service.classes.ClassesService;
import dcsc.mvc.util.ImageLink;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/teacher/class")
public class TeacherClassController {
	private final ClassesService classesService;
	
	private final int SIZE = 9;
	private final int BLOCK_COUNT = 5;
	
	/**
	 * 선생님 클래스 리스트
	 * */
	@RequestMapping("/classList")
	public void selectAllClass(Model model, @RequestParam(defaultValue = "1") int page) {
		// 로그인 했을 경우
		Teacher teacher = (Teacher)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Pageable pageable = PageRequest.of(page - 1, SIZE);
		
		// ID에 해당하는 클래스 가져오기
		Page<Classes> list = classesService.selectByTeacherId(teacher.getTeacherId(), pageable);
		
		int temp = (page - 1) % BLOCK_COUNT;
		int startPage = page - temp;

		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		model.addAttribute("title", "내 클래스 조회");
	}
	
	/**
	 * 클래스 등록폼으로 이동
	 * */
	@RequestMapping("/createClass")
	public void createClass(Model model) {
		model.addAttribute("title", "새 클래스 만들기");
	}
	
	/**
	 * 클래스 등록하기
	 * */
	@RequestMapping("/insert")
	public String insert(Classes classes, ClassCategory category, MultipartFile file) throws Exception {
		Teacher teacher = (Teacher)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		classes.setTeacher(teacher);
		classes.setClassCategory(category);
		
		if(file.getSize() > 0) {
			File img = new File(ImageLink.CLASS_IMG + file.getOriginalFilename());
			file.transferTo(img);
		   	
			classes.setClassImage(file.getOriginalFilename());
		}
		
		classesService.insert(classes);
		
		return "redirect:/teacher/class/classList";
	}
	
	@RequestMapping("/update")
	public String update(Classes classes, ClassCategory category, MultipartFile file) throws Exception {
		Teacher teacher = (Teacher)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		classes.setTeacher(teacher);
		classes.setClassCategory(category);
		
		if(file.getSize() > 0) {
			File img = new File(ImageLink.TEACHER_IMG + file.getOriginalFilename());
			file.transferTo(img);
		   	
			classes.setClassImage(file.getOriginalFilename());
		}
		
		classesService.update(classes);
		
		return "redirect:/teacher/class/classList";
	}
	
	/**
	 * 클래스 수정폼으로 이동
	 * */
	@RequestMapping("/updateClass")
	public void updateClass(Model model, Long classId) {
		Classes classes = classesService.selectByClassId(classId);
		
		model.addAttribute("title", "클래스 수정");
		model.addAttribute("classes", classes);
	}

	/**
	 * 클래스 일정
	 * */
	@RequestMapping("/classSchedule")
	public String selectByClassId(Long classId, Model model) {
		Classes classes = classesService.selectByClassId(classId);
		model.addAttribute("classes", classes);
		model.addAttribute("title", classes.getClassName() + " 일정 조회");
		return "teacher/class/classSchedule";
	}
}
