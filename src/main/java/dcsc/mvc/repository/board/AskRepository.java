package dcsc.mvc.repository.board;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import com.querydsl.core.BooleanBuilder;

import dcsc.mvc.domain.board.Ask;

public interface AskRepository extends JpaRepository<Ask, Long>, QuerydslPredicateExecutor<Ask>{


}
