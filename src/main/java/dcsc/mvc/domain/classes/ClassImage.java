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

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
//@Table(name = "classimage")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ClassImage {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "classimage_id_seq")
	@SequenceGenerator(sequenceName = "classimage_id_seq", allocationSize = 1 , name = "classimage_id_seq")
	private Long ImageId;
	//private classId;
	
	private String thumbnailState;
	
	private String ImageName;
	
	@CreationTimestamp
	private LocalDateTime ImageInsertDate;
	
	@ManyToOne
	@JoinColumn(name = "class_id")
	private Class classes;
	
}
