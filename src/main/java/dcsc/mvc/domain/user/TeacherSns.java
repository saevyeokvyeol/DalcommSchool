package dcsc.mvc.domain.user;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

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
public class TeacherSns {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "sns_code_seq")
	@SequenceGenerator(sequenceName = "sns_code_seq" , allocationSize = 1 , name = "sns_code_seq")
	private Long teacherSnsCode;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "teacher_id")
	@JsonIgnore
	private Teacher teacher;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "sns_id")
	@JsonIgnore
	private Sns sns;
	
	private String teacherSnsId;
	
}
