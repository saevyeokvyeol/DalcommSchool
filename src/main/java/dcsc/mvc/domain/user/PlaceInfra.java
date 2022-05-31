package dcsc.mvc.domain.user;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "placeInfra")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class PlaceInfra {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "infra_id")
	@SequenceGenerator(sequenceName = "infra_id",allocationSize = 1,name = "infra_id")
	private Long infraId; 
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "place_id")
	private Place place; 
	private String parking;
	private String wifi;
	private String elevator;
	private String genderToilet;
	private String kidsfriendly;
	private String etc;
}
