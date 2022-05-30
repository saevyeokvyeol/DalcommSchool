package dcsc.mvc.domain.user;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
@Table(name = "teacher")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class Teacher {
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
