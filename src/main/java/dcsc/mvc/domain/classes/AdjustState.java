package dcsc.mvc.domain.classes;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
@Table(name = "adjustState")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class AdjustState {
	private int adjustStateId;
	private String adjustStateName;
}
