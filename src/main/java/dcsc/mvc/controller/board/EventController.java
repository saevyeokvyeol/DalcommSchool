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
@RequestMapping
@RequiredArgsConstructor
public class EventController {
	
	private final EventService eventService;
	
	 private final static int PAGE_COUNT=8;
	 private final static int BLOCK_COUNT=4;
	
	/**
	 * 이벤트 전체 조회 - 관리자
	 * */
	@RequestMapping("/admin/board/event/eventList")
	public void eventAdminList(Model model, @RequestParam(defaultValue = "1") int nowPage) {
		
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
		model.addAttribute("title", "이벤트 관리");
	}

	
	/**
	 * 이벤트 전체 조회 - 메인
	 * */
	@RequestMapping("/main/board/event/eventList")
	public void eventUserList(Model model, @RequestParam(defaultValue = "1") int nowPage) {
		
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
	 * 이벤트 상세 페이지 (글 제목 누르면 이동) - 관리자
	 * */
	@RequestMapping("/admin/board/event/eventRead/{eventNo}")
	public ModelAndView selectByEventNo(@PathVariable Long eventNo, String flag, Model model) {
		
		model.addAttribute("title", "이벤트 관리");
		
		//eventNo=1L;
		 boolean state = flag==null ? true : false;
		 
		Event event = eventService.selectByEventNo(eventNo, state); //true면 글 조회수 증가
		return new ModelAndView("admin/board/event/eventRead" , "event", event);
		
		
	}
	
	
	/**
	 * 이벤트 상세 페이지 (글 제목 누르면 이동) - 메인
	 * */
	@RequestMapping("/main/board/event/eventRead/{eventNo}")
	public ModelAndView userSelectByEventNo(@PathVariable Long eventNo, String flag) {
		 boolean state = flag==null ? true : false;
		 
		Event event = eventService.selectByEventNo(eventNo, state); //true면 글 조회수 증가
		return new ModelAndView("main/board/event/eventRead" , "event", event);
		
	}
	
	
	/**
	 * 이벤트 글 등록 폼
	 * */
	@RequestMapping("/admin/board/event/eventWrite")
	public void eventWrite() {
		
	}
	
	/**
	 * 이벤트 글 등록 
	 * */
	@RequestMapping("/admin/board/event/eventInsert")
	public String eventInsert(Model model, Event event, MultipartFile file) throws Exception {
		
		model.addAttribute("title", "이벤트 관리");
		
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
	@RequestMapping("/admin/board/event/eventUpdate")
	public ModelAndView eventUpdateForm(Long eventNo , Model model) {
		Event event = eventService.selectByEventNo(eventNo,false);
		model.addAttribute("title", "이벤트 관리");
		
		return new ModelAndView("admin/board/event/eventUpdate","event", event);
	}
	
	/**
	 * 이벤트 글 수정
	 * */
	@RequestMapping("/admin/board/event/eventUpdateForm")
	public String eventUpdate(Event event, MultipartFile file, Model model) throws Exception {
		
		model.addAttribute("title", "이벤트 관리");
		
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
	@RequestMapping("/admin/board/event/eventDelete")
	public String eventDelete(Long eventNo) {
		System.out.println(eventNo + "이벤트 글 삭제");
		eventService.deleteEvent(eventNo);
		
		return "redirect:/admin/board/event/eventList";

	}
	
	
	/**
	 * 이벤트 키워드로 검색 - 관리자
	 * */
	@RequestMapping("/admin/eventSearch")
	public String eventSearch(String keyword, Model model, @RequestParam(defaultValue = "1") int nowPage) {
		
		//페이징 처리
		Pageable page = PageRequest.of( (nowPage-1) , PAGE_COUNT , Direction.DESC, "eventNo");
		Page<Event> eventList = eventService.selectByKeyword(keyword, page);
		
		model.addAttribute("eventList", eventList);
		
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage - temp;
		
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("title", "이벤트 관리");
		
		return "admin/board/event/eventList";
	}
	
	/**
	 * 이벤트 키워드로 검색 - 유저
	 * */
	@RequestMapping("/user/eventSearch")
	public String userEventSearch(String keyword, Model model, @RequestParam(defaultValue = "1") int nowPage) {
		
		//페이징 처리
		Pageable page = PageRequest.of( (nowPage-1) , PAGE_COUNT , Direction.DESC, "eventNo");
		Page<Event> eventList = eventService.selectByKeyword(keyword, page);
		
		model.addAttribute("eventList", eventList);
		
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage - temp;
		
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
		
		return "main/board/event/eventList";
	
	}

}
