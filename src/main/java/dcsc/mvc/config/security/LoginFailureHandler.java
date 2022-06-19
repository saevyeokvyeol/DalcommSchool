package dcsc.mvc.config.security;

import java.io.IOException;
import java.io.OutputStream;
import java.io.Writer;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Component
public class LoginFailureHandler implements AuthenticationFailureHandler{
	
//	private String userLoginId;
//	private String userLoginPwd;	

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
											AuthenticationException exception) throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		
		//String errorMessage = null;
		
		if (exception instanceof BadCredentialsException) {
			//errorMessage = "아이디 또는 비밀번호가 맞지 않습니다. 다시 확인해 주세요.";
			session.setAttribute("msg", "아이디 또는 비밀번호가 맞지 않습니다.\n다시 확인해 주세요.");
			
		} else if(exception instanceof InternalAuthenticationServiceException) {
			//errorMessage = "내부적으로 발생한 시스템 문제로 인해 요청을 처리할 수 없습니다. 관리자에게 문의하세요.";
			session.setAttribute("msg", "내부 시스템 문제로 인해 로그인 할 수 없습니다.\n관리자에게 문의하세요.");

			
		} else if (exception instanceof UsernameNotFoundException) {
			//errorMessage = "계정이 존재하지 않습니다. 회원가입 진행 후 로그인 해주세요.";
			session.setAttribute("msg", "아이디 또는 비밀번호가 맞지 않습니다.\n다시 확인해 주세요.");

		} else if (exception instanceof AuthenticationCredentialsNotFoundException) {
			//errorMessage = "로그인에 실패하였습니다. 관리자에게 문의하세요.";
			session.setAttribute("msg", "로그인에 실패하였습니다.\n관리자에게 문의하세요.");

		}
		
		new DefaultRedirectStrategy().sendRedirect(request, response, "/");	
		
		//url 한글 인코딩
		//errorMessage = URLEncoder.encode(errorMessage, "UTF-8");
		//request.setAttribute("errorMessage", errorMessage);
		//request.getRequestDispatcher("/WEB-INF/views/main/login/login.jsp").forward(request, response);
	}


}
