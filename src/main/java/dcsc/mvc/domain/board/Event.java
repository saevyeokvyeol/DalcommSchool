package dcsc.mvc.domain.board;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Event {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "event_no_seq")
	@SequenceGenerator(sequenceName = "event_no_seq" , allocationSize = 1 , name = "event_no_seq")
	private Long event_no;
	
	private String event_title;
	
	@Column(length = 500)
	private String event_content;
	
	private String event_img;
	
	@CreationTimestamp
	private LocalDateTime event_insert_date;
	
	@UpdateTimestamp
	private LocalDateTime event_update_date;
	
	private int event_views;
	
}
