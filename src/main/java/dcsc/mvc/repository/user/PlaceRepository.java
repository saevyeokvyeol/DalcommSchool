package dcsc.mvc.repository.user;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.user.Place;

public interface PlaceRepository extends JpaRepository<Place, Long> {

	/**
	 * 강사 아이디로 공방 정보 가져오기
	 * */
	Place findByTeacherTeacherIdEquals(String teacherId);
}
