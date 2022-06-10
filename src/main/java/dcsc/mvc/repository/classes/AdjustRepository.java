package dcsc.mvc.repository.classes;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.classes.Adjust;

public interface AdjustRepository extends JpaRepository<Adjust, Long> {
	
	/**
	 * 정산 내역 조회 기능
	 * @param String teacherId(검색기준)
	 * @return List<Adjust>
	 * */
	List<Adjust> findByTeacherTeacherIdEquals(String tearcherId);
	
	/**
	 * 정산 내역 조회 기능 - 페이징처리
	 * @param String teacherId(검색기준)
	 * @return List<Adjust>
	 * */
	Page<Adjust> findByTeacherTeacherIdEquals(String tearcherId, Pageable pageable);
	
}
