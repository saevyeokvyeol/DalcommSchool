package dcsc.mvc.controller.board;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.board.Ask;
import dcsc.mvc.domain.board.AskCategory;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.service.board.AskAnswerService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/board/askanswer")
public class AskAnswerUserController {

	private final AskAnswerService askAnswerService; 
	
	private static final String PATH_SAVE="C:\\Edu\\Spring\\fileSave";
 
	 
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
	public String insert(Ask ask, AskCategory askCategory,Student student)throws IOException {
		ask.setAskCategory(askCategory);
		ask.setStudent(student);
		

		//파일이 첨부되었다면 fname, fsize를 설정한다.
		//MultipartFile mfile=elect.getFile();
		 
//		MultipartFile mfile = ask.getAskImg();
//		
//		if(mfile.getSize() > 0 ) { //첨부된 파일에 용량이 있다면..
//			mfile.transferTo(new File(PATH_SAVE+"/"+mfile.getOriginalFilename())); //폴더에 저장
//			
//			electronics.setFname(mfile.getOriginalFilename());
//			electronics.setFsize(mfile.getSize());
//		
//		ask.setFname(mfile.getOriginalFilename());
//		ask.setFsize(mfile.getSize());
//			
//		} 
		
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











