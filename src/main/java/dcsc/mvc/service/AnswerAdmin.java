package dcsc.mvc.service;

import java.util.List;

import dcsc.mvc.domain.board.Answer;
import dcsc.mvc.domain.board.Ask;

/**
 * 1대1문의(관리자)
 * */
public interface AnswerAdmin {
	
	/**
	 * 1대1문의 전체 리스트 조회하는 기능
	 * */
	List<Ask> selectAll();
	
	/**
	 * 1대1 문의 답변하는 기능
	 * */
	void insertAnswer(Answer answer);
	
}
