package dcsc.mvc.repository.classes;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.classes.ClassState;

public interface ClassesStateReposiroty extends JpaRepository<ClassState, Long> {

}
