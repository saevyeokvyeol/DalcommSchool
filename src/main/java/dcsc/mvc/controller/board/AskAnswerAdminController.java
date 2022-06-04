package dcsc.mvc.controller.board;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dcsc.mvc.domain.board.Ask;
import dcsc.mvc.service.board.AskAnswerService;
import lombok.RequiredArgsConstructor; 

@Controller
@RequiredArgsConstructor 
@RequestMapping("/admin")
public class AskAnswerAdminController {
	
	private final AskAnswerService askAnswerService;
	 
	/**
	 * 1대1 문의 전체 리스트 조회하는 기능
	 * */
	@RequestMapping("/board") 
	public String board(Model model) {
		List<Ask> askList = askAnswerService.selectAll();
		model.addAttribute("askList", askList); 
		  
		return "/admin/board";  
	}
	
	/** 
	 * 1대1 문의 답변하는 기능
	 * */
}
