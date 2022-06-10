package dcsc.mvc.repository.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import dcsc.mvc.domain.user.PlaceInfra;

public interface PlaceInfraRepository extends JpaRepository<PlaceInfra, Long> {
	
	@Query("delete p from PlaceInfra p where p.placeId=?1")
	void deletePlaceInfra(Long placeId);
}
