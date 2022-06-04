package dcsc.mvc.repository.coupon;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.coupon.IssueCoupon;

public interface IssueCouponRepository extends JpaRepository<IssueCoupon, Long> {

	/**
	 * 자신이 보유한(발급 받은) 쿠폰 조회 기능; 학생
	 * @param studentId (검색 기준)
	 * @return List<IssueCoupon>
	 * */
	List<IssueCoupon> findByStudentStudentIdEquals(String studentId);
	
}
