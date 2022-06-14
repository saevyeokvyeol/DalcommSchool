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

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
@DynamicInsert
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class ClassQna {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "qna_id_seq")
	@SequenceGenerator(sequenceName = "qna_id_seq",allocationSize = 1 , name = "qna_id_seq")
	@NonNull
	private Long qnaId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "student_id")
	@JsonIgnore
	private Student student;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "class_id")
	@JsonIgnore
	private Classes classes;
	private String qnaTitle;
	
	@Column(length = 3000)
	private String qnaContent;
	
	@Column
	private String secretState;

	@Column
	private String blindState;
	
	@CreationTimestamp
	private LocalDateTime qnaInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime qnaUpdateDate;

	@Column
	private String qnaComplete;
	
	
}
