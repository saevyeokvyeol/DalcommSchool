package dcsc.mvc.repository.board;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.board.ClassQna;

public interface ClassQnaReposiroty extends JpaRepository<ClassQna, Long> {

	/**
	 * 블라인드 처리
	 * */
	//@Query("update ClassQna q set q.blindState = ?1 where qnaId = ?2")
	//ClassQna updateBlind(String blindState , Long qnaId);
	
}
