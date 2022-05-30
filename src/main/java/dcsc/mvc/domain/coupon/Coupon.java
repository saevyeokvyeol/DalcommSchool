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
import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "coupon")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class Coupon {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "coupon_id")
	@SequenceGenerator(sequenceName = "coupon_id",allocationSize = 1,name = "coupon_id")
	private Long couponId;
	
	@ManyToOne
	@JoinColumn(name = "teacher_id")
	private String teacherId;
	
	@ManyToOne
	@JoinColumn(name = "class_id")
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
