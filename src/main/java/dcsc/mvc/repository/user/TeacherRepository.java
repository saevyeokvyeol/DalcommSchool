package dcsc.mvc.repository.user;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import dcsc.mvc.domain.user.Teacher;

public interface TeacherRepository extends JpaRepository<Teacher, String> {

		
	
	Teacher findByTeacherNicknameEquals(String teacherNickname);
	
	Teacher findByTeacherPhoneEquals(String teacherPhone);
	
	@Query("select t from Teacher t where t.teacherId=?1")
	Teacher selectTeacherById(String teacherId);
	
	@Query("select t.role from Teacher t where t.teacherId = ?1")
	Teacher selectRoleById(String teacherId);
	
	/**
	 * 아이디, 이름, 핸드폰, 이메일 등등으로 강사 조회하기
	 * keyword(검색어), key field(컬럼명)
	 * 컬럼명에따라 다른 메소드 호출..!
	 * */
	List<Teacher> findByTeacherIdIsLike(String teacherId);
	List<Teacher> findByTeacherNameIsLike(String teacherName);
	List<Teacher> findByTeacherPhoneIsLike(String teacherPhone);
	List<Teacher> findByTeacherEmailIsLike(String teacherEmail);
	
	
	
	/**
	 * 선생님 아이디 찾기
	 * */
	@Query("select t.teacherId from Teacher t where t.teacherName=?1 and t.teacherPhone=?2")
	String selectTeacherId(String teacherName, String teacherPhone);
	
	/**
	 * 선생님 비밀번호 찾기
	 * */
	@Query("select t.teacherId from Teacher t where t.teacherId=?1 and t.teacherName=?2 and t.teacherPhone=?3")
	String selectTeacherPwd(String teacherId, String teacherName, String teacherPhone);
	
	/**
	 * 아이디 중복 체크
	 * */
	@Query("select t from Teacher t where t.teacherId = ?1")
	Teacher checkTeacherId(String userId);
	
	/**
	 * 로그인 
	 * */
	@Query("select t from Teacher t where t.teacherId = ?1 and t.teacherPwd = ?2 ")
	Teacher selectTeacherIdPwd(String userId, String userPwd);

}
