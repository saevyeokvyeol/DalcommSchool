package dcsc.mvc.service.user;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dcsc.mvc.domain.user.Student;
import dcsc.mvc.repository.user.StudentRepository;
import lombok.RequiredArgsConstructor;

@Service //생성
@RequiredArgsConstructor
@Transactional
public class StudentServiceImpl implements StudentService {

	private final StudentRepository studentRepository;
	
	/**
	 * 회원가입
	 * */
	@Override
	public void insertStudent(Student student) { 
		Student stu = studentRepository.save(student);
		if(stu==null) {
			new RuntimeException("회원가입에 실패했습니다.");
		}
	}
	
	/**
	 * 아이디 중복체크
	 * */
	@Override
	public boolean studentIdCheck(String studentId) { //아이디 중복체크
		boolean idCheck = studentRepository.findByStudentId(studentId);
		if(idCheck) new RuntimeException("이미 사용중인 아이디입니다.");
		
		return idCheck;
	}
	
	/**
	 * 휴대폰 번호 중복체크
	 * */
	@Override
	public boolean studentPhoneCheck(String studentPhone) { 
		boolean phoneCheck = studentRepository.findByStudentPhone(studentPhone);
		if(phoneCheck) new RuntimeException("이미 사용중인 휴대폰 번호 입니다.");
		return phoneCheck;
	}
	
	/**
	 * 이메일 중복체크
	 * */
	@Override
	public boolean studentEmailCheck(String studentEmail) {
		boolean emailCheck = studentRepository.findByStudentEmail(studentEmail);
		if(emailCheck) new RuntimeException("이미 사용중인 이메일주소입니다.");
		return emailCheck;
	}

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
