package dcsc.mvc.service.classes;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.querydsl.jpa.impl.JPAQueryFactory;

import dcsc.mvc.domain.classes.Book;
import dcsc.mvc.repository.classes.BookRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class BookServiceImpl implements BookService {
	private final BookRepository bookRepository;

	/**
	 * 클래스 예약 등록
	 * @param Book(학생ID, 클래스ID, 일정ID, 쿠폰번호, 인원 수, 수강자 이름, 전화번호)
	 * */
	@Override
	public void insert(Book book) {
		// TODO Auto-generated method stub

	}

	/**
	 * 클래스 예약 일정 변경
	 * @param Book(예약ID, 일정ID)
	 * */
	@Override
	public void updateSchedule(Book book) {
		// TODO Auto-generated method stub

	}

	/**
	 * 클래스 예약 상태 변경
	 * @param Book(예약ID, 예약상태ID)
	 * */
	@Override
	public void updateState(Book book) {
		// TODO Auto-generated method stub

	}

}
