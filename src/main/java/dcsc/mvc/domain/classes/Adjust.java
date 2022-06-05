package dcsc.mvc.domain.classes;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import dcsc.mvc.domain.user.Teacher;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class Adjust {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "adjust_no_seq")
	@SequenceGenerator(sequenceName = "adjust_no_seq", allocationSize = 1, name = "adjust_no_seq")
	private Long adjustNo;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "teacher_id")
	@JsonIgnore
	private Teacher teacher;
	private int adjustStateId;
	private int adjustPrice;
	private String bank;
	private String depositor;
	private String account;
	
	private LocalDateTime adjustInsertDate;
	private LocalDateTime adjustCompleteDate;
	
}
