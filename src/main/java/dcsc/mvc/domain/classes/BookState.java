package dcsc.mvc.domain.classes;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
@Table(name = "bookState")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class BookState {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "book_state_id")
	@SequenceGenerator(sequenceName = "book_state_id",allocationSize = 1,name = "book_state_id")
	private Long bookStateId;
	
	private String bookStateName;
}
