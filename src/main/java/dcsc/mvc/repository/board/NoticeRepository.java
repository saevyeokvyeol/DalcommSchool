package dcsc.mvc.repository.board;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.board.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Long>{
	
	/**
	 * 컬럼명에 따라 다른 메소드 호출
	 * */
	List<Notice> findByNoticeTitleIsLike(String noticeTitle);
	List<Notice> findByNoticeContentIsLike(String noticeContent);
}
