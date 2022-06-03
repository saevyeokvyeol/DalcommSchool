package dcsc.mvc.repository.user;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.user.PlaceRegion;

public interface PlaceRegionRepository extends JpaRepository<PlaceRegion, Long> {

}
