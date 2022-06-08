package dcsc.mvc.repository.classes;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.classes.Book;

public interface BookRepository extends JpaRepository<Book, Long> {
	
	List<Book> findByStudentStudentIdEquals(String StudentId);
	
	List<Book> findByClassesTeacherTeacherIdEquals(String teacherId);
	
	List<Book> findByClassesClassIdEquals(Long classId);
	
	List<Book> findByClassScheduleScheduleIdEquals(Long scheduleId);
}
