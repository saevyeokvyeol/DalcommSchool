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

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class AdjustState {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "adjust_state_id")
	@SequenceGenerator(sequenceName = "adjust_state_id",allocationSize = 1,name = "adjust_state_id")
	private Long adjustStateId;
	
	private String adjustStateName;
}
