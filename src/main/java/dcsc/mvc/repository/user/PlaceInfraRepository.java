package dcsc.mvc.repository.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import dcsc.mvc.domain.user.PlaceInfra;

public interface PlaceInfraRepository extends JpaRepository<PlaceInfra, Long> {
	
	@Query(value ="delete * from place infra where place_id=?1", nativeQuery=true)
	void deletePlaceInfra(Long placeId);
}
