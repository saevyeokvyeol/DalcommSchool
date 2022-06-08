package dcsc.mvc.domain.board;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Answer {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "answer_no_seq")
	@SequenceGenerator(sequenceName = "answer_no_seq" , allocationSize = 1 , name = "answer_no_seq")
	private Long answerNo;
	
	@Column(length = 500)
	private String answerContent;
	
	@CreationTimestamp
	private LocalDateTime answerInsertDate;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ask_no")
	@JsonIgnore
	private Ask ask;
	
}
