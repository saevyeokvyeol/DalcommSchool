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

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Ask {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "ask_no_seq")
	@SequenceGenerator(sequenceName = "ask_no_seq" , allocationSize = 1 , name = "ask_no_seq" )
	private Long askNo;
	
	private String askTitle;
	
	@Column(length = 500)
	private String askContent;
	
	private String askImg;
	
//	private MultipartFile askImg;// <input type = "file" name="file">
//	private String fname;
//	private long fsize;
//	
	
	@CreationTimestamp
	private LocalDateTime askInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime askUpdateDate;
	
	private String askComplete;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "student_id")
	@JsonIgnore
	private Student student;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "teacher_id")
	@JsonIgnore
	private Teacher teacher;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ask_category_id")
	@JsonIgnore
	private AskCategory askCategory;
	 
	@OneToOne(mappedBy = "ask")
	private Answer answer;
	
}
