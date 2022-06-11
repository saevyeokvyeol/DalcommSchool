package dcsc.mvc.domain.board;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.user.Student;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ClassReview {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "classreview_id_seq")
	@SequenceGenerator(sequenceName = "classreview_id_seq" , allocationSize = 1 , name = "classreview_id_seq" )
	private Long reviewId;
	
	@Column(length = 500)
	private String reviewContent;
	
	@CreationTimestamp
	private LocalDateTime reviewInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime reviewUpdateDate;
	
	private String reviewImg;
	
	private int reviewRate;
	
	private String reviewBlindState = "false";
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "class_id")
	@JsonIgnore
	private Classes classes;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "student_id")
	@JsonIgnore
	private Student student;
	
	
}
