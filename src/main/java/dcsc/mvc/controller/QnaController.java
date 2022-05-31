package dcsc.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.board.ClassQna;
import dcsc.mvc.service.board.ClassQnaService;
import dcsc.mvc.service.board.ClassesQnaService;

@Controller
@RequestMapping("/main/class/")
public class QnaController {
	
	@Autowired
	private ClassQnaService classQnaService;

	@RequestMapping("qnaList")
	public void qnaList(Model model) {
		List<ClassQna> list = classQnaService.selectAllQna();
		
		model.addAttribute("list", list);
	}
	
	@RequestMapping("qnaRead/{qnaId}")
	public ModelAndView qnaRead(@PathVariable Long qnaId ) {
		ClassQna classQna = classQnaService.selectByQnaId(qnaId);
		
		return new ModelAndView("main/class/qnaRead", "qna", classQna);
	}
	
	
}
