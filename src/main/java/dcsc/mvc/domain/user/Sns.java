package dcsc.mvc.domain.user;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Sns {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "sns_id_seq")
	@SequenceGenerator(sequenceName = "sns_id_seq" , allocationSize = 1 , name = "sns_id_seq")
	private String snsId;
	
	private String snsType;
	
	private String snsUrl;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "teacher_id")
	private Teacher teacher;
	
}
