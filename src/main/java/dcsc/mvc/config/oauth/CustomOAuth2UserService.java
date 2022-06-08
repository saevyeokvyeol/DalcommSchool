package dcsc.mvc.config.oauth;

import java.util.Collections;

import javax.persistence.Entity;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import dcsc.mvc.domain.user.Student;
import dcsc.mvc.repository.user.StudentRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {
	
	private final StudentRepository studentRepository;
	private final HttpSession session;
	

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		
		OAuth2UserService delegate = new DefaultOAuth2UserService();
		OAuth2User oAuth2User = delegate.loadUser(userRequest);
		
		 /* OAuth2 서비스 id 구분코드 ( 구글, 카카오, 네이버 ) */
		String registrationId = userRequest
										.getClientRegistration()
										.getRegistrationId();
		
		 /* OAuth2 로그인 진행시 키가 되는 필드 값 (PK) (구글의 기본 코드는 "sub") */
		String userNameAttributeName = userRequest
										.getClientRegistration()
										.getProviderDetails()
										.getUserInfoEndpoint()
										.getUserNameAttributeName();
	
		/* OAuth2UserService */
		OAuthAttributes attributes = OAuthAttributes.of(registrationId, userNameAttributeName, oAuth2User.getAttributes());

	 	//Student student = saveOrUpate(attributes);
		
	 	/* 세션 정보를 저장하는 직렬화된 도메인 클래스 */
//	 	session.setAttribute("student", new SessionUser(student));
//		
		return null;
		
//		return new DefaultOAuth2User( Collections.singleton(new SimpleGrantedAuthority(student.getRole())), 
//				attributes.getAttributes() , attributes.getNameAttributeKey());
	}

	/* 소셜 로그인시 기존 회원이 존재할때 로직 */
//	private Student saveOrUpate(OAuthAttributes attributes) {
//		Student student = studentRepository.findByStudentEmail(attributes.getStudentEmail()).orElse(attributes.toEntity());
//		
//		return studentRepository.save(student);
//	}

}
