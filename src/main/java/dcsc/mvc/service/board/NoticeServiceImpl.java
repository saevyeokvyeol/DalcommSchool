package dcsc.mvc.service.board;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.jpa.JPQLQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;

import dcsc.mvc.domain.board.Notice;
import dcsc.mvc.domain.board.QNotice;
import dcsc.mvc.repository.board.NoticeRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	private final NoticeRepository noRepository;
	private final JPAQueryFactory factory;
	
	@Override
	public void insertNotice(Notice notice) {
		Notice saveFree= noRepository.save(notice);
		System.out.println("saveFree = " + saveFree);
	}
		
	@Override
	public Notice updateNotice(Notice notice) {
		
		Notice dbNotice = noRepository.findById(notice.getNoticeNo()).orElse(null);
		if(dbNotice==null) {
			throw new RuntimeException("글번호 오류로 수정할수 없습니다.");
		}

		dbNotice.setNoticeTitle(notice.getNoticeTitle());
		dbNotice.setNoticeContent(notice.getNoticeContent());
		dbNotice.setNoticeImg(notice.getNoticeImg());
		dbNotice.setNoticeUpdateDate(notice.getNoticeUpdateDate());
		
		return dbNotice;
	}

	@Override
	public void deleteNotice(Long noticeNo) {
		Notice dbNotice = noRepository.findById(noticeNo).orElse(null);
		if(dbNotice==null) {
			throw new RuntimeException("글번호 오류로 삭제할수 없습니다.");
		}
		noRepository.deleteById(noticeNo);
	}

	@Override
	public Notice selectByNotuceNo(Long noticeNo,boolean state) {
		if(state) {
			//조회수 증가해보자
			noRepository.updateReadNum(noticeNo);
		}
		Notice notice = noRepository.findById(noticeNo).orElse(null);
		if(notice==null)new RuntimeException("상세보기에 오류가 발생했습니다.");
		return notice;
	} 

	@Override
	public List<Notice> selectAllNotice() {
		List<Notice> list = noRepository.findAll();
		
		return list;
	}
	
	@Override
	public Page<Notice> selectAllNotice(Pageable pageable) {
		return noRepository.findAll(pageable);
	}

	@Override 
	public Page<Notice> selectByKeyword(String keyword,Pageable pageable) {
		BooleanBuilder booleanBuilder = new BooleanBuilder();
		
		QNotice notice = QNotice.notice;
		
		booleanBuilder.and(notice.noticeContent.like("%"+keyword+"%"));
		booleanBuilder.or(notice.noticeTitle.like("%"+keyword+"%"));
		
		JPQLQuery<Notice> jpqlQuery = factory.selectFrom(notice).where(booleanBuilder)
				.offset(pageable.getOffset()).limit(pageable.getPageSize());

		
		Page<Notice> list = new PageImpl<Notice>(jpqlQuery.fetch(), pageable,jpqlQuery.fetch().size());
		
		System.out.println("keyword출력 서비스 impl = "+keyword);
		return list;
	}

	
}
