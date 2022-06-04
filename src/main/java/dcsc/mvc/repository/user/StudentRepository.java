package dcsc.mvc.repository.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import dcsc.mvc.domain.user.Student;

public interface StudentRepository extends JpaRepository<Student, String> {
	
	/**
	 * 아이디, 휴대폰, 이메일 중복체크
	 * */
	boolean findByStudentId(String studentId);
	
	boolean findByStudentPhone(String studentPhone);
	
	boolean findByStudentEmail(String studentEmail);
	
	/**
	 * 아이디, 이름, 핸드폰, 이메일 등등으로 학생 조회하기
	 * keyword(검색어), key field(컬럼명)
	 * */
	
	
	//아이디 찾기
	@Query("select s.studentId from Student s where s.studentName = ?1 and s.studentPhone = ?2")
	String selectStudentId(String studentName, String studentPhone);
	
	
}
