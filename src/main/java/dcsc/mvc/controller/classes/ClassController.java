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

import dcsc.mvc.domain.classes.ClassCategory;
import dcsc.mvc.domain.classes.ClassImage;
import dcsc.mvc.domain.classes.ClassSchedule;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.classes.Search;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.service.classes.ClassesService;
import dcsc.mvc.util.Link;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ClassController {
	private final ClassesService classesService;
	
	/**
	 * 클래스 전체 리스트창으로 이동
	 * */
	@RequestMapping("/teacher/class/classList")
	public void selectAllClass(Model model) {
		List<Classes> list = classesService.selectAll();
		
		model.addAttribute("list", list);
	}
	
	/**
	 * 공개된 클래스 리스트
	 * */
	@RequestMapping("/main/class/classList")
	public void selectByStateOpen(Model model) {
		// 로그인 했을 경우
		Student student = new Student("kim1234", null, null, null, null, null, null, null, null);
		
		List<Classes> list = classesService.selectAll();
		
		model.addAttribute("list", list);
	}
	
	/**
	 * 클래스 검색
	 * */
	@RequestMapping("main/class/classSearch")
	public ModelAndView classSearch(Search search) {
		List<Classes> list = classesService.selectByFilter(search);
		
		ModelAndView modelAndView = new ModelAndView("/main/class/classList");
		modelAndView.addObject("list", list);
		return modelAndView;
	}
	
	/**
	 * 클래스 등록폼으로 이동
	 * */
	@RequestMapping("/teacher/class/classForm")
	public void insertClass() {}
	
	/**
	 * 클래스 등록하기
	 * */
	@RequestMapping("/teacher/class/insert")
	public String insert(Classes classes, Teacher teacher, ClassCategory category, MultipartFile file, List<MultipartFile> files, HttpSession session) throws Exception {
		classes.setTeacher(teacher);
		classes.setClassCategory(category);
		
		ClassImage mainImage = new ClassImage();
		
		if(file.getSize() > 0) {
			File img = new File(Link.CLASS_IMG + file.getOriginalFilename());
			file.transferTo(img);
			
			mainImage.setImageName(file.getOriginalFilename());
			mainImage.setThumbnailState("T");
		}
		
		ClassImage[] subImages = new ClassImage[8];
		int index = 0;
		
		if(files.size() != 0) {
			for(MultipartFile f : files) {
				System.out.println(f);
				if(f.getSize() > 0) {
					File imgs = new File(Link.CLASS_IMG + f.getOriginalFilename());
					f.transferTo(imgs);
					
					subImages[index] = new ClassImage(null, null, f.getOriginalFilename(), null, null); 
					index++;
				}
			}
		}

		classesService.insert(classes, mainImage, subImages);
		return "redirect:/main/class/classList";
	}
	
	/**
	 * 클래스 상세 페이지
	 * */
	@RequestMapping("/main/class/{classId}")
	public String selectByClassId(@PathVariable Long classId, Model model) {
		Classes classes = classesService.selectByClassId(classId);
		model.addAttribute("classes", classes);
		return "/main/class/classDetail";
	}
}
