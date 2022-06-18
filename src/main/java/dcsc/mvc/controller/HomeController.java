package dcsc.mvc.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dcsc.mvc.domain.classes.Book;
import dcsc.mvc.domain.classes.ClassCategory;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.classes.Likes;
import dcsc.mvc.domain.classes.Search;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.repository.user.StudentRepository;
import dcsc.mvc.service.classes.BookService;
import dcsc.mvc.service.classes.ClassesService;
import dcsc.mvc.service.classes.LikeService;
import dcsc.mvc.service.user.StudentService;
import dcsc.mvc.service.user.TeacherService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	private final TeacherService teacherService;
	private final ClassesService classesService;
	private final LikeService likeService;
	private final BookService bookService;
	private final StudentService studentService;
	
	@RequestMapping("/") 
	public String index(Model model) {
		// 로그인 했을 경우
		Student student = null;
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof Student) {
			student = (Student)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		}
		
		Pageable pageable = PageRequest.of(0, 6);
		
		// 인기 클래스 목록
		Page<Classes> popularList = classesService.selectByFilter(new Search(null, null, null, "likes"), pageable, 3L);

		// 신규 클래스 목록
		Page<Classes> newList = classesService.selectNewClass(pageable);
		
		if(student != null) {
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

			// 마이 리스트에 추가했을 경우 체크
			for(Likes l : likeList) {
				for(Classes c : newList.getContent()) {
					if(c.getClassId() == l.getClasses().getClassId()) {
						c.setLikeId(l.getLikeId());
						break;
					}
				}
			}
		}

		model.addAttribute("popularList", popularList);
		model.addAttribute("newList", newList);
		
		return "index"; 
	}
	
	@RequestMapping("/teacher") 
	public String teacherIndex(Model model) {
		Teacher teacher = (Teacher)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		
		List<Book> bookList = bookService.selectByTeacherIdAndDate(teacher.getTeacherId());
		int todayProfit = 0;
		
		if(bookList != null) {
			for(Book b : bookList) {
				todayProfit += b.getTotalPrice();
			}
		}
		
		List<Classes> classList = classesService.selectByTeacherId(teacher.getTeacherId());
		
		model.addAttribute("title", teacher.getTeacherNickname() + " 선생님");
		model.addAttribute("teacher", teacher);
		model.addAttribute("bookList", bookList);
		model.addAttribute("classList", classList);
		model.addAttribute("todayProfit", todayProfit);
		return "teacher/index"; 
	}
	
	@RequestMapping("/admin") 
	public String adminIndex(Model model) {
		int studentNum = 0;
		
		List<Student> students = studentService.selectNewStudent();
		if(students != null) {
			studentNum = students.size();
		}
		int teacherNum = teacherService.selectNewTeacher().size();
		
		List<Teacher> teachers = teacherService.selectNewTeacher();
		if(teachers != null) {
			teacherNum = teachers.size();
		}
		
		int userNum = 0;
		int totalProfit = 0;
		
		students = studentService.selectAllStudent();
		teachers = teacherService.selectAllTeacher();
		
		if(students != null) {
			userNum += students.size();
		}
		if(teachers != null) {
			userNum += teachers.size();
			for(Teacher t : teachers) {
				totalProfit += t.getTotalProfit();
			}
		}
		
		model.addAttribute("title", "ADMIN");
		model.addAttribute("studentNum", studentNum);
		model.addAttribute("teacherNum", teacherNum);
		model.addAttribute("userNum", userNum);
		model.addAttribute("totalProfit", totalProfit);
		return "admin/index"; 
	}
	
}
