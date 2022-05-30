package dcsc.mvc.repository.board;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.board.Answer;

public interface AnswerRepository extends JpaRepository<Answer, Long>{

}
