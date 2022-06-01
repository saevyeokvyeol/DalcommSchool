package dcsc.mvc.repository.user;

import java.sql.Connection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import dcsc.mvc.domain.user.Place;
import dcsc.mvc.domain.user.PlaceInfra;
import dcsc.mvc.domain.user.Teacher;

public interface TeacherRepository extends JpaRepository<Teacher, String> {

	@Query("select t.teacher_id from teacher t where t.teacher_name = ?1 and t.teacher_phone = ?2")
	String selectTeacherId(String teacherName, String teacherPhone);
	
}
