package dcsc.mvc.domain.classes;

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
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import com.fasterxml.jackson.annotation.JsonIgnore;
import dcsc.mvc.domain.board.ClassQna;
import dcsc.mvc.domain.board.ClassReview;
import dcsc.mvc.domain.user.Teacher;
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
public class Classes {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "class_id_seq")
	@SequenceGenerator(sequenceName = "class_id_seq", allocationSize = 1 , name = "class_id_seq")
	@NonNull
	private Long classId;
	
	private String className;
	
	private String classInfo;
	
	private int classPrice;
	
	@CreationTimestamp
	private LocalDateTime classInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime classUpdateDate;
	
	private LocalDateTime classOpenDate;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id")
	@JsonIgnore
	private ClassCategory classCategory;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "teacher_id")
	@JsonIgnore
	private Teacher teacher;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "state_id")
	@JsonIgnore
	private ClassState classState;
	
	@OneToMany(mappedBy = "classes")
	@JsonIgnore
	private List<ClassSchedule> classSchedules;
	
	@OneToMany(mappedBy = "classes")
	@JsonIgnore
	private List<ClassImage> classImages;
	
	@OneToMany(mappedBy = "classes")
	@JsonIgnore
	private List<Likes> Likes;
	
	@OneToMany(mappedBy = "classes")
	@JsonIgnore
	private List<ClassReview> classReviews;
	
	@OneToMany(mappedBy = "classes")
	@JsonIgnore
	private List<ClassQna> classQnas;
	
	@Transient
	private Long likeId;
}
