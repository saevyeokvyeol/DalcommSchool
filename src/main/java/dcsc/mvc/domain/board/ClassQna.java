package dcsc.mvc.domain.board;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
@Table(name = "classQna")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ClassQna {
	private int qnaId;
	private String studentId;
	private int classId;
	private String qnaTitle;
	private String qnacontent;
	private String secretState;
	private String blindState;
	
	@CreationTimestamp
	private LocalDateTime qnaInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime qnaUpdateDate;
	
	private String qnaComplete;
	
	
}
