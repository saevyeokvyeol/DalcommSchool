package dcsc.mvc.domain.board;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "notice_no_seq")
	@SequenceGenerator(sequenceName = "notice_no_seq" , allocationSize = 1 , name = "notice_no_seq")
	private Long noticeNo; 
	
	private String noticeTitle;
	
	@Column(length = 500)
	private String noticeContent;
	
	private String noticeImg;
	
	@CreationTimestamp
	private LocalDateTime noticeInsertDate;
	
	@UpdateTimestamp
	private LocalDateTime noticeUpdateDate;
	
	private int noticeViews;
	
}
