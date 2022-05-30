package dcsc.mvc.repository.user;

import java.sql.Connection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.user.Place;
import dcsc.mvc.domain.user.PlaceInfra;
import dcsc.mvc.domain.user.Teacher;

public interface TeacherRepository extends JpaRepository<Teacher, String> {

	
}
