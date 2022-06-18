package dcsc.mvc.config.security;

import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
			HttpSession session = request.getSession(true);
			session.removeAttribute("msg");
			response.sendRedirect("/");
		

		}

		/**
		 * 로그인 하기 전의 요청했던 URL을 알아낸다.
		 * 
		 * @param request
		 * @param response
		 * @return
		 */
		private String getReturnUrl(HttpServletRequest request, HttpServletResponse response) {
			RequestCache requestCache = new HttpSessionRequestCache();
			SavedRequest savedRequest = requestCache.getRequest(request, response);
			if (savedRequest == null) {
				return request.getSession().getServletContext().getContextPath();
			}
			return savedRequest.getRedirectUrl();
		}

}
