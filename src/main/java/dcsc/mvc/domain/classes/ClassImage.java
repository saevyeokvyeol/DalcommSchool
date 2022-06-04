package dcsc.mvc.domain.classes;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ClassImage {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "classimage_id_seq")
	@SequenceGenerator(sequenceName = "classimage_id_seq", allocationSize = 1 , name = "classimage_id_seq")
	private Long ImageId;
	
	@ColumnDefault("F")
	private String thumbnailState;
	
	private String ImageName;
	
	@CreationTimestamp
	private LocalDateTime ImageInsertDate;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "class_id")
	private Classes classes;
}
