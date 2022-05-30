package dcsc.mvc.domain.classes;

import javax.persistence.Entity;
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
	private int bookStateId;
	private String bookStateName;
}
