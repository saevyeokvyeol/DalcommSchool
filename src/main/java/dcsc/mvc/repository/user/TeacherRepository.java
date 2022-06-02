package dcsc.mvc.repository.user;

import java.sql.Connection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import dcsc.mvc.domain.user.Place;
import dcsc.mvc.domain.user.PlaceInfra;
import dcsc.mvc.domain.user.Teacher;

public interface TeacherRepository extends JpaRepository<Teacher, String> {

	/**
	 * 닉네임, 핸드폰 번호 중복체크
	 * 규칙 필요(완전히 같은거)
	 * */
	List<Teacher> findByTeacherId(String teacherId);
	
	List<Teacher> findByTeacherNickname(String teacherNickname);
	
	List<Teacher> findByTeacherPhone(String teacherPhone);
	
	//Teacher selectTeacherById(String teacherId);
//	Teacher selectRoleById(String teacherId);
	
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

}
