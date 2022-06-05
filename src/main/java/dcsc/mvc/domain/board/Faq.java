package dcsc.mvc.domain.board;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Faq {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "faq_no_seq")
	@SequenceGenerator(sequenceName = "faq_no_seq" , allocationSize = 1 , name = "faq_no_seq")
	private Long faqNo;
	
	private String faqTitle;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "faq_category_id")
	@JsonIgnore
	private FaqCategory faqCategory;
	
	@Column(length = 500)
	private String faqContent;
	
	private String faqImg;
	
	@CreationTimestamp
	private LocalDateTime faqInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime faqUpdateDate;
	
}
