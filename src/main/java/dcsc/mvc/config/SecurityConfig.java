
package dcsc.mvc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import dcsc.mvc.config.oauth.CustomOAuth2UserService;
import dcsc.mvc.config.security.MemberAutenticationProvider;
import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity //스프링 시큐리티 필터가 스프링 필터체인에 등록됨 
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	private final MemberAutenticationProvider authenticationProvider;
	private final CustomOAuth2UserService customOAuth2UserService;
	
	
	//회원 정보 수정시 세션 변경
	@Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }
	
	//static 관련 설정은 무시한다
	@Override
	public void configure(WebSecurity web) throws Exception {
		web
			.ignoring().antMatchers("/css/**", "/js/**", "/img/**");
		
	}
	

	@Override 
	protected void configure(HttpSecurity http) throws Exception {
		
		http
			.csrf().ignoringAntMatchers("/api/**") //rest API 사용 예외처리
			.and()
			.authorizeRequests() 
//			.antMatchers("/main/myPage/**").authenticated()
//			.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
//			.antMatchers("/teacher/**").access("hasRole('ROLE_TEACHER') or hasRole('ROLE_ADMIN')")
			.anyRequest().permitAll() 
			.and()
			.formLogin()
			.loginPage("/main/login/loginForm")
			.loginProcessingUrl("/main/login/login")
			.usernameParameter("id")
			.passwordParameter("pwd")
			.defaultSuccessUrl("/")
			.failureUrl("/main/login/login?error") 
			.and()
			.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true)
			.deleteCookies("JSESSIONID") 
			.and() /* OAuth */
			.oauth2Login()
			.loginPage("/main/login/loginForm")
			.userInfoEndpoint()
			.userService(customOAuth2UserService); 
		
		}
	
	@Override protected void configure(AuthenticationManagerBuilder auth) throws
	Exception { //inMemory 등록 
//		auth.inMemoryAuthentication().withUser("admin").password("{noop}1234").authorities("ADMIN");
		auth.authenticationProvider(authenticationProvider);
	
	}
	
 }

