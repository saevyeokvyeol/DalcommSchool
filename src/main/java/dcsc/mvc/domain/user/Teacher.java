package dcsc.mvc.domain.user;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class Teacher {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "teacher_id_seq")
	@SequenceGenerator(sequenceName = "teacher_id_seq",allocationSize = 1,name = "teacher_id_seq")
	private String teacherId;
	
	private String teacherPwd;
	private String teacherName;
	private String teacherNickname;
	private String teacherPhone;
	private String teacherTel;
	private String teacherEmail;
	private String teacherInfo;
	private String teacherImg;
	private String totalProfit;
	private String adjustable;
	
	@CreationTimestamp
	private LocalDateTime teacherInsertDate;
	
	private String teacherQuit;
	
	
}
