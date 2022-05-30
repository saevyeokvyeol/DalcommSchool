package dcsc.mvc.domain.classes;

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
@Table(name = "book")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Book {
	private int bookId;
	private String studentId;
	private String classId;
	private int scheduleId;
	private int couponNo;
	private int bookStateId;
	private int bookSeat;
	private int totalPrice;
	private String bookName;
	private String bookPhone;
	
	@CreationTimestamp
	private LocalDateTime bookInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime bookUpdateDate;
}
