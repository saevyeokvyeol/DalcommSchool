package dcsc.mvc.repository.classes;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import dcsc.mvc.domain.classes.Classes;

public interface ClassesRepository extends JpaRepository<Classes, Long>, QuerydslPredicateExecutor<Classes> {

}
