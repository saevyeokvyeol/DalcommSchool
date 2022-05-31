package dcsc.mvc.domain.classes;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ClassCategory {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "category_id_seq")
	@SequenceGenerator(sequenceName = "category_id_seq", allocationSize = 1 , name = "category_id_seq")
	private Long categoryId;
	
	private String categoryName;
}
