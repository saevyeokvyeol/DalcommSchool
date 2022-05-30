package dcsc.mvc.repository.classes;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.classes.Likes;

public interface LikeRepository extends JpaRepository<Likes, Long> {

}
