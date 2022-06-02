package dcsc.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.board.Notice;
import dcsc.mvc.service.board.NoticeService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/board/Notice")
@RequiredArgsConstructor
public class NoticeController {
	
	private final NoticeService noticeService;
	
	 @RequestMapping("/noticeList")
	 private String noticeList(Model model) {
		 List<Notice> nolist = noticeService.selectAllNotice();
		 
		 model.addAttribute("nolist",nolist);
		 
		 return "admin/board/Notice/noticeList";
	 }
	 
	 	/**
		 * 글 등록폼
		 * */
		@RequestMapping("/write")
		public String write() {
			
			return "admin/board/Notice/noticeWrite";
		}
	 
	 @RequestMapping("/noticeWrite")
	 private String insertNotice(Notice notice) {
		 noticeService.insertNotice(notice);
		 
		 return "redirect:/admin/board/Notice/noticeList";
	 }
	 
	 /**
	 * 
	 * 상세보기
	 **/ 
	@RequestMapping("/noticeRead/{noticeNo}")
	public ModelAndView read(@PathVariable Long noticeNo,String flag) {
		boolean state = flag==null ? true : false;
		
		Notice notice = noticeService.selectBy(noticeNo, state);//true는 조회수 증가!!
		
		return new ModelAndView("admin/board/Notice/noticeRead","notice",notice);
	}
	
	/**
	 * 수정폼
	 * */
	@RequestMapping("/updateForm")
	public ModelAndView updateForm(Long noticeNo) {
		Notice notice = noticeService.selectBy(noticeNo, false);
		
		return new ModelAndView("admin/board/Notice/noticeUpdate","notice",notice);
		
	}
	
	/**
	 * 수정하기
	 * */
	
	@RequestMapping("/noticeUpdate")
	public ModelAndView updateNotice(Notice notice) {
		noticeService.updateNotice(notice);
		
		return new ModelAndView("admin/board/Notice/noticeRead","notice",notice);
	}
	
	/**
	 * 삭제하기
	 * */
	@RequestMapping("/deleteNotice")
	public String deleteNotice(Long NoticeNo) {
		
		return "redirect:admin/board/Notice/noticeList";
	}
	
}
