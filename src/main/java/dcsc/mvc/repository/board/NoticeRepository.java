package dcsc.mvc.repository.board;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import dcsc.mvc.domain.board.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Long>{
	
	/*
	 * @Query("update Notice notice set notice.readnum = notice.readnum + 1 where notice.notice_no_seq=?1"
	 * )
	 * 
	 * @Modifying//DML인 경우 필수 void updateReadNum(Long noticeNo);
	 */
}
