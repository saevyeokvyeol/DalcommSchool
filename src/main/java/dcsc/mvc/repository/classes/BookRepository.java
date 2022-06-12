package dcsc.mvc.repository.classes;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.classes.Book;

public interface BookRepository extends JpaRepository<Book, Long> {
	
	List<Book> findByStudentStudentIdEquals(String StudentId);
	
	Page<Book> findByStudentStudentIdEquals(String StudentId, Pageable pageable);
	
	List<Book> findByClassesTeacherTeacherIdEquals(String teacherId);
	
	Page<Book> findByClassesTeacherTeacherIdEquals(String teacherId, Pageable pageable);
	
	List<Book> findByClassScheduleScheduleIdEquals(Long scheduleId);
}
