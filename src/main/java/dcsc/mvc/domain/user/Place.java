package dcsc.mvc.domain.user;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "place")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class Place {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "place_id")
	@SequenceGenerator(sequenceName = "place_id",allocationSize = 1,name = "place_id")
	private Long place_id;
	
	@ManyToOne
	@JoinColumn(name = "teacher_id")
	private int teacher_id;
	
	private String place_name;
	private String place_region;
	private String place_addr;
	private String detail_addr;
	private String place_route;
}
