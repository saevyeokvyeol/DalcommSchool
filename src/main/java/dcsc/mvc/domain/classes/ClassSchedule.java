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

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
//@Table(name = "classschedule")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ClassSchedule {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "classschedule_id_seq")
	@SequenceGenerator(sequenceName = "classschedule_id_seq" , allocationSize = 1 , name = "classschedule_id_seq")
	private Long scheduleId;
	//private Long classId;
	
	//작가가 정해서 등록하는것인데 string으로 받아야되는 것 아닌가?
	private LocalDateTime scheduleDate;
	private LocalDateTime startTime;
	private LocalDateTime endTime;
	
	@CreationTimestamp
	private LocalDateTime ScheduleInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime ScheduleUpdateDate;
	
	private int totalSeat;
	private int leftSeat;
	private int SchedulePrice;
	
	@ManyToOne
	@JoinColumn(name = "class_id")
	private Class classes;
	
}
