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
@Getter
@Setter
@Table(name = "classReply")
@NoArgsConstructor
@AllArgsConstructor
public class ClassReply {
	private int replyId;
	private int qnaId;
	private String teacherId;
	private String replyContent;
	
	@CreationTimestamp
	private LocalDateTime replyInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime replyUpdateDate;
}
