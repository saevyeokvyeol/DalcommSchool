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

import dcsc.mvc.domain.board.Notice;
import dcsc.mvc.service.board.NoticeService;
import dcsc.mvc.util.ImageLink;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class NoticeController {
	
	private final NoticeService noticeService;
	
	private final static int PAGE_COUNT= 5;
	private final static int BLOCK_COUNT= 2;
	
	/**
	 * 공지사항 전체 조회 - 관리자
	 * */
	
	 @RequestMapping("/admin/board/Notice/noticeList")
	 private void noticeList(Model model, @RequestParam(defaultValue = "1")int nowPage) {
		 //List<Notice> nolist = noticeService.selectAllNotice();
		 
		//페이징 처리하기
		 Pageable page = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "noticeNo");
         Page<Notice> noList = noticeService.selectAllNotice(page);
		 
		 model.addAttribute("noList",noList);
		 
		 
		 int temp=(nowPage-1)%BLOCK_COUNT;//나머지 는 항상 0 1 2 왜 blckCount가 3이므로 3보다 작은값
		 int startPage = nowPage-temp;
			
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage",startPage);
		model.addAttribute("nowPage",nowPage);
			
	 }
	 
	 /**
		 * 공지사항 전체 조회 - 유저
		 * */
		
		 @RequestMapping("/main/board/Notice/noticeList")
		 private void usernoticeList(Model model, @RequestParam(defaultValue = "1")int nowPage) {
			 //List<Notice> nolist = noticeService.selectAllNotice();
			 
			//페이징 처리하기
			 Pageable page = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "noticeNo");
	         Page<Notice> noList = noticeService.selectAllNotice(page);
			 
			 model.addAttribute("noList",noList);
			 
			 
			 int temp=(nowPage-1)%BLOCK_COUNT;//나머지 는 항상 0 1 2 왜 blckCount가 3이므로 3보다 작은값
			 int startPage = nowPage-temp;
				
			model.addAttribute("blockCount",BLOCK_COUNT);
			model.addAttribute("startPage",startPage);
			model.addAttribute("nowPage",nowPage);
				
		 }
	 	/**
		 * 글 등록폼
		 * */
		@RequestMapping("/admin/board/Notice/write")
		public String write() {
			
			return "admin/board/Notice/noticeWrite";
		}
	 
		/**
		 * 등록 하기
		 * */
	 @RequestMapping("/admin/board/Notice/noticeWrite")
	 public String insertNotice(Notice notice,MultipartFile file) throws Exception{
		 System.out.println("notice: " + notice);
		 if(file.getSize() > 0) {
				File img = new File(ImageLink.NOTICE_IMG + file.getOriginalFilename());
				file.transferTo(img);
				notice.setNoticeImg(file.getOriginalFilename());
			}
		 noticeService.insertNotice(notice);
		 
		 return "redirect:/admin/board/Notice/noticeList";
	 }
	 
	 /**
	 * 
	 *공지사항 상세보기 - 관리자
	 **/ 
	@RequestMapping("/admin/board/Notice/noticeRead/{noticeNo}")
	public ModelAndView read(@PathVariable Long noticeNo,String flag) {
		boolean state = flag==null ? true : false;
		
		Notice notice = noticeService.selectByNotuceNo(noticeNo, state);//true는 조회수 증가!!
		
		return new ModelAndView("admin/board/Notice/noticeRead","notice",notice);
	}
	
	 /**
	 * 
	 *공지사항 상세보기 - 유저
	 **/ 
		@RequestMapping("/main/board/Notice/noticeRead/{noticeNo}")
		public ModelAndView userread(@PathVariable Long noticeNo,String flag) {
			boolean state = flag==null ? true : false;
			
			Notice notice = noticeService.selectByNotuceNo(noticeNo, state);//true는 조회수 증가!!
			
			return new ModelAndView("main/board/Notice/noticeRead","notice",notice);
		}
	
	/**
	 * 수정폼
	 * */
	@RequestMapping("/admin/board/Notice/updateForm")
	public ModelAndView updateForm(Long noticeNo, boolean state) {
		Notice notice = noticeService.selectByNotuceNo(noticeNo, false);
		
		return new ModelAndView("admin/board/Notice/noticeUpdate","notice",notice);
	}
	
	/**
	 * 수정하기
	 * */
	
	@RequestMapping("/admin/board/Notice/noticeUpdate")
	public String updateNotice(Notice notice,MultipartFile file)throws Exception {
		
		if(file.getSize() > 0) {
			File img = new File(ImageLink.NOTICE_IMG + file.getOriginalFilename());
			file.transferTo(img);
			notice.setNoticeImg(file.getOriginalFilename());
		}
		Notice newNotice = noticeService.updateNotice(notice);
		
		return "redirect:/admin/board/Notice/noticeRead/" + newNotice.getNoticeNo();
	}
	
	/**
	 * 삭제하기
	 * */
	@RequestMapping("/admin/board/Notice/deleteNotice")
	public String deleteNotice(Long noticeNo) {
		
		noticeService.deleteNotice(noticeNo);
		return "redirect:/admin/board/Notice/noticeList";
	}
	
	/**
	 * 공지사항 검색 - 관리자
	 * */
	@RequestMapping("/admin/board/Notice/noticeSearch")
	public String selectByKeyword(String keyword,Model model, @RequestParam(defaultValue = "1") int nowPage) {
		
		//페이징 처리
		 Pageable page = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "noticeNo");
         Page<Notice> noList = noticeService.selectByKeyword(keyword,page);
		 
		 model.addAttribute("noList",noList);
		 
		 int temp=(nowPage-1)%BLOCK_COUNT;//나머지 는 항상 0 1 2 왜 blckCount가 3이므로 3보다 작은값
		 int startPage = nowPage-temp;
		 
		 model.addAttribute("blockCount", BLOCK_COUNT);
		 model.addAttribute("startPage", startPage);
		 model.addAttribute("nowPage", nowPage);
		 
		return "admin/board/Notice/noticeList";
	}
	
	/**
	 * 공지사항 검색 - 유저
	 * */
	@RequestMapping("/main/board/Notice/noticeSearch")
	public String userselectByKeyword(String keyword,Model model, @RequestParam(defaultValue = "1") int nowPage) {
		
		//페이징 처리
		 Pageable page = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "noticeNo");
         Page<Notice> noList = noticeService.selectByKeyword(keyword,page);
		 
		 model.addAttribute("noList",noList);
		 
		 int temp=(nowPage-1)%BLOCK_COUNT;//나머지 는 항상 0 1 2 왜 blckCount가 3이므로 3보다 작은값
		 int startPage = nowPage-temp;
		 
		 model.addAttribute("blockCount", BLOCK_COUNT);
		 model.addAttribute("startPage", startPage);
		 model.addAttribute("nowPage", nowPage);
		 
		return "main/board/Notice/noticeList";
	}
}
