package dcsc.mvc.domain.classes;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ClassStatistics {
	private String className;
	private int bookCount;
	private int classTotalProfit;
}
