package dcsc.mvc.controller.coupon;

import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import dcsc.mvc.domain.coupon.Coupon;
import dcsc.mvc.domain.coupon.IssueCoupon;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.service.coupon.CouponService;
import dcsc.mvc.service.user.StudentService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class AjaxCouponController {
	
	private final CouponService couponService;
	private final StudentService studentService;
	
	/**
	 * 전체 학생 리스트 조회
	 * */
	/*@RequestMapping("/userList")
	public List<Student> adminStudent() {
		
		List<Student> studentList = studentService.selectAllStudent();
		
		return studentList;
	}*/
	
	//학생 기준 가지고 있는 쿠폰 조회 - 관리자 측면
	/*@RequestMapping("/studentCouponList")
	public List<IssueCoupon> selectAllIssueCoupontoStudent(String studentId) {
		//studentId = "lee1234";
		//System.out.println(studentId);
		
		List<IssueCoupon> list = couponService.selectByStudentId(studentId);
		//System.out.println(list.size());
		
		return list;
	
	}*/
	
	/**
	 * 자신이 보유한(발급 받은) 쿠폰 조회 기능; 학생
	 * */
	@RequestMapping("/couponList")
	public List<IssueCoupon> selectAllIssueCouponByStudentId(String studentId, Model model) {
		studentId = "lee1234";
		
		List<IssueCoupon> list = couponService.selectByStudentId(studentId);
		
		return list;
	
	}
	
	/**
	 * 이벤트 쿠폰 수정 폼
	 * */
	@RequestMapping("/eventCouponUpdateForm")
	public Coupon eventCouponUpdateForm(Long couponId) {
			
		Coupon coupon = couponService.selectByCouponId(couponId);
			
		return coupon;
	}
	
	/**
	 * 클래스 쿠폰 수정폼
	 * */
	@RequestMapping("/couponUpdateForm")
	public Coupon couponUpdateForm(Long couponId) {
		Coupon coupon = couponService.selectByCouponId(couponId);
		
		return coupon;
	}
	
	/**
	 * 클래스 쿠폰 가져오기
	 * */
	@RequestMapping("main/class/selectByClassIdAndState")
	public Coupon selectByClassId(Long classId) {
		Coupon coupon = couponService.selectByClassIdAndState(classId);
		
		if (coupon == null) {
			throw new RuntimeException();
		}
		
		return coupon;
	}
	
	/**
	 * 학생이 쿠폰 다운로드 하는 기능
	 * */
	@RequestMapping("main/class/insertIssueCoupon")
	public void insertIssueCoupon(Coupon coupon) {
		Student student = null;

		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof Student) {
			student = (Student)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		} else {
			throw new RuntimeException("로그인 후 이용해주세요");
		}
		
		IssueCoupon issueCoupon = new IssueCoupon(null, student, coupon, null, null, null);
		couponService.insertIssueCoupon(issueCoupon);
	}
	
} 
