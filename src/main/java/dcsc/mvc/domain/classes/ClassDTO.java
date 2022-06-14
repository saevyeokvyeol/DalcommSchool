package dcsc.mvc.domain.classes;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ClassDTO {
	private Long classId;
	
	private String className;
	
	private int classPrice;
	
	private String teacherNickname;
	
	private Long StateId;
	
	private String classImage;

	private Long likeId;
}
