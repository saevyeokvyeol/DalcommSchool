package dcsc.mvc.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.board.ClassQna;
import dcsc.mvc.domain.board.ClassQnaReplyDTO;
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
	
	private final static int PAGE_COUNT = 10;
	private final static int BLOCK_COUNT = 5;
	
	/**
	 * Q&A 전체조회
	 * */
	/*@RequestMapping("main/board/qna/qnaList")
	public void qnaList(Model model) {
		List<ClassQna> list = classQnaService.selectAllQna();
		
		model.addAttribute("list", list);
	}*/
	
	
	/**
	 * Q&A 상세조회(메인)
	 * */
	/*@RequestMapping("main/board/qna/qnaRead/{qnaId}")
	public String qnaRead(@PathVariable Long qnaId, Model model) {
		ClassQna classQna = classQnaService.selectByQnaId(qnaId);
		ClassReply classReply = classQnaService.selectByReplyQnaId(qnaId);
		model.addAttribute("qna", classQna);
		model.addAttribute("qnaReply", classReply);
		
		return "main/board/qna/qnaRead";
	}*/
	
	/**
	 * Q&A 상세조회(메인) -모달 - 아작스
	 * */
	@RequestMapping("main/board/qna/qnaRead")
	@ResponseBody
	public ClassQnaReplyDTO qnaRead(Long qnaId) {
		ClassQna classQna = classQnaService.selectByQnaId(qnaId);
		ClassReply classReply = classQnaService.selectByReplyQnaId(qnaId);
		
		ClassQnaReplyDTO qnaReplyDTO = new ClassQnaReplyDTO();
		
		if(classReply!=null) {
			qnaReplyDTO = new ClassQnaReplyDTO(classQna.getQnaId(), classQna.getStudent().getStudentId(), classQna.getClasses().getClassName(),
											classQna.getQnaInsertDate(), classQna.getQnaTitle(), classQna.getQnaComplete(),
											classQna.getQnaContent(), classReply.getReplyId(), classReply.getTeacher().getTeacherNickname(), 
											classReply.getReplyInsertDate(), classReply.getReplyContent());
			
		}else if(classReply==null) {
			qnaReplyDTO = new ClassQnaReplyDTO(classQna.getQnaId(), classQna.getStudent().getStudentId(), classQna.getClasses().getClassName(),
					classQna.getQnaInsertDate(), classQna.getQnaTitle(), classQna.getQnaComplete(),
					classQna.getQnaContent(), null, null, 
					null, null);
		}
		
		
		return qnaReplyDTO;
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
		
		if(classQna.getSecretState()==null) {
			classQna.setSecretState("T");
		}
		
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
	 * Q&A 수정폼 - 포워드방식
	 * */
	/*@RequestMapping("main/board/qna/qnaUpdateForm")
	public ModelAndView qnaUpdateForm(Long qnaId) {
		ClassQna classQna = classQnaService.selectByQnaId(qnaId);
		
		return new ModelAndView("main/board/qna/qnaUpdate", "qna", classQna);
	}*/
	
	/**
	 * Q&A 수정폼 - 모달
	 * */
	@RequestMapping("qnaUpdateForm")
	@ResponseBody
	public ClassQna qnaUpdateFormModal(Long qnaId) {
		ClassQna classQna = classQnaService.selectByQnaId(qnaId);
		
		return classQna;
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
	/*@RequestMapping("admin/board/qna/qnaListBlind")
	public void qnaAll(Model model) {
		List<ClassQna> list = classQnaService.selectAllQna();
		model.addAttribute("list", list);
		
	}*/
	
	/**
	 * 관리자 QnA전체조회 - 페이징처리
	 * */
	@RequestMapping("admin/board/qna/qnaListBlind")
	public void qnaAll(Model model, @RequestParam(defaultValue = "1") int nowPage) {

		//페이징처리하기
		Pageable page = PageRequest.of( (nowPage-1), PAGE_COUNT, Direction.DESC, "qnaId");
		Page<ClassQna> pageList = classQnaService.selectAllQna(page);
		
		//pageList.getContent() : 뷰단 상황 이해하기 //${requestScope.pageList.content}
		
		model.addAttribute("pageList", pageList);
		
		
		int temp = (nowPage-1)%BLOCK_COUNT; //나머지는 항상 0 1 2 임 why? 3이므로 3보다 작은 값
		int startPage = nowPage-temp;
		
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
		
	}
	
	/**
	 * 선생님 QnA전체조회 -- 사이트내 전체 QnA 글 보기 필요?
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
	/*@RequestMapping("main/board/qna/qnaList")
	public void selectByClassId(Long classId , Model model) {
		classId = 2L;
		
		List<ClassQna> list= classQnaService.selectByClassId(classId);
		model.addAttribute("list", list);
	}*/
	
	/**
	 * 클래스ID로 클래스 Q&A 검색 - 페이징
	 * */
	@RequestMapping("board/qna/selectByClassId")
	@ResponseBody
	public Map<String, Object> selectByClassId(Long classId, Model model, int page) {
		
		//페이징처리하기
		Pageable pageable = PageRequest.of((page-1), PAGE_COUNT, Direction.DESC, "qnaId");
		Page<ClassQna> pageList = classQnaService.selectByClassId(classId, pageable);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", pageList.getContent());
		
		int temp = (page-1) % BLOCK_COUNT;
		int startPage = page - temp;

		map.put("totalPage", pageList.getTotalPages());
		map.put("blockCount", BLOCK_COUNT);
		map.put("startPage", startPage);
		map.put("page", page);
		
		return map;
	}
	
	/**
	 * 강사ID로 클래스 Q&A 검색
	 * */
	/*@RequestMapping("teacher/teacherMypage/qnaListAll")
	public void selectByteacherId(String teacherId , Model model) {
		teacherId = "Tann1234";
		
		List<ClassQna> list = classQnaService.selectByTeacherId(teacherId);
		model.addAttribute("list", list);
	}*/
	
	/**
	 * 강사ID로 클래스 Q&A 검색 - 페이징
	 * */
	@RequestMapping("teacher/mypage/qnaListAll")
	public void selectByteacherId(String teacherId , Model model, @RequestParam(defaultValue = "1") int nowPage) {
		teacherId = "Tann1234";
		
		//페이징처리하기
		Pageable page = PageRequest.of( (nowPage-1), PAGE_COUNT, Direction.DESC, "qnaId");
		Page<ClassQna> pageList = classQnaService.selectByTeacherId(teacherId, page);
		
		//pageList.getContent() : 뷰단 상황 이해하기 //${requestScope.pageList.content}
		
		model.addAttribute("pageList", pageList);
		
		
		int temp = (nowPage-1)%BLOCK_COUNT; //나머지는 항상 0 1 2 임 why? 3이므로 3보다 작은 값
		int startPage = nowPage-temp;
		
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
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
	 * 선생님 Q&A 답변 수정폼 - 모달
	 * */
	@RequestMapping("qnaReplyUpdateForm")
	@ResponseBody
	public ClassReply qnaReplyUpdateFormModal(Long replyId){
		ClassReply classReply= classQnaService.selectByReplyId(replyId);
		
		return classReply;
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
	/*@RequestMapping("main/mypage/qnaList")
	public void selectByStudentId(String studentId, Model model) {
		studentId="lee1234";
		
		List<ClassQna> list = classQnaService.selectByStudentId(studentId);
		model.addAttribute("list", list);
		
	}*/
	
	/**
	 * 학생ID로 클래스 Q&A 검색 -페이징처리
	 * */
	@RequestMapping("main/mypage/qnaList")
	public void selectByStudentId(String studentId, Model model, @RequestParam(defaultValue = "1") int nowPage) {
		studentId="lee1234";
		
		//페이징처리하기
		Pageable page = PageRequest.of( (nowPage-1), PAGE_COUNT, Direction.DESC, "qnaId");
		Page<ClassQna> pageList = classQnaService.selectByStudentId(studentId, page);
		
		//pageList.getContent() : 뷰단 상황 이해하기 //${requestScope.pageList.content}
		
		model.addAttribute("pageList", pageList);
		
		
		int temp = (nowPage-1)%BLOCK_COUNT; //나머지는 항상 0 1 2 임 why? 3이므로 3보다 작은 값
		int startPage = nowPage-temp;
		
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
		
	}
}
