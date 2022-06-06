package dcsc.mvc.domain.classes;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ClassSchedule {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "classschedule_id_seq")
	@SequenceGenerator(sequenceName = "classschedule_id_seq" , allocationSize = 1 , name = "classschedule_id_seq")
	private Long scheduleId;
	
	@Column(name = "schedule_date")
	@DateTimeFormat(pattern = "yyyy. MM. dd.")
	private Date scheduleDate;
	private String startTime;
	private String endTime;
	
	@CreationTimestamp
	private LocalDateTime ScheduleInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime ScheduleUpdateDate;
	
	private int totalSeat;
	private int leftSeat;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "class_id")
	@JsonIgnore
	private Classes classes;
	
	@OneToMany(mappedBy = "classSchedule")
	@JsonIgnore
	private List<Book> Books;
}
