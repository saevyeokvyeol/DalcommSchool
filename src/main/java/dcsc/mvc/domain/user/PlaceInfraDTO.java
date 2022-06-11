package dcsc.mvc.domain.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class PlaceInfraDTO {
	
	private Long placeInfraId;
	private Long placeId;
	private Long infraId;
	private String infraName;
}
