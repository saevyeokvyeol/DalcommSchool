package dcsc.mvc.repository.board;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import dcsc.mvc.domain.board.Faq;

public interface FAQRepository extends JpaRepository<Faq, Long>, QuerydslPredicateExecutor<Faq>{

}
