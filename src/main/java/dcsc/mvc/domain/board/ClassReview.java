package dcsc.mvc.domain.board;

import java.time.LocalDateTime;

import javax.persistence.Column;
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

import dcsc.mvc.domain.user.Student;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
//@Table(name = "classreview")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ClassReview {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "classreview_id_seq")
	@SequenceGenerator(sequenceName = "classreview_id_seq" , allocationSize = 1 , name = "classreview_id_seq" )
	private Long reviewId;
	//private Long classId;
	//private String studentId;
	
	@Column(length = 500)
	private String reviewContent;
	
	@CreationTimestamp
	private LocalDateTime reviewInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime reviewUpdateDate;
	
	private String reviewImg;
	
	private int reviewRate;
	
	private String reviewBlindState;
	
	//연관관계 - fk 설정
	@ManyToOne
	@JoinColumn(name = "class_id")
	private Class classes; //class 변수가 안써짐 
	
	@ManyToOne
	@JoinColumn(name = "student_id")
	private Student student;
	
}
