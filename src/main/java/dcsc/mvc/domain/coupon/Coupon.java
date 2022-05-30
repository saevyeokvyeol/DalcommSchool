package dcsc.mvc.domain.coupon;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
@Table(name = "coupon")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class Coupon {
	private int couponId;
	private String teacherId;
	private int classId;
	private int couponStateId;
	private String couponName;
	private int couponDc;
	
	@CreationTimestamp
	private LocalDateTime couponInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime couponUpdateDate;
	
	private String couponEndDate;
	
}
