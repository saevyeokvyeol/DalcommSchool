package dcsc.mvc.controller.board;

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
@RequestMapping("/main/board/askanswer")
public class AskAnswerUserController {

	private final AskAnswerService askAnswerService; 
	
	@RequestMapping("/askAnswer")
	public String selectById(String studentId, Model model) {
		
		studentId = "jang1234"; 
		   
		List<Ask> askSelectByIdList=askAnswerService.selectById(studentId);
		 
		model.addAttribute("askSelectByIdList", askSelectByIdList);
		
		return "/main/board/askanswer/askAnswerSelectById"; 
	} 
	  
	/** 
	 * 등록폼  
	 * */
	@RequestMapping("/askAnswerWrite")
	public void askAnswerWrite() {}
	
	
	@RequestMapping("/insert")
	public String insert(Ask ask) {
		
		askAnswerService.insertAsk(ask);
		
		return "/main/board/askanswer/askAnswerTest";
	} 
	 
	 
	/**
	 * 수정폼
	 * */
	@RequestMapping("/updateForm") 
	public ModelAndView updateForm(Long askNo) {
		Ask askSelectByIdList=askAnswerService.selectByAskNo(askNo);
		System.out.println("askSelectByIdList.getAskNo()"+askSelectByIdList.getAskNo());
		return new ModelAndView("/main/board/askanswer/askAnswerUpdate","askSelectByIdList",askSelectByIdList);
	}

	/**
	 * 1대1 문의 수정하기 
	 * */
	@RequestMapping("/update")
	public String update(Ask ask) {
		
		Ask dbAsk=askAnswerService.updateAsk(ask);
		
		
		//return new ModelAndView("/main/board/askanswer/askAnswerSelectById","askSelectByIdList",dbAsk); 
		return "redirect:/main/board/askanswer/askAnswer";
	}
	
	/**
	 * 1대1 문의 삭제하기 
	 * */
	@RequestMapping("/delete")
	public String delete(Long askNo) {
		
		askAnswerService.deleteAsk(askNo);
		
		return "redirect:/main/board/askanswer/askAnswer";
	}
	
	
}











