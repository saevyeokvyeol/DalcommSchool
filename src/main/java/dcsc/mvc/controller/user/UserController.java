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
	
	
	
}
