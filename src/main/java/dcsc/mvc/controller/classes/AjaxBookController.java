package dcsc.mvc.controller.classes;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import dcsc.mvc.domain.classes.Book;
import dcsc.mvc.domain.classes.BookDTO;
import dcsc.mvc.domain.classes.FullCalendar;
import dcsc.mvc.service.classes.BookService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class AjaxBookController {
	private final BookService bookService;
	
	/***/
	
	/**
	 * 클래스 예약 일정 변경
	 * */
	@RequestMapping("/book/updateSchedule")
	public void updateSchedule(Long bookId, Long scheduleId) {
		System.out.println(bookId);
		System.out.println(scheduleId);
		bookService.updateSchedule(bookId, scheduleId);
	}
	
	/**
	 * 클래스 예약 상태 체험 완료로 변경
	 * */
	@RequestMapping("/book/updateFinish")
	public void updateFinish(Long bookId) {
		bookService.updateFinish(bookId);
	}
	
	/**
	 * 클래스 예약 취소
	 * */
	@RequestMapping("/book/bookCancel")
	public void deleteBook(Long bookId) {
		bookService.deleteBook(bookId);
	}
	
	/**
	 * 클래스 예약 취소
	 * */
	@RequestMapping("/book/updateFinishSubscript")
	public void updateFinishSubscript(Long bookId) {
		bookService.updateFinishSubscript(bookId);
	}
	
	/**
	 * 학생ID로 예약 조회
	 * */
	@RequestMapping("/book/selectCalendarByStudentId")
	public List<FullCalendar> selectCalendarByStudentId() {
		List<Book> list = bookService.selectByStudentId("kim1234");
		List<FullCalendar> calList = new ArrayList<FullCalendar>();
		
		for(Book b : list) {
			Date bookDate = b.getClassSchedule().getScheduleDate();
			bookDate.setHours(Integer.parseInt(b.getClassSchedule().getStartTime().substring(0, 2)));
			bookDate.setMinutes(Integer.parseInt(b.getClassSchedule().getStartTime().substring(3, 5)));
			
			FullCalendar calendar = new FullCalendar(b.getBookId(), b.getClassSchedule().getScheduleId(), b.getClasses().getClassName(), bookDate.toString());
			calList.add(calendar);
		}
		
		return calList;
	}
	
	/**
	 * 일정ID로 예약 조회
	 * */
	@RequestMapping("/book/selectByScheduleId")
	public List<BookDTO> selectByScheduleId(Long scheduleId) {
		List<Book> list = bookService.selectByScheduleId(scheduleId);
		List<BookDTO> dtoList = new ArrayList<BookDTO>();
		
		for(Book b : list) {
			Date bookDate = b.getClassSchedule().getScheduleDate();
			bookDate.setHours(Integer.parseInt(b.getClassSchedule().getStartTime().substring(0, 2)));
			bookDate.setMinutes(Integer.parseInt(b.getClassSchedule().getStartTime().substring(3, 5)));
			
			BookDTO bookDTO = new BookDTO(b.getBookId(), b.getStudent().getStudentId(),
					b.getClasses().getClassName(), bookDate.toString().substring(0, 16),
					b.getBookState().getBookStateName(), b.getBookSeat(), b.getTotalPrice(),
					b.getBookName(), b.getBookPhone());
			dtoList.add(bookDTO);
		}
		
		return dtoList;
	}
}
