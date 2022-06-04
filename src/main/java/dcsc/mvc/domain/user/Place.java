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
@RequiredArgsConstructor
public class Place {
	
	@Id
	@NonNull
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "place_id_seq")
	@SequenceGenerator(sequenceName = "place_id_seq", allocationSize = 1, name = "place_id_seq")
	private Long placeId;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "teacher_id")
	private Teacher teacher;
	
	private String place_name;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "region_id")
	private PlaceRegion placeRegion;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "place_id")
	private PlaceInfra placeInfra;
	
	private String placeAddr;
	private String detailAddr;
	private String placeRoute;
}
