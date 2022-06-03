package dcsc.mvc.controller.user;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.service.user.StudentService;
import dcsc.mvc.service.user.TeacherService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	public final StudentService studentService;
	public final TeacherService teacherService;
	
	
	//관리자페이지
	@RequestMapping("/user/userList")
	public void adminStudent() {
		System.out.println("admin 호출...");
	}
	
	//관리자페이지에서 회원 검색
	@RequestMapping("/user/userSearch")
	public ModelAndView studentInquiry(String keyfield , String keyword) {
		System.out.println("keyfield : " + keyfield +" / " + "keyword : "+ keyword);
		System.out.println("memberInquiry 호출...");
		List<Student> list = studentService.selectByStudentId(keyfield , keyword);
		
		return new ModelAndView("/user/userList","studentList",list);
	}
	
	
	//관리자페이지
	@RequestMapping("/user/teacherList")
	public void adminTeacher() {
		System.out.println("admin 강사 조회 호출...");
	}
	
	//관리자페이지에서 강사 검색
	@RequestMapping("/user/teacherSearch")
	public ModelAndView techerInquiry(String keyfield , String keyword) {
		System.out.println("keyfield : " + keyfield +" / " + "keyword : "+ keyword);
		System.out.println("teacherInquiry 호출...");
		List<Teacher> list = teacherService.selectByTeacherId(keyfield, keyword);
		
		return new ModelAndView("admin/user/teacherList","teacherList",list);
	}

}
