package dcsc.mvc.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.service.user.TeacherService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main/login")
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
	public ModelAndView findId(String userName, String userPhone) {
		String userId = teacherService.selectId(userName, userPhone);
		
		return new ModelAndView("", "userId", userId); //(가지고 갈 경로, "가서 쓰는 쓸 이름", 가져갈 데이터);
	}
	
	/**
	 * 회원(강사,학생) 비밀번호 찾기
	 * */
	@RequestMapping("/findPwd")
	public void findPwd(String userId, String userName, String userPhone) {
		teacherService.selectPwd(userId, userName, userPhone);
		
	}
	
	/**
	 * 아이디 중복 체크
	 * */
	@RequestMapping("/checkId")
	public boolean checkId(String userId) {
		boolean result = teacherService.userIdCheck(userId);
		return result;
	}
	
	/**
	 * 
	 * */
	
//	@RequestMapping("/mypage")
//	public void teacherMypage(){}
//	
//	@RequestMapping("/updateProfile")
//	public void updateProfile() {}
//	
//	@RequestMapping("/updatePwd")
//	public void updatePwd() {}
	
	
}
