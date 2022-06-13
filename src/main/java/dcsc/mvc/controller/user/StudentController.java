package dcsc.mvc.controller.user;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dcsc.mvc.domain.user.Student;
import dcsc.mvc.service.user.StudentService;
import dcsc.mvc.service.user.TeacherService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	private TeacherService teacherService;
	
	
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
	@RequestMapping("/main/login/login")
	public void loginForm() {
		System.out.println("login 호출...");
	}

//	//로그인
	@RequestMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error, 
			 			@RequestParam(value = "exception", required = false) String exception,
			 			Model model) {
		
		model.addAttribute("error", error);
		model.addAttribute("exception", exception);
		
		return "/main/login/login";

	}

//	//로그인
//	@RequestMapping("/main/login/login")
//	public String login(String userId, String userPwd, HttpSession session) {
//		System.out.println("userId :" + userId + "userPwd : " + userPwd);
//		System.out.println("login 호출...");
//		
//		Student stu = studentService.login(userId, userPwd);
//		if(stu!=null) {
//			session.setAttribute("loginUser", stu);
//		} else if(stu==null) {
//			Teacher tch = teacherService.login(userId, userPwd);
//			if(tch!=null) {
//				session.setAttribute("loginUser", tch);
//			}
//		}
//		return "redirect:/";
//	}

	//회원 목록 상세보기 - 관리자
	@RequestMapping("/admin/user/studentDetail")
	public void studentDetail(String studentId) {
		System.out.println("studentDetail 호출...");
	}
	
	
	//마이페이지
	@PreAuthorize("isAuthenticated()")
	@RequestMapping("/main/mypage/myPage")
	public void myPage(HttpServletRequest request) {
		System.out.println("myPage 호출...");
		
		//Student student = (Student)authentication.getPrincipal(); 
		
		//Student student = (Student)principal.getName();
		//System.out.println("studentId : " + studentId);
		//Student student = studentService.selectStudent(studentId);
		//model.addAttribute("student",student);
		
	}
	
	
	//회원 정보 수정 폼
	@RequestMapping("/main/mypage/modifyForm")
	public ModelAndView modifyForm(HttpServletRequest request) {
		//로그인 한 유저 정보 불러오기
		System.out.println("회원 정보 수정");
		
		Student student = (Student)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//Student student = (Student)authentication.getPrincipal(); 
		
		//db에서 회원 정보 가져와서 폼에 넣기
		//System.out.println(studentId);
		//Student student = studentService.selectStudent(studentId);
		
		return new ModelAndView("main/mypage/modifyForm","student", student);
	}
	
	
	//회원 정보 수정
	@RequestMapping("/main/mypage/modify")
	public String modify(HttpServletRequest request, Student student, RedirectAttributes ra) {
		System.out.println("modify 호출...");
		
		studentService.updateStudent(student);
		
		Student stu = (Student)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//세션 회원정보 업데이트
		stu.setStudentPhone(student.getStudentPhone());
		stu.setStudentEmail(student.getStudentEmail());
		
		ra.addFlashAttribute("msg", "modSuccess");
		
		return "redirect:/main/mypage/modifyForm";
	}
	
	//회원 탈퇴 페이지 - 학생
	@RequestMapping("/main/mypage/deleteUserForm")
	public void deleteUserForm() {
		System.out.println("회원 탈퇴 페이지");
		
	}
	
	
	//회원 탈퇴 페이지 - 강사
	@RequestMapping("/teacher/teacherMypage/deleteUserForm")
	public void deleteTeacherForm() {
		System.out.println("강사 탈퇴 페이지");
		
	}

	
	//회원 탈퇴
	@RequestMapping("/main/mypage/deleteUser")
	public String deleteUser(String userId, String userPwd) {
		System.out.println("deleteUser 호출...");

		studentService.deleteStudent(userId, userPwd);
		
		SecurityContextHolder.clearContext(); //세션에 저장된 정보 삭제
		
		return "redirect:/main/login/deleteOk";
	}
	
	
	//회원 탈퇴 완료
	@RequestMapping("/main/login/deleteOk")
	public void deleteUser() {
	
	}

}
