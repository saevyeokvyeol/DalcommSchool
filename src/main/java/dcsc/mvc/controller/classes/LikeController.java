package dcsc.mvc.controller.classes;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dcsc.mvc.domain.classes.ClassDTO;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.classes.Likes;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.service.classes.LikeService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LikeController {
	private final LikeService likeService;
	/**
	 * 클래스 찜 등록
	 * */
	@RequestMapping("/like/insert")
	@ResponseBody
	public Likes insert(Classes classes) {
		Student student = null;
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof Student) {
			student = (Student)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		} else {
			throw new RuntimeException("로그인 후 이용 가능합니다.");
		}
		
		Likes likes = new Likes(null, classes, student);
		
		return likeService.insert(likes);
	}
	
	/**
	 * 클래스 찜 삭제
	 * */
	@RequestMapping("/like/deleteByLikeId")
	@ResponseBody
	public Long deleteByLikeId(Long likeId) {
		Student student = null;
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof Student) {
			student = (Student)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		} else {
			throw new RuntimeException("로그인 후 이용 가능합니다.");
		}
		
		Likes likes = likeService.deleteByLikeId(likeId);
		return likes.getClasses().getClassId();
	}
	
	/**
	 * 클래스 찜 전체 삭제
	 * */
	@RequestMapping("/like/deleteByStudentId")
	@ResponseBody
	public void deleteByStudentId() {
		Student student = null;
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof Student) {
			student = (Student)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		} else {
			throw new RuntimeException("로그인 후 이용 가능합니다.");
		}
		
		likeService.deleteByStudentId(student.getStudentId());
	}
	
	/**
	 * 회원 아이디로 찜 목록 조회
	 * */
	@RequestMapping("/like/selectByStudentId")
	@ResponseBody
	public List<ClassDTO> selectByStudentId() {
		Student student = null;
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof Student) {
			student = (Student)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		} else {
			throw new RuntimeException("로그인 후 이용 가능합니다.");
		}
		
		List<Likes> list = likeService.selectByStudentId(student.getStudentId());
		List<ClassDTO> dtoList = new ArrayList<ClassDTO>();
		
		for(Likes l : list) {
			ClassDTO classDTO = new ClassDTO(l.getClasses().getClassId(), l.getClasses().getClassName(), l.getClasses().getClassPrice(), l.getClasses().getTeacher().getTeacherNickname(), l.getClasses().getClassState().getStateId(), l.getClasses().getClassImage(), l.getLikeId());
			
			dtoList.add(classDTO);
		}
		
		return dtoList;
	}
}