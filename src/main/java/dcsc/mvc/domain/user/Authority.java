package dcsc.mvc.domain.user;


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
public class Authority {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "author_id_seq")
	@SequenceGenerator(sequenceName = "author_id_seq", allocationSize = 1, name ="author_id_seq")
	private Long authorId;
	
	private String authorName;

}
