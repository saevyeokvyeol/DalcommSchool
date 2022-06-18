package dcsc.mvc.controller.board;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dcsc.mvc.domain.board.ClassReview;
import dcsc.mvc.domain.board.ClassReviewDTO;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.service.board.ClassReviewService;
import dcsc.mvc.util.ImageLink;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ClassReviewController {
	
	public final ClassReviewService reviewService;
	private final static int PAGE_COUNT=10;
	private final static int BLOCK_COUNT=5;
	
	/**
	 * 클래스 ID로 후기 리스트 가져오기
	 * */
	@RequestMapping("/review/selectByClassId")
	@ResponseBody
	public Map<String, Object> selectByClassId(Model model, Long classId, int page){
		//페이징 처리하기
		Pageable pageable = PageRequest.of((page-1),PAGE_COUNT, Direction.DESC,"reviewId");
		Page<ClassReview> pageList = reviewService.selectByClassId(classId, pageable);
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<ClassReviewDTO> list = new ArrayList<ClassReviewDTO>();
		
		for(ClassReview c : pageList.getContent()) {
			ClassReviewDTO dto = new ClassReviewDTO(c.getStudent().getStudentId(), c.getReviewContent(),
					c.getReviewId(), c.getReviewImg(), c.getReviewInsertDate(), c.getReviewRate(),
					null, c.getReviewBlindState(), null);
			list.add(dto);
		}
		
		map.put("list", list);
		map.put("totalCount", pageList.getTotalElements());
		int temp = (page-1) % BLOCK_COUNT;
		int startPage = page - temp;

		map.put("totalPage", pageList.getTotalPages());
		map.put("blockCount", BLOCK_COUNT);
		map.put("startPage", startPage);
		map.put("page", page);

		return map;
	}
	
	/**
	 * 강사 ID로 후기 리스트 가져오기
	 * */
	@RequestMapping("/teacher/mypage/reviewList")
	public String selectByTeacherId(Model model, @RequestParam(defaultValue="1") int page){
		Teacher teacher = (Teacher)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		List<ClassReview> list = reviewService.selectByTeacherId(teacherId);
		
		Pageable pageable = PageRequest.of((page-1),PAGE_COUNT, Direction.DESC,"reviewId");
		Page<ClassReview> pageList = reviewService.selectByTeacherId(teacher.getTeacherId(), pageable);
		
		
		model.addAttribute("list", pageList);
		
		int temp=(page-1)%BLOCK_COUNT;
		int startPage = page-temp;
	
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("page",page);
		
		
		return "teacher/mypage/reviewList";
	}
	
	/**
	 * 전체 후기 가져오기(관리자)
	 * */
	@RequestMapping("/admin/review/list")
	public String selectAllAdmin(Model model, @RequestParam(defaultValue="1") int page){
//		List<ClassReview> list = reviewService.selectAll();
		Pageable pageable = PageRequest.of((page-1),PAGE_COUNT, Direction.DESC,"reviewId");
		Page<ClassReview> pageList = reviewService.selectAll(pageable);
		
		model.addAttribute("list", pageList);
		
		int temp=(page-1)%BLOCK_COUNT;
		int startPage = page-temp;
	
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("page",page);
		
		return "admin/board/review/reviewList";
	}
	
	/**
	 * 학생 ID로 리스트 가져오기
	 * */
	@RequestMapping("/main/mypage/reviewList")
	public String classReviewSearch(Model model,String studentId, @RequestParam(defaultValue="1") int page){
//		List<ClassReview> list = reviewService.selectByStudentId(studentId);
		
		studentId="kim1234";
		
		Pageable pageable = PageRequest.of((page-1),PAGE_COUNT, Direction.DESC,"reviewId");
		Page<ClassReview> pageList = reviewService.selectByStudentId(studentId, pageable);
		
		model.addAttribute("list", pageList);
		
		int temp=(page-1)%BLOCK_COUNT;
		int startPage = page-temp;
	
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("page",page);
		
		return "main/mypage/reviewList";
	}
	
	/**
	 * 후기 상세 보기
	 * */
	@RequestMapping("/review/read")
	@ResponseBody
	public ClassReviewDTO readReviewUser(Long reviewId) {
		
		ClassReview review = reviewService.selectByReviewId(reviewId);

		ClassReviewDTO reviewDTO = new ClassReviewDTO();
		
		reviewDTO = new ClassReviewDTO(review.getStudent().getStudentId(), review.getReviewContent(), review.getReviewId(),
										review.getReviewImg(), review.getReviewInsertDate(), review.getReviewRate(),
										review.getReviewUpdateDate(), review.getReviewBlindState(), review.getClasses().getClassName());
			
		return reviewDTO;
	}
	
	/**
	 * 클래스 후기 등록 폼
	 * */
//	@RequestMapping("/main/mypage/review/writeForm")
//	public String insertForm(Long classId, Model model) {
//		
//		classId=2L;
//		model.addAttribute("classId", classId);
//		
//		return "main/mypage/review/insertReview";
//	}
	
	/**
	 * 클래스 후기 등록
	 * */
	@RequestMapping("/review/insert")
	@ResponseBody
	public void insertReview(ClassReview review, Long classId, @RequestPart(value = "file", required = false) MultipartFile file) throws Exception{
		Student student = null;
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof Student) {
			student = (Student)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		} else {
			throw new RuntimeException("로그인 후 작성해주세요.");
		}
		
		review.setStudent(student);
		review.setClasses(new Classes(classId));
		
		if(file != null) {
			File img = new File(ImageLink.CLASSREVIEW_IMG + file.getOriginalFilename());
			file.transferTo(img);
			
			review.setReviewImg(file.getOriginalFilename());
		}
		reviewService.insert(review);
	}
	
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
	@RequestMapping("/review/update")
	@ResponseBody
	public void updateReview(ClassReview review, @RequestPart(value = "file", required = false) MultipartFile file) throws Exception{
		if(file != null) {
			File img = new File(ImageLink.CLASSREVIEW_IMG + file.getOriginalFilename());
			file.transferTo(img);
			
			review.setReviewImg(file.getOriginalFilename());
		}		
		reviewService.update(review);
	}
	
	/**
	 * 클래스 후기 삭제
	 * */
	@RequestMapping("/review/delete")
	@ResponseBody
	public void deleteReview(Long reviewId) {
		reviewService.delete(reviewId);
	}
	
	/**
	 * 클래스 후기 블라인드 처리
	 * */
	@RequestMapping("/review/blind")
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
}
