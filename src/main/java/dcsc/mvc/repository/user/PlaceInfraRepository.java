package dcsc.mvc.repository.user;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import dcsc.mvc.domain.user.PlaceInfra;

public interface PlaceInfraRepository extends JpaRepository<PlaceInfra, Long> {
	
	@Query(value = "delete from place_infra where place_id=?1", nativeQuery = true)
	@Modifying
	void deletePlaceInfra(Long placeId);
	
	/**
	 * 공방 아이디로 공방 인프라 가져오기
	 * */
	List<PlaceInfra> findByPlacePlaceId(Long placeId);
}
