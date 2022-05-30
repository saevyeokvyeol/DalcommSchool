package dcsc.mvc.domain.classes;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import dcsc.mvc.domain.user.Student;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Like {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "like_id_seq")
	@SequenceGenerator(sequenceName = "like_id_seq" , allocationSize = 1 , name = "like_id_seq" )
	private Long like_id;
	//private Long class_id;
	//private String student_id;
	
	@OneToOne
	@JoinColumn(name = "class_id")
	private Class classes;
	
	@ManyToOne
	@JoinColumn(name = "student_id")
	private Student student;
	
}
