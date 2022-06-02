package dcsc.mvc.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.board.ClassQna;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.user.Student;
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
	public String qnaInsert(ClassQna classQna, Classes classes, Student student) {
		classQna.setClasses(classes);
		classQna.setStudent(student);
		classQna.setBlindState(classQna.getBlindState());
		classQna.setQnaComplete(classQna.getQnaComplete());
		classQnaService.insertQuestion(classQna);
		//System.out.println("classQna = "+classQna );
		
		return "redirect:/main/class/qnaList";
	}
	
	/**
	 * Q&A 수정폼
	 * */
	@RequestMapping("qnaUpdateForm")
	public ModelAndView qnaUpdateForm(Long qnaId) {
		ClassQna classQna = classQnaService.selectByQnaId(qnaId);
		
		return new ModelAndView("main/class/qnaUpdate", "qna", classQna);
	}
	
	/**
	 * Q&A 수정하기
	 * */
	@RequestMapping("qnaUpdate")
	public String qnaUpdate(ClassQna classQna) {
		classQnaService.updateQuestion(classQna);
	
		return "redirect:/main/class/qnaList";
	}
	
	/**
	 * Q&A 삭제하기
	 * */
	@RequestMapping("qnaDelete")
	public String qnaDelete(Long qnaId) {
		classQnaService.deleteQuestion(qnaId);
		
		return "redirect:/main/class/qnaList";
	}
}
