package dcsc.mvc.domain.user;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
public class PlaceRegion {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "region_id_seq")
	@SequenceGenerator(sequenceName = "region_id_seq", allocationSize = 1, name = "region_id_seq")
	private Long regionId; 
	
	@OneToMany(mappedBy = "placeRegion")
	private List<Place> place;
	
	private String regionName;
}
