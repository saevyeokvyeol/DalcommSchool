package dcsc.mvc.service;

import java.util.List;

import dcsc.mvc.domain.board.Ask;

/**
 * 1대1문의(강사&회원)
 * */
public interface AskUser {
	/**
	 * 내가 쓴 1대1 문의 리스트 조회기능
	 * */
	List<Ask> selectkeywordAsk(String keyword);
	
	/**
	 * 1대1 문의 상세보기
	 * */
	Ask selectAskDetail(String askTitle);
	
	/**
	 * 1대1 문의 등록하기
	 * */
	void insertAsk(Ask ask);
	
	/**
	 * 1대1 문의 수정하기
	 * */
	Ask updateAsk(Ask ask);
	
	/**
	 * 1대1 문의 삭제하기
	 * */
	void deleteAsk(Long askNo, Ask ask);
}
