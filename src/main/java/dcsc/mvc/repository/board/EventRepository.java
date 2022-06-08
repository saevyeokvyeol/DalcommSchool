package dcsc.mvc.repository.board;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import dcsc.mvc.domain.board.Event;

public interface EventRepository extends JpaRepository<Event, Long>, QuerydslPredicateExecutor<Event> {
	
	/**
	 * 조회수 증가
	 * */
	@Query("update Event e set e.eventViews = e.eventViews + 1 where e.eventNo=?1")
	@Modifying //DML
	void updateReadNum(Long eventNo);
	
	
	//List<Event> findByEventTitleLikeAndEventContentLike(String keyword);
	
	
	 
}
