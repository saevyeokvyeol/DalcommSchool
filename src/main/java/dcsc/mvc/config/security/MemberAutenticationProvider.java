//package dcsc.mvc.config.security;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.springframework.security.authentication.AuthenticationProvider;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
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
//		//Student student = null;
//		//Teacher teacher = null;
//		
//		//1. username = id를 꺼내서 Member테이블에 사용자 정보를 가져온다.
//		String id = authentication.getName();
//		Student student = str.selectStudentById(id);
//		Teacher teacher = tcr.selectTeacherById(id);
//		
//		//회원 테이블에 사용자 정보 없으면 강사 테이블에서 찾는다. 없다면 예외 발생
//		if(student==null && teacher==null) { //일반회원정보 없음
//				throw new UsernameNotFoundException(id + "에 해당하는 회원 정보가 없습니다.");
//			}
//		
//		//회원 정보있으면 인수 전달된 평문과 디비에 저장된 암호화 비번을 비교한다
//		String pass = authentication.getCredentials().toString(); //사용자가 친 비번 가져옴
//		
//			if(student!=null || teacher!=null) { //학생정보가 있다면 학생 정보와 비교
//		
//				if(student!=null) { 
//					boolean result = passwordEncoder.matches(pass, student.getStudentPwd());
//						if(result==false) { //예외 던짐
//							throw new UsernameNotFoundException("비밀번호가 틀렸습니다");
//						} else { //학생 구현체
//							
//							List<Student> studentList = str.findByStudentId(id);
//							List<SimpleGrantedAuthority> simpleGrantedList = new ArrayList<SimpleGrantedAuthority>();
//							
//							for(Student s : studentList) {
//								simpleGrantedList.add(new SimpleGrantedAuthority(s.getRole()));
//							}
//						 
//							return new UsernamePasswordAuthenticationToken(student, null, simpleGrantedList);
//					}
//				}else if(teacher!=null) {
//					boolean result = passwordEncoder.matches(pass, teacher.getTeacherPwd());
//						if(result) { //강사 구현체
//							List<Teacher> teacherList = tcr.findByTeacherId(id);
//							List<SimpleGrantedAuthority> simpleGrantedList = new ArrayList<SimpleGrantedAuthority>();
//						
//							for(Teacher t : teacherList) {
//								simpleGrantedList.add(new SimpleGrantedAuthority(t.getRole()));
//							}
//							return new UsernamePasswordAuthenticationToken(teacher, null ,simpleGrantedList);
//						}
//				}
//			}
//			return authentication;
//	}
//			
////			else { //학생정보, 선생정보 둘 다 없으면
////				throw new UsernameNotFoundException("일치하는 회원 정보가 없습니다");
////			}
//			
//			
////			return authentication;			
////	}
//	
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
//
