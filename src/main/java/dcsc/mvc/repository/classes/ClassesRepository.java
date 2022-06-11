package dcsc.mvc.repository.classes;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import dcsc.mvc.domain.classes.Classes;

public interface ClassesRepository extends JpaRepository<Classes, Long>, QuerydslPredicateExecutor<Classes> {
	

	List<Classes> findByTeacherTeacherIdEquals(String teacherId);

	Page<Classes> findByTeacherTeacherIdEquals(String teacherId, Pageable pageable);

}
