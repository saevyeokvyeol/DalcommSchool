package dcsc.mvc.domain.classes;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Entity
@Table(name = "bookCancel")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class BookCancel {
	private int cancelId;
	private int bookId;
	private int cancelRate;
	
	private LocalDateTime cancelInsertDate;
}
