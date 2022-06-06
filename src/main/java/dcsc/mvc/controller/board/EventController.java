package dcsc.mvc.controller.board;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.board.Event;
import dcsc.mvc.service.board.EventService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/board/event")
@RequiredArgsConstructor
public class EventController {
	
	private final EventService eventService;
	
	/**
	 * 이벤트 전체 조회
	 * */
	@RequestMapping("/eventList")
	public void eventList(Model model) {
		List<Event> list = eventService.selectAll();
		
		model.addAttribute("eventList",list);
	}
	

	/**
	 * 이벤트 상세 페이지 (글 제목 누르면 이동)
	 * */
	@RequestMapping("/eventRead/{eventNo}")
	public ModelAndView selectByEventNo(@PathVariable Long eventNo, String flag) {
		 boolean state = flag==null ? true : false;
		 
		Event event = eventService.selectByEventNo(eventNo, state); //true면 글 조회수 증가
		return new ModelAndView("/admin/board/event/eventRead" , "event", event);
		
	}
	
	/**
	 * 이벤트 글 등록 폼
	 * */
	@RequestMapping("/eventInsertForm")
	public void eventWrite() {
		
	}
	
	/**
	 * 이벤트 글 등록 
	 * */
	@RequestMapping("/eventInsert")
	public String eventInsert(Event event) {
		eventService.insertEvent(event);
		
		return "redirect:/admin/board/event/eventList";
	}
	
	/**
	 * 이벤트 글 수정 폼
	 * */
	@RequestMapping("/eventUpdateForm")
	public ModelAndView eventUpdateForm(Long eventNo) {
		Event event = eventService.selectByEventNo(eventNo,false);
	
		return new ModelAndView("/admin/board/event/eventUpdate","event", event);
	}
	
	/**
	 * 이벤트 글 수정
	 * */
	@RequestMapping("/eventUpdate")
	public String eventUpdate(Event event) {
		eventService.updateEvent(event);
		
		return "redirect:/admin/board/event/eventList";
	}
	
	
	/**
	 * 이벤트 글 삭제
	 * */
	@RequestMapping("/event/eventDelete")
	public String eventDelete(Long eventNo) {
		eventService.deleteEvent(eventNo);
		
		return "redirect:/main/board/event/eventList";

	}
	

}
