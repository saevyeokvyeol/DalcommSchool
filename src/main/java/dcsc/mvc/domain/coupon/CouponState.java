package dcsc.mvc.domain.coupon;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
@Table(name = "couponState")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class CouponState {
	private int couponStateId;
	private String couponStateName;
}
