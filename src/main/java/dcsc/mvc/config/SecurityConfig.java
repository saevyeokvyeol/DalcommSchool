/*
 * package dcsc.mvc.config;
 * 
 * import org.springframework.context.annotation.Bean; import
 * org.springframework.context.annotation.Configuration; import
 * org.springframework.security.config.annotation.authentication.builders.
 * AuthenticationManagerBuilder; import
 * org.springframework.security.config.annotation.web.builders.HttpSecurity;
 * import
 * org.springframework.security.config.annotation.web.builders.WebSecurity;
 * import org.springframework.security.config.annotation.web.configuration.
 * EnableWebSecurity; import
 * org.springframework.security.config.annotation.web.configuration.
 * WebSecurityConfigurerAdapter; import
 * org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
 * 
 * @Configuration
 * 
 * @EnableWebSecurity //스프링 시큐리티 필터가 스프링 필터체인에 등록됨 public class SecurityConfig
 * extends WebSecurityConfigurerAdapter {
 * 
 * @Bean //비밀번호 암호화 public BCryptPasswordEncoder encodePwd() { return new
 * BCryptPasswordEncoder(); }
 * 
 * @Override protected void configure(HttpSecurity http) throws Exception { http
 * .authorizeRequests() .antMatchers("/main/myPage/**").authenticated()
 * .antMatchers("/admin/**").access("hasRole('ADMIN')")
 * .antMatchers("/teacher/**").access("hasRole('TEACHER') or hasRole('ADMIN')")
 * .anyRequest().permitAll() .and() .formLogin() .loginPage("/main/login/login")
 * .loginProcessingUrl("/login") .usernameParameter("id")
 * .passwordParameter("pwd") .defaultSuccessUrl("/")
 * .failureUrl("/main/login/login?error") .and() .logout() .logoutUrl("/logout")
 * .logoutSuccessUrl("/") .invalidateHttpSession(true)
 * .deleteCookies("JSESSIONID") .and(); }
 * 
 * @Override protected void configure(AuthenticationManagerBuilder auth) throws
 * Exception { //inMemory 등록 auth.inMemoryAuthentication()
 * .withUser("admin").password("{noop}1234").authorities("ADMIN");
 * 
 * }
 * 
 * 
 * }
 * 
 */