package dcsc.mvc.domain.classes;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class FullCalendar {
	private Long id;
	private Long groupId;
	private String title;
	private String start;
	private String end;
}
