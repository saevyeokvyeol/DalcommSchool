package dcsc.mvc.controller.coupon;

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
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.classes.Adjust;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.coupon.Coupon;
import dcsc.mvc.domain.coupon.CouponState;
import dcsc.mvc.domain.coupon.IssueCoupon;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.repository.coupon.CouponRepository;
import dcsc.mvc.repository.coupon.IssueCouponRepository;
import dcsc.mvc.service.coupon.CouponService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class CouponController {
	
	private final CouponService couponService;
	
	private final static int PAGE_COUNT=10;
	private final static int BLOCK_COUNT=3;
	
	/**
	 * 자신이 보유한(발급 받은) 쿠폰 조회 기능; 학생
	 * */
	@RequestMapping("main/mypage/couponList")
	public void selectAllIssueCouponByStudentId(String couponUseable, Model model, @RequestParam(defaultValue="1") int nowPage) {
		String studentId = "kim1234";
		
		if(couponUseable == null) couponUseable = "useable";
		
		//페이징 처리하기
		Pageable page = PageRequest.of((nowPage-1),PAGE_COUNT);
		Page<IssueCoupon> issueCouponList = couponService.selectByStudentId(studentId, couponUseable, page);
		model.addAttribute("issueCouponList", issueCouponList);
		
		int temp=(nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage-temp;
	
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage",nowPage);
		
		System.out.println(BLOCK_COUNT);
		System.out.println(startPage);
		System.out.println(nowPage);
			
	
	}
	
	/**
	 * 클래스 발급 쿠폰 조회 기능 ; 선생님 -클래스별 쿠폰 
	 * */
	@RequestMapping("teacher/coupon/couponList")
	public void selectAllCouponByClassId(Long classId, Model model) {
		classId = 2L;
		
		List<Coupon> list = couponService.selectByClassId(classId);
		model.addAttribute("list", list);
	}
	
	/**
	 * 전체 발급 쿠폰 조회 기능 ; 선생님
	 * */
	/*@RequestMapping("teacher/coupon/couponAllList")
	public void selectAllCouponByTeacherId(String teacherId, Model model) {
		teacherId = "Tkim1234";
		
		List<Coupon> list = couponService.selectByTeacherId(teacherId);
		model.addAttribute("list", list);
	}*/
	
	/**
	 * 전체 발급 쿠폰 조회 기능 ; 선생님-페이징처리
	 * */
	@RequestMapping("teacher/coupon/couponAllList")
	public void selectAllCouponByTeacherId(String teacherId, Model model, @RequestParam(defaultValue="1") int nowPage) {
		teacherId = "Tkim1234";
		
		//페이징 처리하기
		Pageable page = PageRequest.of((nowPage-1),PAGE_COUNT, Direction.DESC,"couponId");
		Page<Coupon> couponList = couponService.selectByTeacherId(teacherId, page);
		
		model.addAttribute("couponList", couponList);
		
		int temp=(nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage-temp;
	
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage",nowPage);
		
		System.out.println(BLOCK_COUNT);
		System.out.println(startPage);
		System.out.println(nowPage);
	}
	
	/**
	 * 등록한 전체 쿠폰(클래스 쿠폰 + 이벤트 쿠폰)조회 기능 ; 관리자
	 * */
	/*@RequestMapping("admin/coupon/selectAllCoupon")
	public void selectAllCoupon(Model model) {
		List<Coupon> list = couponService.selectAll();
		model.addAttribute("list", list);
	}*/
	
	/**
	 * 등록한 전체 쿠폰(클래스 쿠폰 + 이벤트 쿠폰)조회 기능 ; 관리자 - 페이징처리
	 * @param 
	 * @return List<Coupon>
	 * */
	@RequestMapping("admin/coupon/selectAllCoupon")
	public void selectAllCoupon(Model model, @RequestParam(defaultValue = "1") int nowPage) {
		
		//페이징처리하기
		Pageable page = PageRequest.of( (nowPage-1), PAGE_COUNT, Direction.DESC, "couponId");
		Page<Coupon> couponList = couponService.selectAll(page);
		
		//pageList.getContent() : 뷰단 상황 이해하기 //${requestScope.pageList.content}
		
		model.addAttribute("couponList", couponList);
		
		
		int temp = (nowPage-1)%BLOCK_COUNT; //나머지는 항상 0 1 2 임 why? 3이므로 3보다 작은 값
		int startPage = nowPage-temp;
		
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
	}
	
	/**
	 * 학생이 보유한 쿠폰 조회 기능 ; 관리자
	 * @param studentId(검색기준)
	 * @return List<IssueCoupon>
	 * */
	@RequestMapping("admin/coupon/studentCouponList")
	public void selectAllIssueCoupontoStudent(String studentId, Model model) {
		//studentId = "lee1234";
		
		//List<IssueCoupon> list = couponService.selectByStudentId(studentId);
		//model.addAttribute("list", list);
	
	}
	
	
	
	/**
	 * 클래스 쿠폰 등록 폼
	 * */
	@RequestMapping("teacher/coupon/couponForm")
	public void couponForm() {
		
	}
	
	
	/**
	 * 클래스 쿠폰 등록하기
	 * */
	@RequestMapping("couponInsert")
	public String couponInsert(Coupon coupon, Classes classes, Teacher teacher, CouponState couponState) {
		coupon.setClasses(classes);
		coupon.setTeacher(teacher);
		coupon.setCouponState(couponState);
		couponService.insertCoupon(coupon);
		
		return "redirect:/teacher/coupon/couponAllList";
	}
	
	/**
	 * 클래스 쿠폰 수정폼
	 * */
	@RequestMapping("teacher/coupon/couponUpdateForm")
	public ModelAndView couponUpdateForm(Long couponId) {
		System.out.println("couponUpdateForm의 couponId = "+ couponId);
		Coupon coupon = couponService.selectByCouponId(couponId);
		
		return new ModelAndView("teacher/coupon/couponUpdate", "coupon", coupon);
	}
	
	/**
	 * 쿠폰 수정하기
	 * */
	@RequestMapping("teacher/coupon/couponUpdate")
	public String couponUpdate(Coupon coupon) {
		couponService.updateCoupon(coupon);
		
		return "redirect:/teacher/coupon/couponAllList";
	}
	
	/**
	 * 쿠폰 삭제하기
	 * */
	@RequestMapping("teacher/coupon/couponDelete")
	public String couponDelete(Long couponId) {
		System.out.println("couponDelete의 couponId = "+ couponId);
		couponService.deleteCoupon(couponId);
		
		return "redirect:/teacher/coupon/couponAllList";
	}
	
	/**
	 * 해당 클래스에 사용할 수 있는 쿠폰조회
	 * @param 
	 * @return List<Coupon>
	 * */
	/*@RequestMapping("/main/class/userableCouponList")
	public void userableCoupon(Long classId , Model model) {
		classId = 5L;
		
		List<Coupon> list = couponService.selectAllClassId(classId);
		model.addAttribute("list", list);
	}*/
	
	/**
	 * 선생님이 쿠폰 상태변경하기
	 * */
	@RequestMapping("teacher/coupon/changeCouponState")
	@ResponseBody
	public void changeCouponState(Coupon coupon, CouponState couponState) {
		coupon.setCouponState(couponState);
		couponService.updateCouponState(coupon);
		//System.out.println("changeCouponState = "+ coupon.getCouponState().getCouponStateName() );
	}
	
	/**
	 * 이벤트 쿠폰 등록 폼
	 * */
	@RequestMapping("admin/coupon/eventCouponForm")
	public void eventCouponForm() {
		
	}
	
	/**
	 * 이벤트 쿠폰 등록하기
	 * */
	@RequestMapping("eventCouponInsert")
	public String eventCouponInsert(Coupon coupon, CouponState couponState) {
		coupon.setCouponState(couponState);
		couponService.insertCoupon(coupon);
		
		return "redirect:/admin/coupon/selectAllCoupon";
	}
	
	/**
	 * 이벤트 쿠폰 수정 폼
	 * */
	@RequestMapping("admin/coupon/eventCouponUpdateForm")
	public ModelAndView eventCouponUpdateForm(Long couponId) {
			//System.out.println("eventCouponUpdateForm의 couponId = "+ couponId);
		Coupon coupon = couponService.selectByCouponId(couponId);
			//System.out.println("eventCouponUpdateForm의 coupon.couponId = "+ coupon.getCouponId());
		return new ModelAndView("admin/coupon/eventCouponUpdate", "coupon", coupon);
	}
	
	/**
	 * 이벤트 쿠폰 수정하기
	 * */
	@RequestMapping("eventCouponUpdate")
	public String eventCouponUpdate(Coupon coupon) {
		System.out.println("eventCouponUpdate의 couponId = "+ coupon.getCouponId());
		couponService.updateCoupon(coupon);
		
		return "redirect:/admin/coupon/selectAllCoupon";
	}
	
	/**
	 * 이벤트 쿠폰 삭제하기
	 * */
	@RequestMapping("admin/coupon/eventCouponDelete")
	public String eventCouponDelete(Long couponId) {
		couponService.deleteCoupon(couponId);
		
		return "redirect:/admin/coupon/selectAllCoupon";
	}
	
	/**
	 * 이벤트쿠폰 상태 변경하기
	 * */
	@RequestMapping("admin/coupon/changeEventCouponState")
	@ResponseBody
	public void changeEventCouponState(Coupon coupon, CouponState couponState) {
		coupon.setCouponState(couponState);
		couponService.updateEventCouponState(coupon);
		
	}
	
	/**
	 * 학생이 쿠폰 다운로드할 수 있는 페이지
	 * */
	@RequestMapping("main/class/issueCouponList")
	public void issueCouponList() {
		
	}
	
	/**
	 * 학생이 쿠폰 다운로드 하는 기능
	 * */
	@RequestMapping("main/class/insertIssueCoupon")
	public String insertIssueCoupon(Student student , Coupon coupon) {
		
		IssueCoupon issueCoupon = new IssueCoupon(null, student, coupon, null, null, null);
		couponService.insertIssueCoupon(issueCoupon);
		
		return "redirect:/main/mypage/couponList";
	}
	
	
}
