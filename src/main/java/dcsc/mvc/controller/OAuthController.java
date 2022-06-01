package dcsc.mvc.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/oauth")
public class OAuthController {

	/**
	 * 카카오 로그인 - Query String으로 넘어오는 코드추출
	 * */
	@ResponseBody
	@GetMapping("/kakaoLogin")
	public void kakaologin(@RequestParam String code) {
		System.out.println(code);
	}
	
	
}
