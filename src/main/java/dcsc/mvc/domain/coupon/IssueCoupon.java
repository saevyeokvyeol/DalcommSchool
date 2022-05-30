package dcsc.mvc.domain.coupon;

import java.time.LocalDateTime;

import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


//@Entity
@Table(name = "issueCoupon")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class IssueCoupon {
	private int issueNo;
	private String studentId;
	private int couponId;
	
	private LocalDateTime issueStartDate;
	private LocalDateTime issueEndDate;
	
	private String issueUsable;
	
}