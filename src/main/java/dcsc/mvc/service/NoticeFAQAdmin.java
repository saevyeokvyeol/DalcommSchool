package dcsc.mvc.service;

import dcsc.mvc.domain.board.Notice;

/**
 * 관리자
 * */
public interface NoticeFAQAdmin {
	/**
	 * 공지사항 등록 기능
	 * */
	void insertNotice(Notice notice)throws Exception;
	
	/**
	 * 공지사항 수정 기능
	 * 	 수정된 공지사항을 리턴해줌
	 * */
	Notice updateNotice(Notice notice)throws Exception;
	
	/**
	 * 공지사항 삭제 기능
	 * 글번호(시퀀스)를 받고 공지사항을 삭제한다.
	 * */
	void delete(Long NoticeNo, Notice notice)throws Exception;
	
	
}
