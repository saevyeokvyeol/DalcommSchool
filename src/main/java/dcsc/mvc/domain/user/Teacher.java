package dcsc.mvc.domain.user;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
public class Teacher {

	@Id
	@NonNull
	private String teacherId;
	
	private String teacherPwd;
	private String teacherName;
	private String teacherNickname;
	private String teacherPhone;
	private String teacherTel;
	private String teacherEmail;
	private String teacherInfo;
	private String teacherImg;
	
	@ColumnDefault("0")
	private int totalProfit;
	
	@ColumnDefault("0")
	private int adjustable;
	
	@CreationTimestamp
	private LocalDateTime teacherInsertDate;
	
	private String teacherQuit;

	private String role = "TEACHER";
	
	@OneToOne(mappedBy = "teacher")
	@JsonIgnore
	private Place place;
}
