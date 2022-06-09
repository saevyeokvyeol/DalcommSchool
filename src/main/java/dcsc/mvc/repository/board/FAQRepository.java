package dcsc.mvc.repository.board;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import dcsc.mvc.domain.board.Faq;
import dcsc.mvc.domain.board.Notice;

public interface FAQRepository extends JpaRepository<Faq, Long>, QuerydslPredicateExecutor<Faq>{
	
	/**
	 * 컬럼명에 따라 다른 메소드 호출
	 * */
	List<Faq> findByFaqTitleIsLike(String faqTitle);
	List<Faq> findByFaqContentIsLike(String faqContent);
}
