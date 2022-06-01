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
	
	/**
	 * Q&A 등록 폼
	 * */
	@RequestMapping("qnaWrite")
	public void qnaWrite() {
		
	}
	
	/**
	 * Q&A 등록
	 * */
	@RequestMapping("qnaInsert")
	public String qnaInsert(ClassQna classQna) {
		classQnaService.insertQuestion(classQna);
		
		return "redirect:/main/class/qnaList";
	}
	
	/**
	 * Q&A 수정폼
	 * */
	@RequestMapping("qnaUpdateForm")
	public ModelAndView qnaUpdateForm(Long qnaId) {
		ClassQna classQna = classQnaService.selectByQnaId(qnaId);
		
		return new ModelAndView("", "", classQna);
	}
	
	/**
	 * Q&A 수정
	 * */
	//@RequestMapping("qnaUpdate")
	
}
