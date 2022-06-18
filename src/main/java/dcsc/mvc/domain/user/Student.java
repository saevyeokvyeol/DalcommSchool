package dcsc.mvc.domain.user;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import dcsc.mvc.domain.board.ClassQna;
import dcsc.mvc.domain.classes.Book;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Student {

	@Id
	private String studentId;
	
	private String studentPwd;
	
	private String studentName;
	
	private String studentPhone;
	
	private String studentEmail;
	
	@CreationTimestamp
	private LocalDateTime studentInsertDate;
	
	private String studentQuit = "F";
	
	private String role = "ROLE_STUDENT"; //STUDENT
	
	@OneToMany(mappedBy = "student")
	@JsonIgnore
	private List<ClassQna> qnaList;

	@OneToMany(mappedBy = "student")
	@JsonIgnore
	private List<Book> books;

}
