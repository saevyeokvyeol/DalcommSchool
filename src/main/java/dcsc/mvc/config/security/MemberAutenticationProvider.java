//package dcsc.mvc.config.security;
//
//import org.springframework.security.authentication.AuthenticationProvider;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Service;
//
//import dcsc.mvc.domain.user.Student;
//import dcsc.mvc.domain.user.Teacher;
//import dcsc.mvc.repository.user.StudentRepository;
//import dcsc.mvc.repository.user.TeacherRepository;
//import lombok.RequiredArgsConstructor;
//
//@Service
//@RequiredArgsConstructor
//public class MemberAutenticationProvider implements AuthenticationProvider{
//	
//	private final StudentRepository str;
//	private final TeacherRepository tcr;
//	private final PasswordEncoder passwordEncoder;
//	
//	/**
//	 * 로그인 폼에서 username, password 전송되면 UsernamePasswordAuthenticationToken 객체를 만들어서 인수로 전달,
//	 * 전달된 인수에서 username 과 password를 꺼내서 인증처리 (로그인) 하고, 실패하면 예외 발생,
//	 * 성공하면 인증된 사용자 정보와 권한 가져와서 Authentication에 저장, 리턴한다
//	 * */
//	@Override
//	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
//		System.out.println("MemberAutenticationProvider authenticate 호출됨...");
//		
//		Student student = null;
//		Teacher teacher = null;
//		
//		//1. username = id를 꺼내서 Member테이블에 사용자 정보를 가져온다.
//		String id = authentication.getName();
//		student = str.selectStudentById(id);
//		
//		//회원 테이블에 사용자 정보 없으면 강사 테이블에서 찾는다. 없다면 예외 발생
//		if(student==null) { //일반회원정보 없음
//			teacher = tcr.selectTeacherById(id);
//			if(teacher==null) { //강사정보 없음
//				throw new UsernameNotFoundException(id + "에 해당하는 회원 정보가 없습니다.");
//			}
//		}
//		
//		//회원 정보있으면 인수 전달된 평문과 디비에 저장된 암호화 비번을 비교한다
//		String pass = authentication.getCredentials().toString(); //사용자가 친 비번 가져옴
//			if(student!=null) { //학생정보가 있다면 학생 정보와 비교
//				passwordEncoder.matches(pass, student.getStudentPwd());
//			} else if(teacher!=null) { //학생정보가 없다면 강사정보와 비교
//				passwordEncoder.matches(pass, teacher.getTeacherPwd());
//			}
//			
//		//일치하지 않으면 예외
//		
//		//일치하면 Authentication 구현체 생성, 객체안에 사용자 정보, 권한 저장
//		
//		//생성된 Authentication객체 리턴
//		
//		
//		return new UsernamePasswordAuthenticationToken(id, null, null);
//	}
//
//	/**
//	 * 인수로 전달 된 인증정보가 인증을 할 수 있는 유효한 객체인지 판단해주는 메소드
//	 * true를 리턴해야지만 authenticate 메소드가 호출된다 
//	 * */
//	@Override
//	public boolean supports(Class<?> authentication) {
//		System.out.println("MemberAutenticationProvider supports 호출됨...");
//		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
//	}
//
//}
