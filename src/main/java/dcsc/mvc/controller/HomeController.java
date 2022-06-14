package dcsc.mvc.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.classes.Likes;
import dcsc.mvc.domain.classes.Search;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.service.classes.ClassesService;
import dcsc.mvc.service.classes.LikeService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	private final ClassesService classesService;
	private final LikeService likeService;
	
	private int page = 0;
	private int size = 6;
	
	@RequestMapping("/") 
	public String index(Model model) {
		// 로그인 했을 경우
		Student student = new Student("kim1234", null, null, null, null, null, null, null, null);
		
		Pageable pageable = PageRequest.of(page, size);
		
		// 인기 클래스 목록
		Page<Classes> popularList = classesService.selectByFilter(new Search(null, null, null, "likes"), pageable, 3L);
		
		// 학생의 마이리스트 가져오기
		List<Likes> likeList = likeService.selectByStudentId(student.getStudentId());

		// 마이 리스트에 추가했을 경우 체크
		for(Likes l : likeList) {
			for(Classes c : popularList.getContent()) {
				if(c.getClassId() == l.getClasses().getClassId()) {
					c.setLikeId(l.getLikeId());
					break;
				}
			}
		}
		model.addAttribute("popularList", popularList);
		
		// 신규 클래스 목록
		Page<Classes> newList = classesService.selectNewClass(pageable);

		// 마이 리스트에 추가했을 경우 체크
		for(Likes l : likeList) {
			for(Classes c : newList.getContent()) {
				if(c.getClassId() == l.getClasses().getClassId()) {
					c.setLikeId(l.getLikeId());
					break;
				}
			}
		}
		
		model.addAttribute("newList", newList);
		
		return "index"; 
	}
	
}
