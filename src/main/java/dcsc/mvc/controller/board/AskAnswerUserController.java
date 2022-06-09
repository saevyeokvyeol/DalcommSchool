package dcsc.mvc.controller.board;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.board.Ask;
import dcsc.mvc.domain.board.AskCategory;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.service.board.AskAnswerService;
import dcsc.mvc.util.ImageLink;
<<<<<<< HEAD
import dcsc.mvc.util.Link;
=======
>>>>>>> 9c1fb908fa3cf7a7a997f07d872745a10ac14c94
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/board/askanswer")
public class AskAnswerUserController {

	private final AskAnswerService askAnswerService;  
	
	       
	 /**
	  * 학생 ID로 자신 1대1문의 조회 
	  * */
	@RequestMapping("/askAnswerStudent") 
	public String selectByStudentId(String studentId, Model model) {
		
		studentId = "jang1234"; 
		   
		List<Ask> askSelectByIdList=askAnswerService.selectById(studentId);
		 
		model.addAttribute("askSelectByIdList", askSelectByIdList);
		
		return "/main/board/askanswer/askAnswerSelectById"; 
	} 
	
	 /**
	  * 선생님 ID로 자신 1대1문의 조회 
	  * */
	@RequestMapping("/askAnswerTeacher") 
	public String selectByTeacherId(String teacherId, Model model) {
		
		teacherId = ""; 
		   
		List<Ask> askSelectByIdList=askAnswerService.selectById(teacherId);
		 
		model.addAttribute("askSelectByIdList", askSelectByIdList);
		
		return "/teacher/board/askanswer/askAnswerSelectById"; 
	}
	   
	/** 
	 * 등록폼  
	 * */
	@RequestMapping("/askAnswerWrite")
	public void askAnswerWrite() {}
	 
	 
	@RequestMapping("/insert")
	public String insert(Ask ask, AskCategory askCategory,Student student, MultipartFile file,HttpSession session)throws Exception {
		
		String askComplete="F";
		
		ask.setAskCategory(askCategory);
		ask.setStudent(student);
		ask.setAskComplete(askComplete);
		
		

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
		  
		if(file.getSize() > 0) {
<<<<<<< HEAD
			File img = new File(ImageLink.ASK_IMG + file.getOriginalFilename());
=======
			File img = new File(ImageLink.CLASS_IMG + file.getOriginalFilename());
>>>>>>> 9c1fb908fa3cf7a7a997f07d872745a10ac14c94
			file.transferTo(img);
			
			ask.setAskImg(file.getOriginalFilename());
			
		} 
		  
		askAnswerService.insertAsk(ask);
		
		return "/main/board/askanswer/askAnswerTest";
	} 
	  
	  
	/**
	 * 수정폼(학생)
	 * */
	@RequestMapping("/updateFormStudent") 
	public ModelAndView updateFormStudent(Long askNo) {
		Ask askSelectByIdList=askAnswerService.selectByAskNo(askNo);
		System.out.println("askSelectByIdList.getAskNo()"+askSelectByIdList.getAskNo());
		return new ModelAndView("/main/board/askanswer/askAnswerUpdate","askSelectByIdList",askSelectByIdList);
	}
	
	/** 
	 * 1대1 문의 수정하기(학생)     
	 * */ 
	@RequestMapping("/updateStudent")
	public String updateStudent(Ask ask, MultipartFile file)throws Exception {
		
		Ask dbAsk=askAnswerService.updateAsk(ask);
		
		if(file.getSize() > 0) {
			File img = new File(ImageLink.ASK_IMG + file.getOriginalFilename());
			file.transferTo(img);
			
			ask.setAskImg(file.getOriginalFilename());
			
		} 
		
		
		//return new ModelAndView("/main/board/askanswer/askAnswerSelectById","askSelectByIdList",dbAsk); 
		return "redirect:/main/board/askanswer/askAnswer";
	}
	    
	/**
	 * 수정폼(선생님)
	 * */
	@RequestMapping("/updateFormTeacher") 
	public ModelAndView updateFormTeacher(Long askNo) {
		Ask askSelectByIdList=askAnswerService.selectByAskNo(askNo);
		System.out.println("askSelectByIdList.getAskNo()"+askSelectByIdList.getAskNo());
		return new ModelAndView("/teacher/board/askanswer/askAnswerUpdate","askSelectByIdList",askSelectByIdList);
	}
	 
	/** 
	 * 1대1 문의 수정하기(선생님)     
	 * */ 
	@RequestMapping("/updateTeacher")
	public String updateTeacher(Ask ask, MultipartFile file)throws Exception {
		
		Ask dbAsk=askAnswerService.updateAsk(ask);
		
		if(file.getSize() > 0) {
			File img = new File(ImageLink.ASK_IMG + file.getOriginalFilename());
			file.transferTo(img);
			
			ask.setAskImg(file.getOriginalFilename());
			
		} 
		
		
	
		return "redirect:/main/board/askanswer/askAnswerTeacher";
	}
	
	
	
	/**   
	 * 1대1 문의 삭제하기 (학생)
	 * */
	@RequestMapping("/deleteStudent")
	public String deleteStudent(Long askNo) {
		
		askAnswerService.deleteAsk(askNo); 
		
		return "redirect:/main/board/askanswer/askAnswerStudent";
	} 
	
	/** 
	 * 1대1 문의 삭제하기 (선생님)
	 * */
	@RequestMapping("/deleteTeacher")
	public String deleteTeacher(Long askNo) {
		
		askAnswerService.deleteAsk(askNo);
		
		return "redirect:/main/board/askanswer/askAnswerTeacher";
	}

	
}











