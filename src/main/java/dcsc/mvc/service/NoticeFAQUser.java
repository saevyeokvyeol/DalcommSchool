package dcsc.mvc.service;

import java.util.List;

import dcsc.mvc.domain.board.Notice;



/**
 * 강사&회원
 * */
public interface NoticeFAQUser {
	/**
	 * 공지사항 게시판 상세보기 기능
	 *  게시판에 제목을 클릭하면 상세보기로 들어오게 한다.
	 * */
	Notice selectNoticeDetail(String noticeTitle);
	
	/**
	 * 공지사항 게시판 조회 기능
	 * */
	List<Notice> selectAllNotice();
	
	
	/**
	 * 공지사항 게시판 검색 기능
	 * */
	List<Notice> selectNoticeKeyword(String keyword);
	
	
}









