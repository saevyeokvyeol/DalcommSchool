package dcsc.mvc.controller.coupon;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.coupon.Coupon;
import dcsc.mvc.domain.coupon.CouponState;
import dcsc.mvc.domain.coupon.IssueCoupon;
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
	
	/**
	 * 자신이 보유한(발급 받은) 쿠폰 조회 기능; 학생
	 * */
	@RequestMapping("main/mypage/couponList")
	public void selectAllIssueCouponByStudentId(String studentId, Model model) {
		studentId = "lee1234";
		
		List<IssueCoupon> list = couponService.selectByStudentId(studentId);
		model.addAttribute("list", list);
	
	}
	
	/**
	 * 클래스 발급 쿠폰 조회 기능 ; 선생님
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
	@RequestMapping("teacher/coupon/couponAllList")
	public void selectAllCouponByTeacherId(String teacherId, Model model) {
		teacherId = "Tkim1234";
		
		List<Coupon> list = couponService.selectByTeacherId(teacherId);
		model.addAttribute("list", list);
	}
	
	/**
	 * 등록한 전체 쿠폰(클래스 쿠폰 + 이벤트 쿠폰)조회 기능 ; 관리자
	 * */
	@RequestMapping("admin/coupon/selectAllCoupon")
	public void selectAllCoupon(Model model) {
		List<Coupon> list = couponService.selectAll();
		model.addAttribute("list", list);
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
	public String changeCouponState(Coupon coupon, CouponState couponState) {
		coupon.setCouponState(couponState);
		couponService.updateCouponState(coupon);
		//System.out.println("changeCouponState = "+ coupon.getCouponState().getCouponStateName() );
		
		return "redirect:/";
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
	 * 이벤트 상태 변경하기
	 * */
	@RequestMapping("admin/coupon/changeEventCouponState")
	@ResponseBody
	public String changeEventCouponState(Coupon coupon, CouponState couponState) {
		coupon.setCouponState(couponState);
		couponService.updateCouponState(coupon);
		//System.out.println("changeCouponState = "+ coupon.getCouponState().getCouponStateName() );
		
		return "redirect:/";
	}
}
