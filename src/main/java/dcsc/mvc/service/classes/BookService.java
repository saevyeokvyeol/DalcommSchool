package dcsc.mvc.service.classes;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import dcsc.mvc.domain.classes.Book;
import dcsc.mvc.domain.classes.Classes;

public interface BookService {
	/**
	 * 클래스 예약 등록
	 * @param Book(학생ID, 클래스ID, 일정ID, 쿠폰번호, 인원 수, 수강자 이름, 전화번호)
	 * @return
	 * */
	Book insert(Book book);

	/**
	 * 클래스 예약 일정 변경
	 * @param Long bookId, Long scheduleId
	 * */
	void updateSchedule(Long bookId, Long scheduleId);

	/**
	 * 클래스 예약 상태 체험 완료로 변경
	 * @param Long bookId
	 * */
	void updateFinish(Long bookId);

	/**
	 * 클래스 예약 취소
	 * @param Long bookId
	 * */
	void deleteBook(Long bookId);

	/**
	 * 예약ID로 예약 조회
	 * @param Long bookId
	 * @return Book
	 * */
	Book selectByBookId(Long bookId);

	/**
	 * 학생ID로 예약 조회
	 * @param String studentId
	 * @return List<Book>
	 * */
	List<Book> selectByStudentId(String studentId);

	/**
	 * 학생ID로 예약 조회
	 * @param String studentId
	 * @return Page<Book>
	 * */
	Page<Book> selectPageByStudentId(String studentId, Pageable pageable);

	/**
	 * 강사ID로 예약 조회
	 * @param String teacherId
	 * @return Page<Book>
	 * */
	Page<Book> selectByTeacherId(String teacherId, Pageable pageable);

	/**
	 * 일정ID로 예약 조회
	 * @param Long scheduleId
	 * @return List<Book>
	 * */
	List<Book> selectByScheduleId(Long scheduleId);
}
