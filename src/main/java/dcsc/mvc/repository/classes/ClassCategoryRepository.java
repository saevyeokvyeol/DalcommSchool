package dcsc.mvc.repository.classes;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.classes.ClassCategory;

public interface ClassCategoryRepository extends JpaRepository<ClassCategory, Long> {

}
