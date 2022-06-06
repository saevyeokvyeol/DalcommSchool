package dcsc.mvc.service.board;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import dcsc.mvc.domain.board.Notice;
import dcsc.mvc.repository.board.NoticeRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	private final NoticeRepository noRepository;
	
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
	public Notice selectBy(Long noticeNo,boolean state) {
		if(state) {
			//조회수 증가해보자
		}
		Notice notice = noRepository.findById(noticeNo).orElse(null);
		if(notice==null)new RuntimeException("상세보기에 오류가 발생했습니다.");
		return notice;
	}

	@Override
	public List<Notice> selectAllNotice() {
		return noRepository.findAll();
	}

	@Override
	public List<Notice> selectByKeyword(String keyfield, String keyword) {
		List<Notice> list = null;
		switch (keyfield) {
		case "noticeTitle":
			System.out.println("noticeTitle....호출");
			list = noRepository.findByNoticeTitleIsLike(keyword);
			break;
			
		case "noticeContent":
			System.out.println("noticeContent....호출");
			list = noRepository.findByNoticeContentIsLike(keyword);
			break;
		}
		
		return list;
	}
	

}
