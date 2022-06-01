package dcsc.mvc.repository.classes;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import dcsc.mvc.domain.classes.ClassSchedule;

public interface ClassScheduleRepository extends JpaRepository<ClassSchedule, Long>, QuerydslPredicateExecutor<ClassSchedule> {
	List<ClassSchedule> findByClassesTeacherTeacherIdEquals(String teacherId);
	
	List<ClassSchedule> findByClassesClassIdEquals(Long ClassId);
}
