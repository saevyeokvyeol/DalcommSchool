package dcsc.mvc.domain.classes;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import dcsc.mvc.domain.user.Teacher;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Classes {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "class_id_seq")
	@SequenceGenerator(sequenceName = "class_id_seq", allocationSize = 1 , name = "class_id_seq")
	private Long classId;
	
	private String className;
	
	private String classInfo;
	
	private int classPrice;
	
	@CreationTimestamp
	private LocalDateTime classInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime classUpdateDate;
	
	private LocalDateTime classOpenDate;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id")
	private ClassCategory classCategory;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "teacher_id")
	private Teacher teacher;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "state_id")
	private ClassState classState;
	
}
