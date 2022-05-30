package dcsc.mvc.domain.coupon;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Entity
@Table(name = "issueCoupon")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class IssueCoupon {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "issue_no")
	@SequenceGenerator(sequenceName = "issue_no",allocationSize = 1,name = "issue_no")
	private Long issueNo;
	
	@ManyToOne
	@JoinColumn(name = "student_id")
	private String studentId;
	
	@ManyToOne
	@JoinColumn(name = "coupon_id")
	private int couponId;
	
	@CreationTimestamp
	private LocalDateTime issueStartDate;
	private LocalDateTime issueEndDate;
	
	private String issueUsable;
	
}