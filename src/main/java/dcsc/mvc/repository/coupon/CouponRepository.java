package dcsc.mvc.repository.coupon;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.coupon.Coupon;

public interface CouponRepository extends JpaRepository<Coupon, Long>{
	
}
