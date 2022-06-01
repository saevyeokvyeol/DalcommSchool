package dcsc.mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.board.Ask;
import dcsc.mvc.service.board.AskAnswerService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/board")
public class AskAnswerUserController {

	private final AskAnswerService askAnswerService;
	
	@RequestMapping("/askAnswer")
	public String selectById(String studentId, Model model) {
		
		studentId = "jang1234";
		
		List<Ask> askSelectByIdList=askAnswerService.selectById(studentId);
		 
		model.addAttribute("askSelectByIdList", askSelectByIdList);
		
		return "/main/board/askAnswerSelectById"; 
	} 
	 
	/** 
	 * 등록폼
	 * */
	@RequestMapping("/write")
	public void write() {}
	
	
	@RequestMapping("/insert")
	public String insert(Ask ask) {
		
		askAnswerService.insertAsk(ask);
		
		return "/main/board/askAnswerTest";
	} 
	
	
	
	
	/**
	 * 1대1 문의 수정하기
	 * */
	@RequestMapping("/update")
	public String update(Ask ask) {
		
		askAnswerService.updateAsk(ask);
		
		return "/main/board/askAnswerTest";
	}
	
	
	/**
	 * 1대1 문의 삭제하기
	 * */
	@RequestMapping("/delete")
	public String delete(Long askNo) {
		
		askAnswerService.deleteAsk(askNo);
		
		return "/main/board/askAnswerTest";
	}
	
	
	
	/**
	 * 1대1 문의 상세보기 기능
	 * */
}











