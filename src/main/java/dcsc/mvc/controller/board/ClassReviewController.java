package dcsc.mvc.controller.board;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.board.ClassReview;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.service.board.ClassReviewService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/board/review")
public class ClassReviewController {
	
	public final ClassReviewService reviewService;
	
	/**
	 * 클래스 ID로 후기 리스트 가져오기
	 * */
	@RequestMapping("/{classId}")
	public List<ClassReview> selectByClassId(Long classId){
		List<ClassReview> list = reviewService.selectByClassId(classId);
		
		return list;
	}
	
	/**
	 * 강사 ID로 후기 리스트 가져오기
	 * */
	@RequestMapping("/{teacherId}")
	public List<ClassReview> selectByTeacherId(String teacherId){
		List<ClassReview> list = reviewService.selectByTeacherId(teacherId);
		
		return list;
	}
	
	/**
	 * 전체 후기 가져오기(관리자)
	 * */
	@RequestMapping("/list")
	public List<ClassReview> selectAll(){
		List<ClassReview> list = reviewService.selectAll();
		
		return list;
	}
	
	/**
	 * 학생 ID로 리스트 가져오기(관리자)
	 * */
	@RequestMapping("/{studentId}")
	public List<ClassReview> classReviewSearch(String studentId){
		List<ClassReview> list = reviewService.selectByStudentId(studentId);
		
		return list;
	}
	
	
	/**
	 * 후기 상세 보기
	 * */
	@RequestMapping("/read")
	public ClassReview readReview(Long reviewId) {
		ClassReview review = reviewService.selectByReviewId(reviewId);
		
		return review;
	}
	
	/**
	 * 클래스 후기 등록 폼
	 * */
	@RequestMapping("/insertForm")
	public String insertForm(Long classId, Model model) {
		model.addAttribute("classId", classId);
		
		return "main/board/review/insertReview";
	}
	
	/**
	 * 클래스 후기 등록 (별점)
	 * */
	@RequestMapping("/insert")
	public String insertReview(ClassReview review, Long classId) {
		review.setClasses(new Classes(classId));
		
		reviewService.insert(review);
		
		return "redirect:/main/board/review/classReview";
	}
	
	/**
	 * 클래스 후기 수정
	 * */
	
	/**
	 * 클래스 후기 삭제
	 * */
	
	/**
	 * 클래스 후기 블라인드 처리
	 * */
	
	/**
	 * 클래스 후기 신고 기능
	 * */
}
