package dcsc.mvc.domain.user;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
@Table(name = "place")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class Place {
	private int place_id;
	private int teacher_id;
	private String place_name;
	private String place_region;
	private String place_addr;
	private String detail_addr;
	private String place_route;
}
