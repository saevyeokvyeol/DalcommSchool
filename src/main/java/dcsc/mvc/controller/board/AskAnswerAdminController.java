package dcsc.mvc.controller.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.board.Answer;
import dcsc.mvc.domain.board.Ask;
import dcsc.mvc.domain.board.AskCategory;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.service.board.AskAnswerService;
import lombok.RequiredArgsConstructor; 

@Controller
@RequiredArgsConstructor 
@RequestMapping("/admin/board")
public class AskAnswerAdminController {
	 
	private final AskAnswerService askAnswerService;
	
	    
	/**
	 * 1대1 문의 전체 리스트 조회하는 기능
	 * */ 
	@RequestMapping("/askAnswerList")  
	public String askAnswerList(Model model) {
		List<Ask> askList = askAnswerService.selectAll();
		model.addAttribute("askList", askList); 
		  
		return "/admin/board/askanswer/askAnswerList";  
	}     
	         
	/**    
	 * 1대1 문의 상세보기 기능(관리자)   
	 * */  
	@RequestMapping("/askAnswerDetail/{askNo}")
	public ModelAndView askAnswerDetail(@PathVariable Long askNo) {
		
		Ask askAnswerDetail = askAnswerService.selectByAskNo(askNo);
		System.out.println("********************askNo : "+askNo);
		return new ModelAndView("/admin/board/askanswer/askAnswerDetail","askAnswerDetail",askAnswerDetail); 
	}
	 
	     
	/**
	 * 1대1 문의 답변 폼 
	 * */
//	 @RequestMapping("/askanswer/askAnswerDetail")
//	 //public void askAnswerDetail(String askNo) {}
//	
//	 public void askAnswerDetail() {}
//	  
	
//	public String insert(Ask ask, AskCategory askCategory,Student student, MultipartFile file,HttpSession session)throws Exception {
//		ask.setAskCategory(askCategory);
//		ask.setStudent(student);
//		
		 
	/**  
	 * 1대1 문의 답변하는 기능(관리자)
	 * */
	 @RequestMapping("/insertAnswer")
	 @ResponseBody//아작스하려면 필요
	 public Answer insertAnswer(Answer answer, Ask ask) {
		 answer.setAsk(ask);
	
		 Answer dbAnswer=askAnswerService.insertAnswer(answer);
		 
		 
		 return dbAnswer;
		 
	 }
}
