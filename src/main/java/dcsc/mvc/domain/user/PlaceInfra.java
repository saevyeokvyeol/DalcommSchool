package dcsc.mvc.domain.user;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
@Table(name = "placeInfra")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class PlaceInfra {
	private int infraId; 
	private int placeId; 
	private String parking;
	private String wifi;
	private String elevator;
	private String genderToilet;
	private String kidsfriendly;
	private String etc;
}
