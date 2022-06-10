package dcsc.mvc.domain.user;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class PlaceInfra{

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "place_infra_id_seq")
	@SequenceGenerator(sequenceName = "place_infra_id_seq",allocationSize = 1,name = "place_infra_id_seq")
	private Long placeInfraId; 
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "place_id")
	@JsonIgnore
	private Place place; 
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="infra_id")
	@JsonIgnore
	private Infra infra;
	

}
