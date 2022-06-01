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
	private Long region;
	private Long category;
	private String keyword;
	private String newClass;
	private String timeOut;
	private String sort;
}
