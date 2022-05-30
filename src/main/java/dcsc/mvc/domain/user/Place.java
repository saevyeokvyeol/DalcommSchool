package dcsc.mvc.domain.user;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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

public class Place {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "place_id")
	@SequenceGenerator(sequenceName = "place_id",allocationSize = 1,name = "place_id")
	private Long place_id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "teacher_id")
	private Teacher teacher;
	
	private String place_name;
	private String place_region;
	private String place_addr;
	private String detail_addr;
	private String place_route;
}
