package dcsc.mvc.controller.coupon;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
	
	public final StudentService studentService;
	
	//전체학생리스트 조회
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
	@RequestMapping("couponList")
	public List<IssueCoupon> selectAllIssueCouponByStudentId(String studentId, Model model) {
		studentId = "lee1234";
		
		List<IssueCoupon> list = couponService.selectByStudentId(studentId);
		
		return list;
	
	}
	
}
