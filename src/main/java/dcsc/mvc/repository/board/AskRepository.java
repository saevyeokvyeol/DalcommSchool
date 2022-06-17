package dcsc.mvc.repository.board;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;



import dcsc.mvc.domain.board.Ask;

public interface AskRepository extends JpaRepository<Ask, Long>, QuerydslPredicateExecutor<Ask>{

	/**
	 * 1대1 문의 미답변 리스트(관리자)
	 * @return 
	 * */
	/*
	 * @Query("update Notice n set n.noticeViews = n.noticeViews + 1 where n.noticeNo=?1"
	 * )
	 */
	/*
	 * @Query("select a.askNo, a.askTitle, a.askContent, a.askCategoryId, a.studentId, a.teacherId, a.askInsertDate, a.askImg "
	 * + "from Ask a where a.askComplete='F'" )
	 */
	@Query("select a from Ask a where a.askComplete='F'")
	Page<Ask>findByAsk(Pageable pageable);
	 
	/* Page<Ask> askUnanswerList(Pageable pageable); */

}
