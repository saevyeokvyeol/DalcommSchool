package dcsc.mvc.controller.coupon;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.coupon.Coupon;
import dcsc.mvc.domain.coupon.IssueCoupon;
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
	@RequestMapping("teacher/coupon/couponList_th")
	public void selectAllCouponByClassId(Long classId, Model model) {
		classId = 2L;
		
		List<Coupon> list = couponService.selectByClassId(classId);
		model.addAttribute("list", list);
	}
	
	/**
	 * 전체 발급 쿠폰 조회 기능 ; 선생님
	 * */
	@RequestMapping("teacher/coupon/couponAllList_th")
	public void selectAllCouponByTeacherId(String teacherId, Model model) {
		teacherId = "Tann1234";
		
		List<Coupon> list = couponService.selectByTeacherId(teacherId);
		model.addAttribute("list", list);
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
	/*@RequestMapping("couponInsert")
	public String couponInsert(Coupon coupon, Classes classes, Teacher teacher, CouponState couponState ) {
		
	}*/
	
}
