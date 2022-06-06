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
public class BookCancel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "cancel_id_seq")
	@SequenceGenerator(sequenceName = "cancel_id_seq",allocationSize = 1 , name = "cancel_id_seq")
	@NonNull
	private Long cancelId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "book_id")
	@JsonIgnore
	private Book book;
	private int cancelRate;
	
	@CreationTimestamp
	private LocalDateTime cancelInsertDate;
}
