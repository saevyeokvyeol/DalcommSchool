package dcsc.mvc.controller.board;

import java.io.File;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.board.ClassReview;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.service.board.ClassReviewService;
import dcsc.mvc.util.FileLink;
import dcsc.mvc.util.ImageLink;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/board/review")
public class ClassReviewController {
	
	public final ClassReviewService reviewService;
	private final static int PAGE_COUNT=5;
	private final static int BLOCK_COUNT=3;
	
	/**
	 * 클래스 ID로 후기 리스트 가져오기
	 * */
	@RequestMapping("/reviewList/classId")
	public String selectByClassId(Model model, Long classId, @RequestParam(defaultValue="1") int nowPage){
//		List<ClassReview> list = reviewService.selectByClassId(classId);
		
		classId=1L;
		
		//페이징 처리하기
		Pageable page = PageRequest.of((nowPage-1),PAGE_COUNT, Direction.DESC,"reviewId");
		Page<ClassReview> pageList = reviewService.selectByClassId(classId, page);
		
		model.addAttribute("classReviews", pageList);
		
		int temp=(nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage-temp;
	
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage",nowPage);

		return "main/class/classDetail";
	}
	
	/**
	 * 강사 ID로 후기 리스트 가져오기
	 * */
	@RequestMapping("/teacher")
	public String selectByTeacherId(Model model, String teacherId, @RequestParam(defaultValue="1") int nowPage){
		teacherId = "Tpark1234";
//		List<ClassReview> list = reviewService.selectByTeacherId(teacherId);
		
		Pageable page = PageRequest.of((nowPage-1),PAGE_COUNT, Direction.DESC,"reviewId");
		Page<ClassReview> pageList = reviewService.selectByTeacherId(teacherId, page);
		
		
		model.addAttribute("classReviews", pageList);
		
		int temp=(nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage-temp;
	
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage",nowPage);
		
		return "teacher/teacherMypage/classReview";
	}
	
	/**
	 * 전체 후기 가져오기(관리자)
	 * */
	@RequestMapping("/list")
	public String selectAll(Model model, @RequestParam(defaultValue="1") int nowPage){
//		List<ClassReview> list = reviewService.selectAll();
		Pageable page = PageRequest.of((nowPage-1),PAGE_COUNT, Direction.DESC,"reviewId");
		Page<ClassReview> pageList = reviewService.selectAll(page);
		
		model.addAttribute("classReviews", pageList);
		
		int temp=(nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage-temp;
	
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage",nowPage);
		
		return "admin/board/review/reviewList";
	}
	
	/**
	 * 학생 ID로 리스트 가져오기
	 * */
	@RequestMapping("/student")
	public String classReviewSearch(Model model,String studentId, @RequestParam(defaultValue="1") int nowPage){
//		List<ClassReview> list = reviewService.selectByStudentId(studentId);
		
		studentId="park1234";
		
		Pageable page = PageRequest.of((nowPage-1),PAGE_COUNT, Direction.DESC,"reviewId");
		Page<ClassReview> pageList = reviewService.selectByStudentId(studentId, page);
		
		model.addAttribute("classReviews", pageList);
		
		int temp=(nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage-temp;
	
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage",nowPage);
		
		return "main/mypage/reviewList";
	}
	
	/**
	 * 후기 상세 보기
	 * */
	@RequestMapping("/read/{reviewId}")
	public ModelAndView readReview(@PathVariable Long reviewId) {
//		reviewId=2L;
		ClassReview review = reviewService.selectByReviewId(reviewId);
		
		return new ModelAndView("main/board/review/reviewDetail", "review", review);
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
	 * 클래스 후기 등록 폼(테스트)
	 * */
	@RequestMapping("/insertTest")
	public void insertForm() {
		
		
	}
	
	/**
	 * 클래스 후기 등록 (별점)
	 * */
	@RequestMapping("/insert")
	public void insertReview(ClassReview review, MultipartFile file, Long classId) throws Exception{
		
		review.setClasses(new Classes(classId));
		
		if(file.getSize()>0) {
			File img = new File(ImageLink.CLASSREVIEW_IMG + file.getOriginalFilename());
			file.transferTo(img);
			
			review.setReviewImg(file.getOriginalFilename());
		}
		
		
		reviewService.insert(review);
		
	}
	
	/**
	 * 클래스 후기 수정 폼
	 * */
	@RequestMapping("/updateForm")
	public ModelAndView updateReviewForm(Long reviewId) {
//		reviewId=11L;
		ClassReview review = reviewService.selectByReviewId(reviewId);
		
		return new ModelAndView("main/board/review/updateForm", "review", review);
	}
	
	/**
	 * 클래스 후기 수정
	 * */
	@RequestMapping("/update")
	public String updateReview(ClassReview review, MultipartFile file) throws Exception{
		if(file.getSize()>0) {
			File img = new File(ImageLink.CLASSREVIEW_IMG + file.getOriginalFilename());
			file.transferTo(img);
			
			review.setReviewImg(file.getOriginalFilename());
		}		
		ClassReview newReview = reviewService.update(review);
		
		return "redirect:/main/board/review/read/" + newReview.getReviewId();
	}
	
	/**
	 * 클래스 후기 삭제
	 * */
	@RequestMapping("/delete")
	@ResponseBody
	public void deleteReview(Long reviewId) {
		reviewService.delete(reviewId);
		
		
	}
	
	/**
	 * 클래스 후기 블라인드 처리
	 * */
	@RequestMapping("/blind")
	@ResponseBody
	public String reviewBlind(Long reviewId, String reviewBlindState) {
		
		reviewService.updateBlind(reviewId, reviewBlindState);
		
		return "redirect:/";
	}
	
	/**
	 * 클래스 후기 신고 기능
	 * */
//	@RequestMapping("")
}
