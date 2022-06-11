package dcsc.mvc.repository.board;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import dcsc.mvc.domain.board.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Long> , QuerydslPredicateExecutor<Notice>{
	
	
	/**
	 * 조회수 증가
	 * */
	@Query("update Notice n set n.noticeViews = n.noticeViews + 1 where n.noticeNo=?1")
	@Modifying //DML
	void updateReadNum(Long noticeNo);
	
	
}
