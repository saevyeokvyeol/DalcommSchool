package dcsc.mvc.service.board;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import dcsc.mvc.domain.board.Event;

public interface EventService {
	/**
	 * 이벤트 게시글 등록
	 * @param Event(제목, 내용, 이미지)
	 * */
	void insertEvent(Event event);
	
	/**
	 * 이벤트 게시글 수정
	 * @param Event(제목, 내용, 이미지)
	 * */
	Event updateEvent(Event event);
	
	/**
	 * 이벤트 게시글 삭제
	 * 글번호(시퀀스)를 받고 공지사항을 삭제한다.
	 * @param Long eventNo
	 * */
	void deleteEvent(Long eventNo);
	
	/**
	 * 이벤트 게시판 상세보기 기능
	 * @param Long eventNo
	 * @return Event
	 * */
	Event selectByEventNo(Long eventNo, boolean state);
	
	/**
	 * 이벤트 게시판 조회 기능
	 * @return List<Event>
	 * */
	List<Event> selectAll();
	
	/**
	 * 이벤트 게시판 페이징처리
	 * */
	Page<Event> selectAll(Pageable pageable);
	
	
	/**
	 * 이벤트 게시판 검색 기능(제목, 내용)
	 * @param String keyword
	 * @return List<Event>
	 * */
	List<Event> selectByKeyword(String keyword);
	

	
	
}
