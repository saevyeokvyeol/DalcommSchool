package dcsc.mvc.controller.classes;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dcsc.mvc.domain.classes.Book;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.classes.Search;
import dcsc.mvc.service.classes.BookService;
import dcsc.mvc.service.classes.ClassesService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/class")
public class AdminClassController {
	private final ClassesService classesService;
	private final BookService bookService;
	
	private final int SIZE = 10;
	private final int BLOCK_COUNT = 5;
	
	/**
	 * 전체 클래스 리스트
	 * */
	@RequestMapping("/classList")
	public void selectAllClass(Model model, @RequestParam(defaultValue = "1") int page) {
		Pageable pageable = PageRequest.of(page - 1, SIZE);
		
		// ID에 해당하는 클래스 가져오기
		Page<Classes> list = classesService.selectByFilter(null, pageable, null);
		
		int temp = (page - 1) % BLOCK_COUNT;
		int startPage = page - temp;

		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		model.addAttribute("title", "전체 클래스 조회");
	}
	
	/**
	 * 클래스 검색
	 * */
	@RequestMapping("/classSearch")
	public String selectByFilter(Model model, Search search, @RequestParam(defaultValue = "1") int page) {
		Pageable pageable = PageRequest.of(page - 1, SIZE);
		
		// ID에 해당하는 클래스 가져오기
		Page<Classes> list = classesService.selectByFilter(search, pageable, null);
		
		int temp = (page - 1) % BLOCK_COUNT;
		int startPage = page - temp;

		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		model.addAttribute("title", "클래스 검색");
		
		return "admin/class/classList";
	}
	
	/**
	 * 공개 신청 클래스 조회
	 * */
	@RequestMapping("/openSubscriptList")
	public String selectBySubsctipt(Model model, @RequestParam(defaultValue = "1") int page) {
		Pageable pageable = PageRequest.of(page - 1, SIZE);
		
		// ID에 해당하는 클래스 가져오기
		Page<Classes> list = classesService.selectByFilter(null, pageable, 2L);
		
		int temp = (page - 1) % BLOCK_COUNT;
		int startPage = page - temp;

		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		model.addAttribute("title", "공개 신청 클래스 조회");
		
		return "admin/class/openSubscriptList";
	}
	
	/**
	 * 전체 예약 조회
	 * */
	@RequestMapping("/booklist")
	public String selectAllBooks(Model model, @RequestParam(defaultValue = "1") int page) {
		Pageable pageable = PageRequest.of(page - 1, SIZE);
		
		// 클래스 가져오기
//		Page<Book> list = bookService.sele(null, pageable, 2L);
//		
//		int temp = (page - 1) % BLOCK_COUNT;
//		int startPage = page - temp;
//
//		model.addAttribute("blockCount", BLOCK_COUNT);
//		model.addAttribute("startPage", startPage);
//		model.addAttribute("page", page);
//		model.addAttribute("list", list);
//		model.addAttribute("title", "공개 신청 클래스 조회");
		
		return "admin/class/openSubscriptList";
	}
}
