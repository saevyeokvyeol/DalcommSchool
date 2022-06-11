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
import dcsc.mvc.domain.board.ClassReply;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.service.board.ClassQnaService;




@Controller
@RequestMapping("/")
public class QnaController {
	
	@Autowired
	private ClassQnaService classQnaService;
	
	/**
	 * Q&A 전체조회
	 * */
	/*@RequestMapping("main/board/qna/qnaList")
	public void qnaList(Model model) {
		List<ClassQna> list = classQnaService.selectAllQna();
		
		model.addAttribute("list", list);
	}*/
	
	
	/**
	 * Q&A 상세조회
	 * */
	@RequestMapping("main/board/qna/qnaRead/{qnaId}")
	public String qnaRead(@PathVariable Long qnaId, Model model ) {
		ClassQna classQna = classQnaService.selectByQnaId(qnaId);
		ClassReply classReply = classQnaService.selectByReplyQnaId(qnaId);
		model.addAttribute("qna", classQna);
		model.addAttribute("qnaReply", classReply);
		
		return "main/board/qna/qnaRead";
	}
	
	/**
	 * Q&A 상세조회 - 관리자
	 * */
	@RequestMapping("admin/board/qna/qnaRead/{qnaId}")
	public String qnaReadAdmin(@PathVariable Long qnaId, Model model ) {
		ClassQna classQna = classQnaService.selectByQnaId(qnaId);
		ClassReply classReply = classQnaService.selectByReplyQnaId(qnaId);
		model.addAttribute("qna", classQna);
		model.addAttribute("qnaReply", classReply);
		
		return "admin/board/qna/qnaRead";
	}
	
	/**
	 * 선생님 - Q&A 상세조회
	 * */
	/*@RequestMapping("teacher/board/qna/qnaRead/{qnaId}")
	public ModelAndView qnaReadth(@PathVariable Long qnaId ) {
		ClassQna classQna = classQnaService.selectByQnaId(qnaId);
		
		return new ModelAndView("teacher/board/qna/qnaRead", "qna", classQna);
	}*/
	
	/**
	 * 선생님 - Q&A 상세조회
	 * */
	@RequestMapping("teacher/board/qna/qnaRead/{qnaId}")
	public String qnaReadth(@PathVariable Long qnaId , Model model) {
		ClassQna classQna = classQnaService.selectByQnaId(qnaId);
		ClassReply classReply = classQnaService.selectByReplyQnaId(qnaId);
		
		model.addAttribute("qna", classQna);
		model.addAttribute("qnaReply", classReply);
		
		return "teacher/board/qna/qnaRead";
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
		
		String blindState = "F";
		String qnaComplete = "F";
		
		classQna.setClasses(classes);
		classQna.setStudent(student);
		//classQna.setBlindState(classQna.getBlindState());
		//classQna.setQnaComplete(classQna.getQnaComplete());
		classQna.setBlindState(blindState);
		classQna.setQnaComplete(qnaComplete);
		classQnaService.insertQuestion(classQna);
		System.out.println("classQna = "+classQna );
		
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
	@RequestMapping("admin/board/qna/qnaListBlind")
	public void qnaAll(Model model) {
		List<ClassQna> list = classQnaService.selectAllQna();
		
		model.addAttribute("list", list);
	}
	
	/**
	 * 선생님 QnA전체조회
	 * */
	@RequestMapping("teacher/board/qna/qnaList")
	public void qnaSelectAll(Model model) {
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
	@RequestMapping("main/board/qna/qnaList")
	public void selectByClassId(Long classId , Model model) {
		classId = 2L;
		
		List<ClassQna> list= classQnaService.selectByClassId(classId);
		model.addAttribute("list", list);
	}
	
	/**
	 * 강사ID로 클래스 Q&A 검색
	 * */
	@RequestMapping("teacher/teacherMypage/qnaListAll")
	public void selectByteacherId(String teacherId , Model model) {
		teacherId = "Tann1234";
		
		List<ClassQna> list = classQnaService.selectByTeacherId(teacherId);
		model.addAttribute("list", list);
	}
	
	
	/**
	 * 선생님 Q&A 답변 폼
	 * */
	@RequestMapping("qnaReplyWriteForm")
	public String qnaReplyWriteFrom(Long qnaId, Model model) {
		model.addAttribute("qnaId", qnaId);
		
		return "teacher/board/qna/qnaReplyWrite";
	}
	
	/**
	 * 선생님 Q&A 답변하기
	 * */
	@RequestMapping("qnaReplyInsert")
	public String qnaReplyInsert(ClassReply classReply, Long qnaId , Teacher teacher ) {
		classReply.setClassQna(new ClassQna(qnaId));
		classReply.setTeacher(teacher);
		classQnaService.insertReply(classReply);
		
		return "redirect:/teacher/board/qna/qnaRead/"+qnaId;
	}
	
	/**
	 * 선생님 Q&A 답변 수정폼
	 * */
	@RequestMapping("qnaReplyUpdateForm/{replyId}")
	public ModelAndView qnaReplyUpdateForm(@PathVariable Long replyId){
		ClassReply classReply= classQnaService.selectByReplyId(replyId);
		
		return new ModelAndView("teacher/board/qna/qnaReplyUpdateForm", "qnaReply", classReply);
	}
	
	/**
	 * 선생님 Q&A 답변 수정하기
	 * */
	@RequestMapping("qnaReplyUpdate")
	public String qnaReplyUpdate(ClassReply classReply) {
		classQnaService.updateReply(classReply);
		
		return "redirect:/teacher/teacherMypage/qnaListAll";
	}

	/**
	 * 선생님 Q&A 답변 삭제하기
	 * */
	@RequestMapping("qnaReplyDelete/{replyId}")
	public String qnaReplyDelete(@PathVariable Long replyId) {
		classQnaService.deleteReply(replyId);
		
		return "redirect:/teacher/teacherMypage/qnaListAll";
	}
	
	/**
	 * 학생ID로 클래스 Q&A 검색
	 * */
	@RequestMapping("main/mypage/qnaList")
	public void selectByStudentId(String studentId, Model model) {
		studentId="lee1234";
		
		List<ClassQna> list = classQnaService.selectByStudentId(studentId);
		model.addAttribute("list", list);
		
	}
	
}
