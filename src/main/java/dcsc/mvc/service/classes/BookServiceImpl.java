package dcsc.mvc.service.classes;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.querydsl.jpa.impl.JPAQueryFactory;

import dcsc.mvc.domain.classes.Book;
import dcsc.mvc.domain.classes.ClassSchedule;
import dcsc.mvc.domain.coupon.Coupon;
import dcsc.mvc.domain.coupon.IssueCoupon;
import dcsc.mvc.repository.classes.BookRepository;
import dcsc.mvc.repository.classes.ClassScheduleRepository;
import dcsc.mvc.repository.coupon.CouponRepository;
import dcsc.mvc.repository.coupon.IssueCouponRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class BookServiceImpl implements BookService {
	private final BookRepository bookRepository;
	private final ClassScheduleRepository classScheduleRepository;
	private final IssueCouponRepository issueCouponRepository;

	/**
	 * 클래스 예약 등록
	 * @param Book(학생ID, 클래스ID, 일정ID, 쿠폰번호, 인원 수, 수강자 이름, 전화번호)
	 * */
	@Override
	public void insert(Book book) {
		bookRepository.save(book);
		
		ClassSchedule schedule = classScheduleRepository.findById(book.getClassSchedule().getScheduleId()).orElse(null);
		schedule.setLeftSeat(schedule.getLeftSeat() - book.getBookSeat());
		
		if(book.getIssueCoupon() != null && book.getIssueCoupon().getIssueNo() > 0L) {
			IssueCoupon issueCoupon = issueCouponRepository.findById(book.getIssueCoupon().getIssueNo()).orElse(null);
			issueCoupon.setIssueUsable("T");
		}
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
