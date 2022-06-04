package dcsc.mvc.domain.classes;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Search {
	private Long placeRegion;
	private Long classCategory;
	private String keyword;
	private String sort;
}
