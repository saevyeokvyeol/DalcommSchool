package dcsc.mvc.controller.board;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.board.Notice;
import dcsc.mvc.service.board.NoticeService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/board/Notice")
@RequiredArgsConstructor
public class NoticeController {
	
	private final NoticeService noticeService;
	
	private final static int PAGE_COUNT=10;
	private final static int BLOCK_COUNT=5;
	
	
	 @RequestMapping("/noticeList")
	 private void noticeList(Model model, @RequestParam(defaultValue = "1")int nowPage) {
		 //List<Notice> nolist = noticeService.selectAllNotice();
		 
		//페이징 처리하기
		 Pageable page = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "noticeNo");
         Page<Notice> pageList = noticeService.selectAllNotice(page);
		 
		 model.addAttribute("pageList",pageList);
		 
		 
		 int temp=(nowPage-1)%BLOCK_COUNT;//나머지 는 항상 0 1 2 왜 blckCount가 3이므로 3보다 작은값
		 int startPage = nowPage-temp;
			
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage",startPage);
		model.addAttribute("nowPage",nowPage);
			
	 }
	 	/**
		 * 글 등록폼
		 * */
		@RequestMapping("/write")
		public String write() {
			
			return "admin/board/Notice/noticeWrite";
		}
	 
		/**
		 * 등록 하기
		 * */
	 @RequestMapping("/noticeWrite")
	 public String insertNotice(Notice notice) {
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
		
		Notice notice = noticeService.selectByNotuceNo(noticeNo, state);//true는 조회수 증가!!
		
		return new ModelAndView("admin/board/Notice/noticeRead","notice",notice);
	}
	
	/**
	 * 수정폼
	 * */
	@RequestMapping("/updateForm")
	public ModelAndView updateForm(Long noticeNo, boolean state) {
		Notice notice = noticeService.selectByNotuceNo(noticeNo, false);
		
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
	public String deleteNotice(Long noticeNo) {
		noticeService.deleteNotice(noticeNo);
		return "redirect:/admin/board/Notice/noticeList";
	}
	
	/**
	 * 검색 하기
	 * */
	@RequestMapping("/noticeSearch")
	public ModelAndView selectByKeyword(String keyfield , String keyword) {
		System.out.println("keyfield : " + keyfield +" / " + "keyword : "+ keyword);
		List<Notice> list = noticeService.selectByKeyword(keyfield, keyword);
		
		return new ModelAndView("/admin/board/Notice/noticeList","notice",list);
	}
}
