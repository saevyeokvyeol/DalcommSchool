package dcsc.mvc.service.user;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import dcsc.mvc.domain.user.Student;
import dcsc.mvc.repository.user.StudentRepository;
import lombok.RequiredArgsConstructor;

@Service //생성
@RequiredArgsConstructor
@Transactional
public class StudentServiceImpl implements StudentService {

	private final StudentRepository studentRepository;
	
//	private final BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
//	/**
//	 * 회원가입
//	 * */
//	@Override
//	public void insertStudent(Student student) { 
//		System.out.println(student);
//		student.setRole("STUDENT");
//		student.setStudentQuit("F");
//		//인수로 들어오는 비밀번호 암호화
//		//String rawPassword = student.getStudentPwd();
//		String encPassword = bCryptPasswordEncoder.encode(student.getStudentPwd()); 
//		student.setStudentPwd(encPassword);
//		
//		Student stu = studentRepository.save(student);
//		if(stu==null) {
//			new RuntimeException("회원가입에 실패했습니다.");
//		}
//	}

	/**
	 * 회원 탈퇴
	 * */
	@Override
	public void deleteStudent(String studentId) { 
		studentRepository.deleteById(studentId);
	}
	
	/**
	 * 전체 학생 조회
	 * */
	@Override
	public List<Student> selectAllStudent() { 
		return studentRepository.findAll();
	}
	
	/**
	 * 학생 상세 정보 조회 (아이디로 검색)
	 * */
	@Override
	public Optional<Student> selectStudent(String studentId) {
		return studentRepository.findById(studentId);
	}
	
	
	/**
	 * 아이디, 이름, 핸드폰, 이메일 등등으로 학생 조회하기
	 * keyword(검색어), key field(컬럼명)
	 * */
	@Override
	public List<Student> selectByStudentId(String keyword, String keyfield) { 
		// TODO Auto-generated method stub
		return null;
	}


}
