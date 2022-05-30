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
@Table(name = "teacher")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class Teacher {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "teacher_id")
	@SequenceGenerator(sequenceName = "teacher_id",allocationSize = 1,name = "teacher_id")
	private String teacherId;
	
	private String teacherPwd;
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
