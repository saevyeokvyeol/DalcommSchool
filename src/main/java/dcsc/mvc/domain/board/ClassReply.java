package dcsc.mvc.domain.board;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import dcsc.mvc.domain.user.Teacher;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ClassReply {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "reply_id_seq")
	@SequenceGenerator(sequenceName = "reply_id_seq",allocationSize = 1,name = "reply_id_seq")
	private Long replyId;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "qna_id")
	@JsonIgnore
	private ClassQna classQna;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "teacher_id")
	@JsonIgnore
	private Teacher teacher;
	
	@Column(length = 3000)
	private String replyContent;
	
	@CreationTimestamp
	private LocalDateTime replyInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime replyUpdateDate;
}
