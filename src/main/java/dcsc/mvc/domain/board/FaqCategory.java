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
public class FaqCategory {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "faq_category_id_seq")
	@SequenceGenerator(sequenceName = "faq_category_id_seq" , allocationSize = 1 , name = "faq_category_id_seq")
	private Long faqCategoryId;
	
	private String faqCategoryName;
	
}
