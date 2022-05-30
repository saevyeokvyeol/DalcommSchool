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

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Ask {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "ask_no_seq")
	@SequenceGenerator(sequenceName = "ask_no_seq" , allocationSize = 1 , name = "ask_no_seq" )
	private Long askNo; 
	//private String studentId;
	//private String teacherId;
	
	private String askTitle;
	
	private String askCategory;
	
	@Column(length = 500)
	private String askContent;
	
	private String askImg;
	
	@CreationTimestamp
	private LocalDateTime askInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime askUpdateDate;
	
	private String askComplete;
	
	@ManyToOne
	@JoinColumn(name = "student_id")
	private Student student;
	
	@ManyToOne
	@JoinColumn(name = "teacher_id")
	private Teacher teacher;
	
}
