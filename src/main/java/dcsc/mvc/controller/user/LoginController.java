package dcsc.mvc.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/main/login")
public class LoginController {

	@RequestMapping("/loginForm")
	public String autoError(HttpSession session) {
		session.setAttribute("msg", "로그인 후 이용 가능합니다");
		return "redirect:/";
	}
	
	
}
