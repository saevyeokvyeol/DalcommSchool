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
	private LocalDateTime reviewInsertDate;
	private int reviewRate;
	private LocalDateTime reviewUpdateDate;
	private String reviewBlindState;
	private String className;
}
