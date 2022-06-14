package dcsc.mvc.domain.board;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ClassQnaReplyDTO {

	private Long qnaId;
	private String studentId;
	private String className;
	private LocalDateTime qnaInsertDate;
	private String qnaTitle;
	private String qnaComplete;
	private String qnaContent;
	private String blindState;
	private String secretState;
	
	private Long replyId;
	private String teacherNickname;
	private LocalDateTime replyInsertDate;
	private String replyContent;
	
	
	
}
