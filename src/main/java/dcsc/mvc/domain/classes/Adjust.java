package dcsc.mvc.domain.classes;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


//@Entity
@Table(name = "adjust")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class Adjust {
	private int adjustNo;
	private String teacherId;
	private int adjustStateId;
	private int adjustPrice;
	private String bank;
	private String depositor;
	private String account;
	
	private LocalDateTime adjustInsertDate;
	private LocalDateTime adjustCompleteDate;
	
}
