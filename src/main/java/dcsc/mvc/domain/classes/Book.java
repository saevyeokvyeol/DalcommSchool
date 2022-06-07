package dcsc.mvc.domain.classes;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import dcsc.mvc.domain.coupon.Coupon;
import dcsc.mvc.domain.coupon.IssueCoupon;
import dcsc.mvc.domain.user.Student;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;


@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class Book {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "book_id_seq")
	@SequenceGenerator(sequenceName = "book_id_seq",allocationSize = 1 , name = "book_id_seq")
	@NonNull
	private Long bookId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "student_id")
	@JsonIgnore
	private Student student;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "class_id")
	@JsonIgnore
	private Classes classes;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "schedule_id")
	@JsonIgnore
	private ClassSchedule classSchedule;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "issue_no")
	@JsonIgnore
	private IssueCoupon issueCoupon;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "book_state_id")
	@JsonIgnore
	private BookState bookState;
	private int bookSeat;
	private int totalPrice;
	private String bookName;
	private String bookPhone;
	
	@CreationTimestamp
	private LocalDateTime bookInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime bookUpdateDate;
}
