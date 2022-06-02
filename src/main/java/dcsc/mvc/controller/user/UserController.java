package dcsc.mvc.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dcsc.mvc.domain.user.Student;
import dcsc.mvc.service.user.StudentService;

@Controller
@RequestMapping("/main")
public class UserController {
	
	@Autowired
	private StudentService studentService;
	
	//회원가입폼
	@RequestMapping("/login/joinStudent")
	public void joinStudent() {
		System.out.println("joinStudent 호출...");

	}
	
	//회원 가입하기 :: redirect 방식으로
	@RequestMapping(value="/login/join", method = RequestMethod.POST)
	public String insertStudent(Student student) {
		System.out.println("student :" + student);
		studentService.insertStudent(student);
		return "redirect:/index";
	}
	
	//로그인폼
	@RequestMapping("/login/login")
	public void login() {
		System.out.println("login 호출...");
	}
	
	//마이페이지
	@RequestMapping("/mypage/myPage")
	public void myPage() {
		System.out.println("myPage 호출...");
	}
	
	//회원 정보 수정
	@RequestMapping("/mypage/modify")
	public void modify() {
		System.out.println("modify 호출...");
	}
	
	//회원 비밀번호 수정
	@RequestMapping("/mypage/modifyPwd")
	public void modifyPwd() {
		System.out.println("modifyPwd 호출...");
	}
	
	//내가 남긴 일대일문의 조회
	@RequestMapping("/mypage/askList")
	public void askList() {
		System.out.println("askList 호출...");
	}
	
	//내 예약 조회
	@RequestMapping("/mypage/bookList")
	public void bookList() {
		System.out.println("bookList 호출...");
	}
	
	//내 쿠폰 조회
	@RequestMapping("/mypage/couponList")
	public void couponList() {
		System.out.println("couponList 호출...");
	}
	
	//내 클래스 문의 조회
	@RequestMapping("/mypage/faqList")
	public void faqList() {
		System.out.println("faqList 호출...");
	}
	
	//내 리뷰 조회
	@RequestMapping("/mypage/reviewList")
	public void reviewList() {
		System.out.println("reviewList 호출...");
	}
	
	
}
