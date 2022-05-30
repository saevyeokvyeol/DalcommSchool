package dcsc.mvc.repository.user;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.board.Ask;
import dcsc.mvc.domain.board.ClassQna;
import dcsc.mvc.domain.board.ClassReview;
import dcsc.mvc.domain.classes.Book;
import dcsc.mvc.domain.user.Student;

public interface StudentRepository extends JpaRepository<Student, String> {

	
	
}
