package dcsc.mvc.service.user;

import java.util.List;
import java.util.Optional;

import javax.management.RuntimeErrorException;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import dcsc.mvc.domain.board.Ask;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.repository.user.StudentRepository;
import dcsc.mvc.repository.user.TeacherRepository;
import lombok.RequiredArgsConstructor;

@Service //생성
@RequiredArgsConstructor
@Transactional
public class StudentServiceImpl implements StudentService {

	private final StudentRepository studentRep;
	private final TeacherRepository teacherRep;
	
	//private final Student student;
	//private final Teacher teacher;
	
	private final BCryptPasswordEncoder getBCryptPasswordEncoder;
	
	
	/**
	 * 회원가입
	 * */
	@Override
	public void insertStudent(Student student) { 
		System.out.println(student);
		
//		인수로 들어오는 비밀번호 암호화
		String rawPassword = student.getStudentPwd();
		String encPassword = getBCryptPasswordEncoder.encode(rawPassword); 
		student.setStudentPwd(encPassword);
		
		Student stu = studentRep.save(student);
		if(stu==null) {
			new RuntimeException("회원가입에 실패했습니다.");
		}
	}
	
	/**
	 * 로그인
	 * */
	@Override
	public Student login(String userId, String userPwd) {
		Student student = studentRep.selectStudentIdPwd(userId, userPwd);

		return student;
	}
	
	/**
	 * 학생 회원 정보 수정
	 * */
	@Override
	public void updateStudent(Student student) {
		Student stu = studentRep.save(student);
		if(stu==null) {
			new RuntimeException("회원 정보 수정에 실패했습니다.");
		}
	}
	
	

	/**
	 * 회원 탈퇴
	 * */
	@Override
	public void deleteStudent(String userId, String userPwd) { 
		//아이디 비밀번호 입력 받은 후 탈퇴	
		studentRep.deleteById(userId);
	}
	
	/**
	 * 전체 학생 조회
	 * */
	@Override
	public List<Student> selectAllStudent() { 
		List<Student> stuList = studentRep.findAll();
		
		if(stuList==null) {
			throw new RuntimeException("조회 가능한 회원 데이터가 없습니다.");
		}
		
		return stuList;
	}
	
	/**
	 * 학생 상세 정보 조회 (아이디로 검색)
	 * */
	@Override
	public Student selectStudent(String studentId) {
		Student s = studentRep.findById(studentId).orElse(null);
			if(s==null) {
				throw new RuntimeException("해당하는 학생 상세정보가 없습니다.");
			}
		return s;
	}
	
	
	/**
	 * 아이디, 이름, 핸드폰, 이메일 등등으로 학생 조회하기
	 * keyword(검색어), key field(컬럼명)
	 * */
	@Override
	public List<Student> selectByStudentId(String keyfield, String keyword) { 
		List<Student> list = null;
		switch(keyfield) {
				case "studentID" :
					System.out.println("studentID...");
					list = studentRep.findByStudentIdIsLike(keyword);
					break;
					
				case "studentName" :
					System.out.println("studentName...");
					list = studentRep.findByStudentNameIsLike(keyword);
					break;	
					
				case "studentPhone" :
					System.out.println("studentPhone...");
					list = studentRep.findByStudentIdIsLike(keyword);
					break;	
					
				case "studentEmail" :
					System.out.println("studentEmail...");
					list = studentRep.findByStudentIdIsLike(keyword);
					break;	
		}
		return list;
	}

}
