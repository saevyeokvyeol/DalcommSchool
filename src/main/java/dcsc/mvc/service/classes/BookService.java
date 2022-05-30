package dcsc.mvc.service.classes;

import dcsc.mvc.domain.classes.Book;

public interface BookService {
	/**
	 * 클래스 예약 등록
	 * @param Book(학생ID, 클래스ID, 일정ID, 쿠폰번호, 인원 수, 수강자 이름, 전화번호)
	 * */
	void insert(Book book);

	/**
	 * 클래스 예약 일정 변경
	 * @param Book(예약ID, 일정ID)
	 * */
	void updateSchedule(Book book);

	/**
	 * 클래스 예약 상태 변경
	 * @param Book(예약ID, 예약상태ID)
	 * */
	void updateState(Book book);
}
