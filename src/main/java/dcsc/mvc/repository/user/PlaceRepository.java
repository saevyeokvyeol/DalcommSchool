package dcsc.mvc.repository.user;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.user.Place;

public interface PlaceRepository extends JpaRepository<Place, Long> {

}
