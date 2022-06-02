package dcsc.mvc.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.board.ClassQna;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.service.board.ClassQnaService;




@Controller
@RequestMapping("/")
public class QnaController {
	
	@Autowired
	private ClassQnaService classQnaService;
	
	/**
	 * Q&A 전체조회
	 * */
	@RequestMapping("main/board/qna/qnaList")
	public void qnaList(Model model) {
		List<ClassQna> list = classQnaService.selectAllQna();
		
		model.addAttribute("list", list);
	}
	
	
	/**
	 * Q&A 상세조회
	 * */
	@RequestMapping("main/board/qna/qnaRead/{qnaId}")
	public ModelAndView qnaRead(@PathVariable Long qnaId ) {
		ClassQna classQna = classQnaService.selectByQnaId(qnaId);
		
		return new ModelAndView("main/board/qna/qnaRead", "qna", classQna);
	}
	
	/**
	 * Q&A 등록 폼
	 * */
	@RequestMapping("main/board/qna/qnaWrite")
	public void qnaWrite() {
		
	}
	
	/**
	 * Q&A 등록
	 * */
	@RequestMapping("main/board/qna/qnaInsert")
	public String qnaInsert(ClassQna classQna, Classes classes, Student student) {
		classQna.setClasses(classes);
		classQna.setStudent(student);
		classQna.setBlindState(classQna.getBlindState());
		classQna.setQnaComplete(classQna.getQnaComplete());
		classQnaService.insertQuestion(classQna);
		//System.out.println("classQna = "+classQna );
		
		return "redirect:/main/board/qna/qnaList";
	}
	
	/**
	 * Q&A 수정폼
	 * */
	@RequestMapping("main/board/qna/qnaUpdateForm")
	public ModelAndView qnaUpdateForm(Long qnaId) {
		ClassQna classQna = classQnaService.selectByQnaId(qnaId);
		
		return new ModelAndView("main/board/qna/qnaUpdate", "qna", classQna);
	}
	
	/**
	 * Q&A 수정하기
	 * */
	@RequestMapping("main/board/qna/qnaUpdate")
	public String qnaUpdate(ClassQna classQna) {
		classQnaService.updateQuestion(classQna);
	
		return "redirect:/main/board/qna/qnaList";
	}
	
	/**
	 * Q&A 삭제하기
	 * */
	@RequestMapping("main/board/qna/qnaDelete")
	public String qnaDelete(Long qnaId) {
		classQnaService.deleteQuestion(qnaId);
		
		return "redirect:/main/board/qna/qnaList";
	}
	
	/**
	 * 관리자 QnA전체조회
	 * */
	@RequestMapping("admin/board/qna/qnaListBI_ad")
	public void qnaAll(Model model) {
		List<ClassQna> list = classQnaService.selectAllQna();
		
		model.addAttribute("list", list);
	}
	
	/**
	 * 블라인드처리
	 * */
	@RequestMapping("admin/board/qna/qnaBlind")
	@ResponseBody
	public String qnaBlind(Long qnaId ,String blindState) {
		
		classQnaService.updateBlind(qnaId, blindState);
		
		return "redirect:/";
		//return "admin/board/qnaListBI_ad";
	}
	
	/**
	 * 클래스ID로 클래스 Q&A 검색
	 * */
	/*@RequestMapping("admin/board/qna/qnaBlind")
	public void selectByClassId(Long classId) {
		classQnaService.selectByClassId(classId);
	}*/
	
	/**
	 * 학생ID로 클래스 Q&A 검색
	 * */
	/*@RequestMapping("admin/board/qna/qnaBlind")
	public void selectByStudentId(Long studentId) {
		classQnaService.selectByClassId(studentId);
	}*/
	
}
