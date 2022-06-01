package dcsc.mvc.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.service.user.TeacherService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main")
@RequiredArgsConstructor
public class TeacherController {
	
	public final TeacherService teacherService;
	
	/**
	 * 강사 회원가입 폼
	 * */
	@RequestMapping("/joinTeacher")
	public void joinTeacher() {}
	
	/**
	 * 강사 회원가입
	 * */
	@RequestMapping("/insert")
	public String insert(Teacher teacher) {
		teacherService.insertTeacher(teacher);
		
		return "redirect:/index";
	}
	
	/**
	 * 회원(강사,학생) 아이디 찾기
	 * */
	@RequestMapping("/findId")
	public void findId(String userName, String userPhone) {
		teacherService.selectId(userName, userPhone);
	}
	
	/**
	 * 회원(강사,학생) 비밀번호 찾기
	 * */
	@RequestMapping("/findPwd")
	public void findPwd(String userId, String userName, String userPhone) {
		teacherService.selectPwd(userId, userName, userPhone);
	}
	
	@RequestMapping("/mypage")
	public void teacherMypage(){}
	
	@RequestMapping("/updateProfile")
	public void updateProfile() {}
	
	@RequestMapping("/updatePwd")
	public void updatePwd() {}
	
	
}
