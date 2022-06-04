package dcsc.mvc.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.user.Student;
import dcsc.mvc.service.user.StudentService;

@Controller
@RequestMapping
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	//회원가입폼
	@RequestMapping("/main/login/joinStudent")
	public void joinStudent() {
		System.out.println("joinStudent 호출...");

	}
	
	//회원 가입하기 :: redirect 방식으로
	@RequestMapping(value="/main/login/join", method = RequestMethod.POST)
	public String insertStudent(Student student) {
		System.out.println("student :" + student);
		studentService.insertStudent(student);
		return "redirect:/";
	}
	
	//로그인폼
	@RequestMapping("/main/login/loginForm")
	public void loginForm() {
		System.out.println("login 호출...");
	}
	
//	//로그인
//	@RequestMapping("/main/login/login")
//	public void login(String userId, String userPwd) {
//		System.out.println("login 호출...");
//	}
	
	//회원 목록 상세보기 - 관리자
	@RequestMapping("/admin/user/studentDetail")
	public void studentDetail(String studentId) {
		System.out.println("studentDetail 호출...");
	}
	
	
	
	//마이페이지
	@RequestMapping("/main/mypage/myPage")
	public void myPage() {
		System.out.println("myPage 호출...");
	}
	
	//회원 정보 수정
	@RequestMapping("/main/mypage/modify")
	public void modify() {
		System.out.println("modify 호출...");
	}
	
	//회원 비밀번호 수정
	@RequestMapping("/main/mypage/modifyPwd")
	public void modifyPwd() {
		System.out.println("modifyPwd 호출...");
	}
	
	//회원 탈퇴
	@RequestMapping("/main/mypage/deleteUser")
	public void withdrawal(String userId, String userPwd) {
		System.out.println("deleteUser 호출...");
		studentService.deleteStudent(userId, userPwd);
	}
	

	//내 예약 조회
	@RequestMapping("/main/mypage/bookList")
	public void bookList() {
		System.out.println("bookList 호출...");
	}
	
	//내 쿠폰 조회
	@RequestMapping("/main/mypage/couponList")
	public void couponList() {
		System.out.println("couponList 호출...");
	}
	
	//내 클래스 문의 조회
	@RequestMapping("/main/mypage/faqList")
	public void faqList() {
		System.out.println("faqList 호출...");
	}
	
	//내 리뷰 조회
	@RequestMapping("/main/mypage/reviewList")
	public void reviewList() {
		System.out.println("reviewList 호출...");
	}

}
