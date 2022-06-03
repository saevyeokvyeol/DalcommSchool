package dcsc.mvc.repository.user;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import dcsc.mvc.domain.board.Ask;
import dcsc.mvc.domain.board.ClassQna;
import dcsc.mvc.domain.board.ClassReview;
import dcsc.mvc.domain.classes.Book;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;

public interface StudentRepository extends JpaRepository<Student, String> {
	
	/**
	 * 아이디, 휴대폰 중복체크
	 * */
	Student findByStudentPhoneEquals(String studentPhone);
	
	//Student selectStudentById(String studentId);
	
	//@Query("select s.role from Student s where s.studentId = ?1")
	//String selectStudentRoleById(String studentId);
	
	
	
	/**
	 * 아이디, 이름, 핸드폰, 이메일 등등으로 학생 조회하기
	 * keyword(검색어), key field(컬럼명)
	 * 컬럼명에따라 다른 메소드 호출..!
	 * */
	Student findByStudentIdIsLike(String studentId);
	Student findByStudentNameIsLike(String studentName);
	Student findByStudentPhoneIsLike(String studentPhone);
	Student findByStudentEmailIsLike(String studentEmail);
	
	
	
	//아이디 찾기
	@Query("select s.studentId from Student s where s.studentName = ?1 and s.studentPhone = ?2")
	String selectStudentId(String studentName, String studentPhone);
	
	/**
	 * 비밀번호 찾기
	 * */
	@Query("select s.studentPwd from Student s where s.studentId = ?1 and s.studentName=?2 and s.studentPhone=?3")
	String selectStudentPwd(String studentId, String studentName, String studentPhone);
	
	
	
}
