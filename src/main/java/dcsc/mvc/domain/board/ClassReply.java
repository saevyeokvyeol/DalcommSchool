package dcsc.mvc.domain.board;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "classReply")
@NoArgsConstructor
@AllArgsConstructor
public class ClassReply {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "reply_id")
	@SequenceGenerator(sequenceName = "reply_id",allocationSize = 1,name = "reply_id")
	private Long replyId;
	
	@ManyToOne
	@JoinColumn(name = "qna_id")
	private int qnaId;
	private String teacherId;
	
	@Column(length = 3000)
	private String replyContent;
	
	@CreationTimestamp
	private LocalDateTime replyInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime replyUpdateDate;
}
