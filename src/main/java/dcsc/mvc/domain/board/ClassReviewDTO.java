package dcsc.mvc.domain.board;

import java.time.LocalDateTime;

import dcsc.mvc.domain.classes.Classes;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ClassReviewDTO {

	private String studentId;
	
	private String reviewContent;
	private Long reviewId;
	private String reviewImg;
	private String reviewInsertDate;
	private String reviewRate;
	private String reviewBlindState;
	private Classes classes;
	private String student;
}
