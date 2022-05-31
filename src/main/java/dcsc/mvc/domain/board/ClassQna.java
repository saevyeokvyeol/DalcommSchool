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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.user.Student;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class ClassQna {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "qna_id")
	@SequenceGenerator(sequenceName = "qna_id",allocationSize = 1 , name = "qna_id")
	@NonNull
	private Long qnaId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "student_id")
	private Student student;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "class_id")
	private Classes classes;
	private String qnaTitle;
	
	@Column(length = 3000)
	private String qnacontent;
	private String secretState;
	private String blindState;
	
	@CreationTimestamp
	private LocalDateTime qnaInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime qnaUpdateDate;
	
	private String qnaComplete;
	
	
}
