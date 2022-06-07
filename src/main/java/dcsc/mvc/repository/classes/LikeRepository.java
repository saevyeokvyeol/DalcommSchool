package dcsc.mvc.repository.classes;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import dcsc.mvc.domain.classes.Likes;

public interface LikeRepository extends JpaRepository<Likes, Long> {
	
	@Query(value = "delete likes where student_id = ?1", nativeQuery = true)
	@Modifying
	void deleteByStudentId(String studentId);
	
	List<Likes> findByStudentStudentIdEquals(String studentId);
}
