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
import dcsc.mvc.domain.board.ClassReviewDTO;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.service.board.ClassReviewService;
import dcsc.mvc.util.ImageLink;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ClassReviewController {
	
	public final ClassReviewService reviewService;
	private final static int PAGE_COUNT=5;
	private final static int BLOCK_COUNT=3;
	
	/**
	 * 클래스 ID로 후기 리스트 가져오기
	 * */
	@RequestMapping("/main/reviewList/classId")
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
	@RequestMapping("/teacher/mypage/reviewList")
	public String selectByTeacherId(Model model, String teacherId, @RequestParam(defaultValue="1") int nowPage){
		teacherId = "Tlee1234";
//		List<ClassReview> list = reviewService.selectByTeacherId(teacherId);
		
		Pageable page = PageRequest.of((nowPage-1),PAGE_COUNT, Direction.DESC,"reviewId");
		Page<ClassReview> pageList = reviewService.selectByTeacherId(teacherId, page);
		
		
		model.addAttribute("classReviews", pageList);
		
		int temp=(nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage-temp;
	
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage",nowPage);
		
		
		return "teacher/teacherMypage/reviewList";
	}
	
	/**
	 * 전체 후기 가져오기(관리자)
	 * */
	@RequestMapping("/admin/review/list")
	public String selectAllAdmin(Model model, @RequestParam(defaultValue="1") int nowPage){
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
	 * 전체 후기 가져오기(메인페이지)
	 * */
	@RequestMapping("/main/review/list")
	public String selectAllUser(Model model, @RequestParam(defaultValue="1") int nowPage){
//		List<ClassReview> list = reviewService.selectAll();
		Pageable page = PageRequest.of((nowPage-1),PAGE_COUNT, Direction.DESC,"reviewId");
		Page<ClassReview> pageList = reviewService.selectAll(page);
		
		model.addAttribute("classReviews", pageList);
		
		int temp=(nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage-temp;
	
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage",nowPage);
		
		return "main/board/review/reviewList";
	}
	
	/**
	 * 학생 ID로 리스트 가져오기
	 * */
	@RequestMapping("/main/mypage/reviewList")
	public String classReviewSearch(Model model,String studentId, @RequestParam(defaultValue="1") int nowPage){
//		List<ClassReview> list = reviewService.selectByStudentId(studentId);
		
		studentId="kim1234";
		
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
	
//	/**
//	 * 후기 상세 보기(메인, 강사)
//	 * */
//	@RequestMapping("/main/board/review/read/{reviewId}")
//	public ModelAndView readReviewUser(@PathVariable Long reviewId) {
////		reviewId=2L;
//		ClassReview review = reviewService.selectByReviewId(reviewId);
//		
//		return new ModelAndView("main/board/review/reviewDetail", "review", review);
//	}
	
	/**
	 * 후기 상세 보기(메인, 강사 - 아작스)
	 * */
	@RequestMapping("/main/board/review/read")
	@ResponseBody
	public ClassReviewDTO readReviewUser(Long reviewId) {
//		reviewId=2L;
		ClassReview review = reviewService.selectByReviewId(reviewId);

		ClassReviewDTO reviewDTO = new ClassReviewDTO();
		
		reviewDTO = new ClassReviewDTO(review.getStudent().getStudentId(), review.getReviewContent(), review.getReviewId(),
										review.getReviewImg(), review.getReviewInsertDate(), review.getReviewRate(),
										review.getReviewUpdateDate(), review.getReviewBlindState(), review.getClasses().getClassName());
			
		return reviewDTO;
	}
	
	/**
	 * 후기 상세 보기(학생 마이페이지)
	 * */
	@RequestMapping("/main/mypage/review/read/{reviewId}")
	public ModelAndView readReviewStudent(@PathVariable Long reviewId) {
//		reviewId=2L;
		ClassReview review = reviewService.selectByReviewId(reviewId);
		
		return new ModelAndView("main/mypage/reviewDetail", "review", review);
	}
	
	/**
	 * 후기 상세 보기(관리자)
	 * */
	@RequestMapping("/admin/board/review/read/{reviewId}")
	public ModelAndView readReviewAdmin(@PathVariable Long reviewId) {
//		reviewId=2L;
		ClassReview review = reviewService.selectByReviewId(reviewId);
		
		return new ModelAndView("admin/board/review/reviewDetail", "review", review);
	}
	
	/**
	 * 클래스 후기 등록 폼
	 * */
//	@RequestMapping("/main/mypage/review/writeForm")
//	public String insertForm(Long classId, Model model) {
//		
////		classId=2L;
//		model.addAttribute("classId", classId);
//		
//		return "main/mypage/review/insertReview";
//	}
	
	/**
	 * 클래스 후기 등록 폼(마이페이지에서 작성)
	 * */
	@RequestMapping("/main/mypage/writeReview")
	public void insertForm() {
		
		
	}
	
	/**
	 * 클래스 후기 등록
	 * */
	@RequestMapping("/main/mypage/review/insert")
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
//	@RequestMapping("/review/updateForm")
//	public ModelAndView updateReviewForm(Long reviewId) {
////		reviewId=1L;
//		ClassReview review = reviewService.selectByReviewId(reviewId);
//		
//		return new ModelAndView("main/mypage/reviewUpdate", "review", review);
//	}
	
	/**
	 * 클래스 후기 수정 폼(아작스)
	 * */
	@RequestMapping("/review/updateForm")
	@ResponseBody
	public ClassReviewDTO updateReviewForm(Long reviewId) {
		
		ClassReview review = reviewService.selectByReviewId(reviewId);
		ClassReviewDTO reviewDTO = new ClassReviewDTO();
		
		reviewDTO = new ClassReviewDTO(review.getStudent().getStudentId(), review.getReviewContent(), review.getReviewId(),
				review.getReviewImg(), review.getReviewInsertDate(), review.getReviewRate(),
				review.getReviewUpdateDate(), review.getReviewBlindState(), review.getClasses().getClassName());
		
		return reviewDTO;
	}	
	
	/**
	 * 클래스 후기 수정
	 * */
	@RequestMapping("/main/mypage/review/update")
	public String updateReview(ClassReview review, MultipartFile file) throws Exception{
		if(file.getSize()>0) {
			File img = new File(ImageLink.CLASSREVIEW_IMG + file.getOriginalFilename());
			file.transferTo(img);
			
			review.setReviewImg(file.getOriginalFilename());
		}		
		reviewService.update(review);
		
		return "redirect:/main/review/list";
	}
	/**
	 * 클래스 후기 삭제
	 * */
	@RequestMapping("/review/delete")
	@ResponseBody
	public String deleteReview(Long reviewId) {
		reviewService.delete(reviewId);
		
		return "redirect:/main/board/review/read";
	}
	
	/**
	 * 클래스 후기 블라인드 처리
	 * */
	@RequestMapping("/main/board/review/blind")
	@ResponseBody
	public String reviewBlind(Long reviewId, String reviewBlindState) {
		
		reviewService.updateBlind(reviewId, reviewBlindState);
		
		return "redirect:/";
	}
	
	/**
	 * 학생 아이디로 수강한 클래스 목록 가져오기
	 * */
	@RequestMapping("/main/mypage/classList")
	public List<Classes> selectStudentClassList(String studentId){
		return null;
	}
	
	/**
	 * 클래스 후기 신고 기능
	 * */
//	@RequestMapping("")
}
