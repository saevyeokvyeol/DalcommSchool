package dcsc.mvc.domain.classes;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
@Table(name = "classState")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class ClassState {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "state_id")
	@SequenceGenerator(sequenceName = "state_id",allocationSize = 1,name = "state_id")
	 private Long stateId;
	 private String stateName;
}
