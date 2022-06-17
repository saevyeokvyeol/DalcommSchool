package dcsc.mvc.controller.board;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

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

import dcsc.mvc.domain.board.Ask;
import dcsc.mvc.domain.board.AskCategory;
import dcsc.mvc.domain.board.Event;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.service.board.AskAnswerService;
import dcsc.mvc.util.ImageLink;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class AskAnswerUserController {

	private final AskAnswerService askAnswerService;  
	
	private final static int PAGE_COUNT=8;
	private final static int BLOCK_COUNT=5;
	       
	 /**            
	  * 학생 ID로 자신 1대1문의 조회 
	  * */
	@RequestMapping("main/mypage/askAnswerSelectById") 
	public void selectByStudentId(String studentId, Model model,@RequestParam(defaultValue = "1") int page) {
		
		studentId = "jang1234"; 
		   
		
		/*
		 * List<Ask> askSelectByIdList=askAnswerService.selectById(studentId);
		 * 
		 * model.addAttribute("askSelectByIdList", askSelectByIdList);
		 */
		
		//페이징 처리
			Pageable pageable = PageRequest.of( (page-1) , PAGE_COUNT , Direction.DESC, "askNo");
			
			//Pageable pageable = PageRequest.of(page - 1, PAGE_COUNT);
			
			Page<Ask> askSelectByIdList = askAnswerService.selectById(studentId, pageable);
			
			model.addAttribute("askSelectByIdList", askSelectByIdList);
			
			int temp = (page-1)%BLOCK_COUNT;
			int startPage = page - temp;
			
			model.addAttribute("blockCount", BLOCK_COUNT);
			model.addAttribute("startPage", startPage);
			model.addAttribute("page", page);
	
		//return "main/board/askanswer/askAnswerSelectById"; 
	} 
	
	 /**
	  * 선생님 ID로 자신 1대1문의 조회 
	  * */
	@RequestMapping("teacher/board/askanswer/askAnswerSelectById") 
	public String selectByTeacherId(String teacherId, Model model,@RequestParam(defaultValue = "1") int nowPage) {
		
		teacherId = "Tjang1234"; 
		   
		/*
		 * List<Ask> askSelectByIdList=askAnswerService.selectById(teacherId);
		 * 
		 * model.addAttribute("askSelectByIdList", askSelectByIdList);
		 */
		
		//페이징 처리
		Pageable page = PageRequest.of( (nowPage-1) , PAGE_COUNT , Direction.DESC, "askNo");
		Page<Ask> askSelectByIdList = askAnswerService.selectById(teacherId, page);
		
		model.addAttribute("askSelectByIdList", askSelectByIdList);
		
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage - temp;
		
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
		
		
		return "teacher/board/askanswer/askAnswerSelectById"; 
	}
	   
	/**
	 * 1대1문의 상세보기기능(학생)
	 * */
	@RequestMapping("main/board/askanswer/askAnswerDetailStudent/{askNo}")
	public ModelAndView askAnswerDetailStudent(@PathVariable Long askNo) {
		
		Ask askAnswerDetail=askAnswerService.selectByAskNo(askNo);
		
		return new ModelAndView("main/mypage/askAnswerDetailStudent","askAnswerDetail",askAnswerDetail);
	}
	
	
	/**
	 * 1대1문의 상세보기기능(선생님)
	 * */
	@RequestMapping("teacher/board/askanswer/askAnswerDetailTeacher/{askNo}")
	public ModelAndView askAnswerDetailTeacher(@PathVariable Long askNo) {
		
		Ask askAnswerDetail=askAnswerService.selectByAskNo(askNo);
		
		return new ModelAndView("teacher/board/askanswer/askAnswerDetailTeacher","askAnswerDetail",askAnswerDetail);
	}
	 
	 
	/** 
	 * 등록폼(학생)  
	 * */
	@RequestMapping("main/mypage/askForm")
	public void askAnswerWriteStudent() {}
	 
	 
	/**
	 * 등록하기 (학생)
	 * */  
	@RequestMapping("main/board/askanswer/insertStudent")
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
			File img = new File(ImageLink.ASK_IMG + file.getOriginalFilename());

			file.transferTo(img);
			
			ask.setAskImg(file.getOriginalFilename());
			
		} 
		   
		askAnswerService.insertAsk(ask);
		
		return "redirect:/main/mypage/askAnswerSelectById";
	} 
	  
	
	/** 
	 * 등록폼(선생님)  
	 * */			
	@RequestMapping("teacher/board/askanswer/askAnswerWriteTeacher")
	public void askAnswerWriteTeacher() {}
	 
	/**
	 * 등록하기(선생님
	 * */		
	@RequestMapping("teacher/board/askanswer/insertTeacher")
	public String insertTeacher(Ask ask, AskCategory askCategory,Teacher teacher, MultipartFile file,HttpSession session)throws Exception {
		
		String askComplete="F";
		
		ask.setAskCategory(askCategory);
		ask.setTeacher(teacher);
		ask.setAskComplete(askComplete); 
		
		if(file.getSize() > 0) {
			File img = new File(ImageLink.ASK_IMG + file.getOriginalFilename());

			file.transferTo(img);
			
			ask.setAskImg(file.getOriginalFilename());
			
		} 
		  
		askAnswerService.insertAsk(ask);
		
		return "redirect:/teacher/board/askanswer/askAnswerSelectById";
	} 
	
	  
	/**
	 * 수정폼(학생)
	 * */
	@RequestMapping("main/board/askanswer/updateFormStudent") 
	public ModelAndView updateFormStudent(Long askNo) {
		Ask askSelectByIdList=askAnswerService.selectByAskNo(askNo);
		System.out.println("askSelectByIdList.getAskNo()"+askSelectByIdList.getAskNo());
		return new ModelAndView("main/mypage/askAnswerUpdate","askSelectByIdList",askSelectByIdList);
	}
	
	/** 
	 * 1대1 문의 수정하기(학생)     
	 * */ 
	@RequestMapping("main/board/askanswer/updateStudent")
	public String updateStudent(Ask ask, MultipartFile file)throws Exception {
		
		System.out.println("file : " + file);
		System.out.println("file***************!!!!!!!!!!"+file.getOriginalFilename());
		
		
		  if(file.getSize() > 0) { 
			  File img = new File(ImageLink.ASK_IMG +file.getOriginalFilename()); 
			  file.transferTo(img);
			  
		  
		  ask.setAskImg(file.getOriginalFilename());
		  
		  }
		  
		  
		 
		Ask dbAsk=askAnswerService.updateAsk(ask);
		//return new ModelAndView("/main/board/askanswer/askAnswerSelectById","askSelectByIdList",dbAsk); 
		return "redirect:/main/mypage/askAnswerSelectById"; 
	}
					
	/**
	 * 수정폼(선생님)
	 * */
	@RequestMapping("teacher/board/askanswer/updateFormTeacher") 
	public ModelAndView updateFormTeacher(Long askNo) {
		Ask askSelectByIdList=askAnswerService.selectByAskNo(askNo);
		System.out.println("askSelectByIdList.getAskNo()"+askSelectByIdList.getAskNo());
		return new ModelAndView("teacher/board/askanswer/askAnswerUpdate","askSelectByIdList",askSelectByIdList);
	}
	 
	/** 
	 * 1대1 문의 수정하기(선생님)     
	 * */ 
	@RequestMapping("teacher/board/askanswer/updateTeacher")
	public String updateTeacher(Ask ask,MultipartFile file)throws Exception{
		
		 if(file.getSize() > 0) { 
			  File img = new File(ImageLink.ASK_IMG +file.getOriginalFilename()); 
			  file.transferTo(img);
			  
		  
		  ask.setAskImg(file.getOriginalFilename());
		  
		  }
		  
		  
		 
		Ask dbAsk=askAnswerService.updateAsk(ask);		
	
		return "redirect:/teacher/board/askanswer/askAnswerSelectById";
	}
	
	
	/**   
	 * 1대1 문의 삭제하기 (학생)
	 * */
	@RequestMapping("main/board/askanswer/deleteStudent")
	public String deleteStudent(Long askNo) {
		
		askAnswerService.deleteAsk(askNo); 
		
		return "redirect:/main/mypage/askAnswerSelectById";
	} 
	
	/** 
	 * 1대1 문의 삭제하기 (선생님)
	 * */
	@RequestMapping("teacher/board/askanswer/deleteTeacher")
	public String deleteTeacher(Long askNo) {
		
		askAnswerService.deleteAsk(askNo);
		
		return "redirect:/teacher/board/askanswer/askAnswerSelectById";
	}

	/**
	 * 1대1문의 검색하기(학생)
	 * */
	@RequestMapping("main/board/askAnswerSearch")
	 public String selectByKeyword(String keyword, Model model, @RequestParam(defaultValue = "1") int page) {
		 
		 //List<Ask> list=askAnswerService.selectByKeyword(keyword);
		 
		 Pageable pageable = PageRequest.of((page - 1), PAGE_COUNT, Direction.DESC, "askNo");
			Page<Ask> askSelectByIdList = askAnswerService.selectBykeyword(keyword,pageable);

			model.addAttribute("askSelectByIdList", askSelectByIdList);

			int temp = (page-1)%BLOCK_COUNT;
			int startPage = page - temp;

			model.addAttribute("blockCount", BLOCK_COUNT);
			model.addAttribute("startPage", startPage);
			model.addAttribute("page", page);
		 
		 
		 return "main/mypage/askAnswerSelectById";
	 }
	
	
	/**
	 * 1대1문의 검색하기(선생님)
	 * */
	@RequestMapping("teacher/board/askAnswerSearchTeacher")
	 public String selectByKeywordTeacher(String keyword, Model model, @RequestParam(defaultValue = "1") int page) {
		 
		 //List<Ask> list=askAnswerService.selectByKeyword(keyword);
		 
		 Pageable pageable = PageRequest.of((page - 1), PAGE_COUNT, Direction.DESC, "askNo");
			Page<Ask> askSelectByIdList = askAnswerService.selectBykeyword(keyword,pageable);

			model.addAttribute("askSelectByIdList", askSelectByIdList);

			int temp = (page-1)%BLOCK_COUNT;
			int startPage = page - temp;

			model.addAttribute("blockCount", BLOCK_COUNT);
			model.addAttribute("startPage", startPage);
			model.addAttribute("page", page);
		 
		 
		 return "teacher/board/askanswer/askAnswerSelectById";
	 }
}











