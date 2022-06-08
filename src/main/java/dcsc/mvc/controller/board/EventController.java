package dcsc.mvc.controller.board;

import java.io.File;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.board.Event;
import dcsc.mvc.service.board.EventService;
import dcsc.mvc.util.ImageLink;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/board/event")
@RequiredArgsConstructor
public class EventController {
	
	private final EventService eventService;
	
	 private final static int PAGE_COUNT=8;
	 private final static int BLOCK_COUNT=4;
	
	/**
	 * 이벤트 전체 조회
	 * */
	@RequestMapping("/eventList")
	public void eventList(Model model, @RequestParam(defaultValue = "1") int nowPage) {
		
		//List<Event> list = eventService.selectAll();
		
		//페이징 처리
		Pageable page = PageRequest.of( (nowPage-1) , PAGE_COUNT , Direction.DESC, "eventNo");
		Page<Event> eventList = eventService.selectAll(page);
		
		model.addAttribute("eventList", eventList);
		
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage - temp;
		
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
		
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
	@RequestMapping("/eventWrite")
	public void eventWrite() {
		
	}
	
	/**
	 * 이벤트 글 등록 
	 * */
	@RequestMapping("/eventInsert")
	public String eventInsert(Event event, MultipartFile file) throws Exception {
		
		if(file.getSize() > 0) {
			File img = new File(ImageLink.EVENT_IMG + file.getOriginalFilename());
			file.transferTo(img);
			event.setEventImg(file.getOriginalFilename());
		}
		eventService.insertEvent(event);
		
		return "redirect:/admin/board/event/eventList";
	}
	
	/**
	 * 이벤트 글 수정 폼
	 * */
	@RequestMapping("/eventUpdate")
	public ModelAndView eventUpdateForm(Long eventNo) {
		Event event = eventService.selectByEventNo(eventNo,false);
	
		return new ModelAndView("/admin/board/event/eventUpdate","event", event);
	}
	
	/**
	 * 이벤트 글 수정
	 * */
	@RequestMapping("/eventUpdateForm")
	public String eventUpdate(Event event, MultipartFile file) throws Exception {
		
		if(file.getSize() > 0) {
			File img = new File(ImageLink.EVENT_IMG + file.getOriginalFilename());
			file.transferTo(img);
			event.setEventImg(file.getOriginalFilename());
		}
		eventService.updateEvent(event);
		
		return "redirect:/admin/board/event/eventList";
	}
	
	
	/**
	 * 이벤트 글 삭제
	 * */
	@RequestMapping("/eventDelete")
	public String eventDelete(Long eventNo) {
		System.out.println(eventNo + "이벤트 글 삭제");
		eventService.deleteEvent(eventNo);
		
		return "redirect:/admin/board/event/eventList";

	}
	
	
	/**
	 * 이벤트 키워드로 검색
	 * */
	@RequestMapping("/eventSearch")
	public ModelAndView techerInquiry(String keyword) {
		List<Event> list = eventService.selectByKeyword(keyword);
		
		return new ModelAndView("/admin/board/event/eventList","eventList",list);
	}
	
	

}
