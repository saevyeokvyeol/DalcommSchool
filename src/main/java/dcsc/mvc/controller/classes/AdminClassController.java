package dcsc.mvc.controller.classes;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.service.classes.ClassesService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/class/")
@RequiredArgsConstructor
public class AdminClassController {
	private final ClassesService classesService;
	
	/**
	 * 클래스 전체 리스트창으로 이동
	 * */
	@RequestMapping("classList")
	public void selectAllClass(Model model) {
		List<Classes> list = classesService.selectAll();
		
		model.addAttribute("list", list);
	}
}
