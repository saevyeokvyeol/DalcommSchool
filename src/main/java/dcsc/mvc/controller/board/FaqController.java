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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.board.Faq;
import dcsc.mvc.domain.board.FaqCategory;
import dcsc.mvc.domain.board.Notice;
import dcsc.mvc.service.board.FaqService;
import dcsc.mvc.util.ImageLink;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FaqController {
	
	private final FaqService faqService;
	
	private final static int PAGE_COUNT= 5;
	private final static int BLOCK_COUNT= 2;
	
	/**
	 * FAQ 관리자 조회 
	 * */
	@RequestMapping("/admin/board/FAQ/faqList")
	private String faqList(Model model,@RequestParam(defaultValue = "1") int nowPage) {
		//List<Faq> faqlist = faqService.selectAllfqa();
		
		//페이징 처리하기
		 Pageable page = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "faqNo");
		 Page<Faq> faqlist = faqService.selectAllfqa(page);
		 
		model.addAttribute("faqlist",faqlist);
		
		return "admin/board/FAQ/faqList";
	}
	
	/**
	 * FAQ 유저 조회 
	 * */
	@RequestMapping("/main/board/FAQ/faqList")
	private String userselectAllfqa(Model model) {
		List<Faq> faqlist = faqService.userselectAllfqa();
		
		model.addAttribute("faqlist",faqlist);
		
		return "main/board/FAQ/faqList";
	}
	
	@RequestMapping("/admin/board/FAQ/faqCategoryList")
	private String faqCategoryList(Model model,Long faqCategoryId) {
		
		List<Faq> faqlist=faqService.selectByfaqCategoryId(faqCategoryId);
		model.addAttribute("faqlist",faqlist);
		return "redirect:/admin/board/FAQ/faqList";
	}
	
	/**
	 * 글 등록폼
	 * */
	@RequestMapping("/admin/board/FAQ/write")
	public String write() {
		System.out.println();
		
		return "admin/board/FAQ/faqWrite";
	}
	
	/**
	 * 등록하기
	 * */
	@RequestMapping("/admin/board/FAQ/faqWrite")
	public String insertFAQ(Faq faq, FaqCategory faqCategory,MultipartFile file) throws Exception {
		System.out.println("dddddddddddddd");
		System.out.println("faq + faqCategory = " + faq + faqCategory);
		if(file.getSize() > 0) {
			File img = new File(ImageLink.FAQ_IMG + file.getOriginalFilename());
			file.transferTo(img);
			faq.setFaqImg(file.getOriginalFilename());
		}
		faq.setFaqCategory(faqCategory);
		faqService.insertFAQ(faq);
		
		return "redirect:/admin/board/FAQ/faqList";
	}
	
	/**
	 * faq 상세보기 - 관리자
	 * */
	@RequestMapping("/admin/board/FAQ/faqRead/{faqNo}")
	public ModelAndView read(@PathVariable Long faqNo,String flag) {
		boolean state = flag==null ? true : false;
		
		Faq faq = faqService.selectByFaqNo(faqNo, state);//true는 조회수 증가!!
		
		return new ModelAndView("admin/board/FAQ/faqRead","faq",faq);
	}
	
	/**
	 * faq 상세보기 - 유저
	 * */
	@RequestMapping("/main/board/FAQ/faqRead/{faqNo}")
	public ModelAndView userread(@PathVariable Long faqNo,String flag) {
		boolean state = flag==null ? true : false;
		
		Faq faq = faqService.selectByFaqNo(faqNo, state);//true는 조회수 증가!!
		
		return new ModelAndView("main/board/FAQ/faqRead","faq",faq);
	}
	
	/**
	 * 수정폼
	 * */
	@RequestMapping("/admin/board/FAQ/updateForm")
	public ModelAndView updateForm(Long faqNo,boolean state) {
		Faq faq = faqService.selectByFaqNo(faqNo,false);
		
		return new ModelAndView("admin/board/FAQ/faqUpdate","faq",faq);
	}
	
	/**
	 * 수정하기
	 * */
	@RequestMapping("/admin/board/FAQ/faqUpdate")
	public ModelAndView updateFAQ(Faq faq,FaqCategory faqCategory, MultipartFile file)throws Exception {
		
		  if(file.getSize() > 0) { 
			 File img = new File(ImageLink.FAQ_IMG + file.getOriginalFilename()); 
			 file.transferTo(img);
			 faq.setFaqImg(file.getOriginalFilename()); 
			 
			 } 
		  	faqService.updateFAQ(faq, faqCategory);
		 
		return new ModelAndView ("admin/board/FAQ/faqRead","faq",faq) ;
		
	}
	
	/**
	 * 삭제하기
	 * */
	@RequestMapping("/admin/board/FAQ/deleteFAQ")
	public String deleteFAQ(Long faqNo) {
		faqService.deleteFAQ(faqNo);
		
		return "redirect:/admin/board/FAQ/faqList";
	}
	
	/**
	 * 카테고리 조회
	 * */
	@RequestMapping("/main/board/FAQ/faqCategory")
	@ResponseBody
	public List<FaqCategory> selectfaqCategory() {
		List<FaqCategory> list = faqService.selectfaqCategory();
		
		return list;
	}
	
	/**
	 * 카테고리 별로 정렬
	 * */
	@RequestMapping("/main/board/FAQ/faqCategoryId/{FaqCategoryId}")
	public String selectByfaqCategoryId(@PathVariable Long FaqCategoryId, Model model){
		System.out.println("FaqCategoryId Controller....... = "+FaqCategoryId); 
		
		List<Faq> faqlist = faqService.selectByfaqCategoryId(FaqCategoryId);
		model.addAttribute("faqlist",faqlist);
		
		return "main/board/FAQ/faqList" ;
	}
	/**
	 * 검색 하기 - 관리자
	 * */
	@RequestMapping("/admin/board/FAQ/faqSearch")
	public ModelAndView selectByKeyword(String keyword) {
		System.out.println("keyfield : " +" / " + "keyword : "+ keyword);
		List<Faq> list = faqService.selectBykeyword(keyword);
		
		return new ModelAndView("/admin/board/FAQ/faqList","faqlist",list);
		
	}
	
	/**
	 * 검색 하기 - 유저
	 * */
	@RequestMapping("/main/board/FAQ/faqSearch")
	public ModelAndView userselectByKeyword(String keyword) {
		List<Faq> list = faqService.selectBykeyword(keyword);
		
		return new ModelAndView("/main/board/FAQ/faqList","faqlist",list);
		
	}
	
	
}
