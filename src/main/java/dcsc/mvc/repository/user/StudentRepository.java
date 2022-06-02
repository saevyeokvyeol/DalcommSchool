package dcsc.mvc.repository.user;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import dcsc.mvc.domain.board.Ask;
import dcsc.mvc.domain.board.ClassQna;
import dcsc.mvc.domain.board.ClassReview;
import dcsc.mvc.domain.classes.Book;
import dcsc.mvc.domain.user.Student;

public interface StudentRepository extends JpaRepository<Student, String> {
	
	/**
	 * 아이디, 휴대폰 중복체크
	 * */
	List<Student> findByStudentId(String studentId);
	
	List<Student> findByStudentPhone(String studentPhone);
	
	
	
	/**
	 * 아이디, 이름, 핸드폰, 이메일 등등으로 학생 조회하기
	 * keyword(검색어), key field(컬럼명)
	 * */
	
	
	//아이디 찾기
	@Query("select s.studentId from Student s where s.studentName = ?1 and s.studentPhone = ?2")
	String selectStudentId(String studentName, String studentPhone);
	
	
}
