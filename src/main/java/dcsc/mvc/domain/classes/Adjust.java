package dcsc.mvc.domain.classes;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Entity
@Table(name = "adjust")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class Adjust {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "adjust_no")
	@SequenceGenerator(sequenceName = "adjust_no",allocationSize = 1,name = "adjust_no")
	private Long adjustNo;
	
	@ManyToOne
	@JoinColumn(name = "teacher_id")
	private String teacherId;
	private int adjustStateId;
	private int adjustPrice;
	private String bank;
	private String depositor;
	private String account;
	
	private LocalDateTime adjustInsertDate;
	private LocalDateTime adjustCompleteDate;
	
}
