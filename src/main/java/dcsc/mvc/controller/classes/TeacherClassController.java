package dcsc.mvc.controller.classes;

import java.io.File;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dcsc.mvc.domain.classes.ClassCategory;
import dcsc.mvc.domain.classes.ClassImage;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.classes.Likes;
import dcsc.mvc.domain.classes.Search;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.service.classes.ClassesService;
import dcsc.mvc.util.FileLink;
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
		Teacher teacher = new Teacher("Tkim1234");
		
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
	public void createClass() {}
	
	/**
	 * 클래스 등록하기
	 * */
	@RequestMapping("/insert")
	public String insert(Classes classes, Teacher teacher, ClassCategory category, MultipartFile file, List<MultipartFile> files) throws Exception {
		classes.setTeacher(teacher);
		classes.setClassCategory(category);
		
		ClassImage mainImage = new ClassImage();
		
		if(file.getSize() > 0) {
			File img = new File(FileLink.CLASS_IMG + file.getOriginalFilename());
			file.transferTo(img);
		   	
			mainImage.setImageName(file.getOriginalFilename());
			mainImage.setThumbnailState("T");
		}
		//하나만 받는 거 
		ClassImage[] subImages = new ClassImage[3];
		int index = 0;
		
		if(files.size() != 0) {
			for(MultipartFile f : files) {
				System.out.println(f);
				if(f.getSize() > 0) {
					File imgs = new File(FileLink.CLASS_IMG + f.getOriginalFilename());
					f.transferTo(imgs);
		 			
					subImages[index] = new ClassImage(null, null, f.getOriginalFilename(), null, null); 
					index++;
				}
			}
		}
		//여러개 받는거 유다센세 나이스 yuda nice 감사합니다!
		classesService.insert(classes, mainImage, subImages);
		return "redirect:/teacher/class/classList";
	}
	
	/**
	 * 클래스 상세 페이지
	 * */
	@RequestMapping("/{classId}")
	public String selectByClassId(@PathVariable Long classId, Model model) {
		Classes classes = classesService.selectByClassId(classId);
		model.addAttribute("classes", classes);
		return "teacher/class/classDetail";
	}
	
	/**
	 * 클래스 예약자 목록 페이지
	 * */
	@RequestMapping("/bookList")
	public String bookList(Model model) {
		model.addAttribute("title", "클래스 수강 조회");
		return "teacher/class/bookList";
	}
}
