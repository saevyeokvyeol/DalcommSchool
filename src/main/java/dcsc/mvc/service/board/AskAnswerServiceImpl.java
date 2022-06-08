package dcsc.mvc.service.board;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.querydsl.core.BooleanBuilder;

import dcsc.mvc.domain.board.Answer;
import dcsc.mvc.domain.board.Ask;
import dcsc.mvc.domain.board.QAsk;
import dcsc.mvc.repository.board.AnswerRepository;
import dcsc.mvc.repository.board.AskRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class AskAnswerServiceImpl implements AskAnswerService {

	private final AnswerRepository answerRep;
	private final AskRepository askRep;
	
	/**
	 * 1대1 문의 등록하기(학생&선생님) 
	 * */
	@Override
	public void insertAsk(Ask ask) {
		
		Ask dbAsk=askRep.save(ask);
		if(dbAsk==null)throw new RuntimeException();
		  
		System.out.println("============dbAsk : "+dbAsk); 
	}
	/**
	 * 1대1 문의 수정하기 (학생&선생님)
	 * */ 
	@Override  
	public Ask updateAsk(Ask ask) {
		Ask dbAsk=askRep.findById(ask.getAskNo()).orElse(null);

		if(dbAsk==null)throw new RuntimeException("글번호 오류로 수정할 수 없습니다.");
		
		
		//수정완료
		dbAsk.setAskTitle(ask.getAskTitle());//제목
		dbAsk.setAskContent(ask.getAskContent());//문의내용
		//dbAsk.setAskImg(ask.getAskImg());//이미지
 
		return dbAsk;
	}
	/**
	 * 1대1문의 삭제하기 (학생&선생님)
	 * */
	@Override
	public void deleteAsk(Long askNo) {
		
		Ask dbAsk=askRep.findById(askNo).orElse(null);
		
		if(dbAsk==null)throw new RuntimeException("글 번호 오류로 삭제 할 수 없습니다");
		
		askRep.deleteById(askNo);
		
	}
	/**
	 * 1대1문의 답변하는 기능(관리자)
	 * */
	@Override
	public void insertAnswer(Answer answer) {
		// TODO Auto-generated method stub

	}

	/**
	 * 1대1문의 전체 리스트 조회하는 기능(관리자) 
	 * */
	@Override
	public List<Ask> selectAll() {
		
		return askRep.findAll();
	}
	/**
	 * 내가 쓴 1대1 문의 리스트 조회하기 기능(학생&선생님)
	 * --------동적쿼리
	 * */
	@Override  
	public List<Ask> selectById(String id) {
		
		BooleanBuilder booleanBuilder = new BooleanBuilder();
		
		QAsk ask = QAsk.ask;
		booleanBuilder.and(ask.teacher.teacherId.eq(id));
		booleanBuilder.or(ask.student.studentId.eq(id));
		
		Iterable<Ask> iterable = askRep.findAll(booleanBuilder);
		 
		List<Ask> list = Lists.newArrayList(iterable);
		
		
		return list;
	} 
	/**
	 * 1대1 문의 상세보기  기능(학생&선생님)
	 * */
	@Override
	public Ask selectByAskNo(Long askNo) {
		Ask dbAsk=askRep.findById(askNo).orElse(null);
		
		if(dbAsk==null)new RuntimeException("상세보기에 오류가 발생함!");
		
		return dbAsk;
	}

}
