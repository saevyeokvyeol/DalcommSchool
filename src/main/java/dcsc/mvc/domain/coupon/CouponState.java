package dcsc.mvc.domain.coupon;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class CouponState {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "coupon_state_id_seq")
	@SequenceGenerator(sequenceName = "coupon_state_id_seq",allocationSize = 1,name = "coupon_state_id_seq")
	private Long couponStateId;
	private String couponStateName;
}
