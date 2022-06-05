package dcsc.mvc.service.board;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import dcsc.mvc.domain.board.Event;
import dcsc.mvc.repository.board.EventRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class EventServiceImpl implements EventService {
	
	private final EventRepository eventRep;

	/**
	 * 이벤트 등록하기
	 * */
	@Override
	public void insertEvent(Event event) {
		Event saveEvent = eventRep.save(event);

	}
	
	/**
	 * 이벤트 수정하기
	 * */
	@Override
	public Event updateEvent(Event event) {
		Event dbEvent = eventRep.findById(event.getEventNo()).orElse(null);
		
		if(dbEvent==null) throw new RuntimeException("이벤트 게시글 오류로 수정이 불가능합니다.");
		
		dbEvent.setEventTitle(event.getEventTitle());
		dbEvent.setEventContent(event.getEventContent());
		dbEvent.setEventImg(event.getEventImg());
		dbEvent.setEventUpdateDate(event.getEventUpdateDate());
		
		return dbEvent;
	}

	/**
	 * 이벤트 삭제하기
	 * */
	@Override
	public void deleteEvent(Long eventNo) {
		Event event = eventRep.findById(eventNo).orElse(null);
		
		if(event==null)  throw new RuntimeException("해당 이벤트를 삭제할 수 없습니다.");
		
		eventRep.deleteById(eventNo);
	
	}
	/**
	 * 이벤트 상세보기
	 * */
	@Override
	public Event selectByEventNo(Long eventNo, boolean state) {
		Event event = eventRep.findById(eventNo).orElse(null);
		if(event==null) throw new RuntimeException("해당 이벤트가 존재하지 않습니다.");
		
		return event;
	}

	/**
	 * 이벤트 전체검색
	 * */
	@Override
	public List<Event> selectAll() {
		List<Event> list = eventRep.findAll();
		return list;
	}
	
	@Override
	public Page<Event> selectAll(Pageable pageable) {
		return eventRep.findAll(pageable);
	}

	/**
	 * 키워드로 이벤트 검색
	 * */
	@Override
	public List<Event> selectByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}


}
