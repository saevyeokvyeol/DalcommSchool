package dcsc.mvc.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
        http
			.authorizeRequests() 
			.antMatchers("/main/login/login")
			.hasAnyRole("STUDENT","TEACHER","ADMIN")
			.antMatchers("/main/**")
			.authenticated()
			.antMatchers("/admin/**")
			.hasRole("ADMIN")
			.and()
            .formLogin()
            .loginPage("/main/login/login")
            .loginProcessingUrl("/login")
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
			.and();
	}
	
}
