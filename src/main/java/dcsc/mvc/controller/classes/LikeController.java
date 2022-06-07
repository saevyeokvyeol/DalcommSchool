package dcsc.mvc.controller.classes;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dcsc.mvc.domain.classes.ClassDTO;
import dcsc.mvc.domain.classes.ClassImage;
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
		Student student = new Student("kim1234", null, null, null, null, null, null, null, null);
		Likes likes = new Likes(null, classes, student);
		
		return likeService.insert(likes);
	}
	
	/**
	 * 클래스 찜 삭제
	 * */
	@RequestMapping("/like/deleteByLikeId")
	@ResponseBody
	public Long deleteByLikeId(Long likeId) {
		Likes likes = likeService.deleteByLikeId(likeId);
		return likes.getClasses().getClassId();
	}
	
	/**
	 * 클래스 찜 전체 삭제
	 * */
	@RequestMapping("/like/deleteByStudentId")
	@ResponseBody
	public void deleteByStudentId() {
		String studentId = "kim1234";
		likeService.deleteByStudentId(studentId);
	}
	
	/**
	 * 찜 페이지로 이동
	 * */
	@RequestMapping("/main/mypage/myList")
	public String myList() {
		return "/main/mypage/myList";
	}
	
	/**
	 * 회원 아이디로 찜 목록 조회
	 * */
	@RequestMapping("/like/selectByStudentId")
	@ResponseBody
	public List<ClassDTO> selectByStudentId() {
		String studentId = "kim1234";
		List<Likes> list = likeService.selectByStudentId(studentId);
		List<ClassDTO> dtoList = new ArrayList<ClassDTO>();
		
		for(Likes l : list) {
			Classes classes = l.getClasses();
			List<ClassImage> Imgs = classes.getClassImages();
			String img = null;
			
			for(ClassImage i : Imgs) {
				if(i.getThumbnailState().equals("T")) img = i.getImageName();
			}
			ClassDTO classDTO = new ClassDTO(classes.getClassId(), classes.getClassName(), classes.getClassPrice(), classes.getTeacher().getTeacherNickname(), classes.getClassState().getStateId(), img);
			
			dtoList.add(classDTO);
		}
		
		return dtoList;
	}
}