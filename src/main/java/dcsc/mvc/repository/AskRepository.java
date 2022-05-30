package dcsc.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.board.Ask;

public interface AskRepository extends JpaRepository<Ask, Long>{

}
