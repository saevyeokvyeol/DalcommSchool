package dcsc.mvc.controller.user;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dcsc.mvc.domain.board.Event;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.service.user.StudentService;
import dcsc.mvc.service.user.TeacherService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	public final StudentService studentService;
	public final TeacherService teacherService;
	
	private final static int PAGE_COUNT=8;
	private final static int BLOCK_COUNT=4;
	
	//관리자페이지
	@RequestMapping("/user/userList")
	public ModelAndView adminStudent(Model model, @RequestParam(defaultValue = "1") int nowPage) {
		System.out.println("admin 호출...");
		
		//페이징 처리
		Pageable page = PageRequest.of( (nowPage-1) , PAGE_COUNT , Direction.DESC, "studentId");
		Page<Student> studentList = studentService.selectAllStudent(page);

		model.addAttribute("studentList", studentList);
		
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage - temp;
		
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
		
		return new ModelAndView("/admin/user/userList","studentList",studentList);
	}

	
	//관리자페이지에서 특정 회원 검색
	@RequestMapping("/user/userSearch")
	public ModelAndView studentInquiry(String keyfield , String keyword) {
		System.out.println("keyfield : " + keyfield +" / " + "keyword : "+ keyword);
		System.out.println("memberInquiry 호출...");
		List<Student> list = studentService.selectByStudentId(keyfield , keyword);
		
		return new ModelAndView("/admin/user/userList","studentList",list);
	}
	
	
	//관리자페이지
	@RequestMapping("/user/teacherList")
	public ModelAndView adminTeacher(Model model, @RequestParam(defaultValue = "1") int nowPage) {
		System.out.println("admin 강사 조회 호출...");
		
		//페이징 처리
		Pageable page = PageRequest.of( (nowPage-1) , PAGE_COUNT , Direction.DESC, "teacherId");
		Page<Teacher> teacherList = teacherService.selectAllTeacher(page);

		model.addAttribute("teacherList", teacherList);
		
		int temp = (nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage - temp;
		
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
		
		return new ModelAndView("admin/user/teacherList","teacherList",teacherList);
	}
	
	//관리자페이지에서 특정 강사 검색
	@RequestMapping("/user/teacherSearch")
	public ModelAndView techerInquiry(String keyfield , String keyword) {
		System.out.println("keyfield : " + keyfield +" / " + "keyword : "+ keyword);
		System.out.println("teacherInquiry 호출...");
		List<Teacher> list = teacherService.selectByTeacherId(keyfield, keyword);
		
		return new ModelAndView("admin/user/teacherList","teacherList",list);
	}

}
