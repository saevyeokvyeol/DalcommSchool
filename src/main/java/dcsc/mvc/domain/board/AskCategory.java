package dcsc.mvc.domain.board;

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
public class AskCategory {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "ask_category_id_seq")
	@SequenceGenerator(sequenceName = "ask_category_id_seq" , allocationSize = 1 , name = "ask_category_id_seq" )
	private Long askCategoryId;
	
	private String askCategoryName;
}