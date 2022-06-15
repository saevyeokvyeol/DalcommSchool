package dcsc.mvc.service.user;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import dcsc.mvc.domain.board.Ask;
import dcsc.mvc.domain.board.Event;
import dcsc.mvc.domain.user.Student;

public interface StudentService {

	/**
	 * 회원가입
	 * @param: Student student
	 * */
	void insertStudent (Student student);
	
	/**
	 * 로그인
	 * */
	Student login (String userId, String userPwd);
	
	
	/**
	 * 학생 회원 정보 수정
	 * */
	Student updateStudent(Student student);
	
	
	/**
	 * 회원 탈퇴하기(학생)
	 * @param: String studentId
	 * */
	void deleteStudent (String userId, String userPwd);
	

	/**
	 * 학생 조회하기
	 * @param: 
	 * @return: List<Student>
	 * */
	List<Student> selectAllStudent ();
	
	
	/**
	 * 학생 조회 페이징처리
	 * */
	Page<Student> selectAllStudent(Pageable pageable);
	
	
	/**
	 * 학생 상세 정보 조회
	 * 아이디 클릭시 해당 상세 정보 모달창으로 띄움
	 * */
	Student selectStudent(String studentId);
	
	
	/**
	 * 아이디, 이름 등등으로 학생 조회하기
	 * @param: String keyword(검색어), String keyfield(컬럼명)
	 * @return: List<Student>
	 * */
	Page<Student> selectByStudentId (String keyfield, String keyword, Pageable pageable);
	
	
	/**
	 * 탈퇴시 비밀번호 비교
	 * */
	boolean checkPwd(String userPwd);

	/**
	 * 신규 학생 수 검색
	 * @return: List<Student>
	 * */
	List<Student> selectNewStudent();
	
	
}
