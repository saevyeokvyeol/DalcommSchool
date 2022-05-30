package dcsc.mvc.repository.classes;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.classes.Adjust;

public interface AdjustRepository extends JpaRepository<Adjust, Long> {
	
}