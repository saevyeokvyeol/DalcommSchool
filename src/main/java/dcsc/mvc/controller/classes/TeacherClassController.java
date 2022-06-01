package dcsc.mvc.controller.classes;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dcsc.mvc.domain.classes.ClassCategory;
import dcsc.mvc.service.classes.ClassesService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/teacher/class/")
@RequiredArgsConstructor
public class TeacherClassController {
	private final ClassesService classesService;
	
	/**
	 * 클래스 등록폼으로 이동
	 * */
	@RequestMapping("classForm")
	public void insertClass() {
		
	}
	
	/**
	 * 클래스 등록하기
	 * */
	@RequestMapping("insert")
	public void insert() {
		
	}
	
	/**
	 * 클래스 카테고리 가져오기
	 * */
	@RequestMapping("selectAllCategory")
	public List<ClassCategory> selectAllCategory() {
		List<ClassCategory> list = classesService.selectAllCategory();
		return list;
	}
}