package dcsc.mvc.repository.classes;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.classes.Like;

public interface LikeReposiroty extends JpaRepository<Like, Long> {

}
