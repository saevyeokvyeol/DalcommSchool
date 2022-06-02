package dcsc.mvc.service.board;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import dcsc.mvc.domain.board.ClassQna;
import dcsc.mvc.domain.board.ClassReply;
import dcsc.mvc.repository.board.ClassQnaReposiroty;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ClassQnaServiceImpl implements ClassQnaService {
	
	private final ClassQnaReposiroty classQnaRep;
	
	/**
	 * 전체검색
	 * */
	@Override
	public List<ClassQna> selectAllQna() {
		List<ClassQna> list = classQnaRep.findAll();
		System.out.println(list);
		return list;
	}
	
	/**
	 * 전체검색 - 페이징처리
	 * */
	@Override
	public Page<ClassQna> selectAllQna(Pageable Pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * Q&A 등록하기
	 * */
	@Override
	public void insertQuestion(ClassQna classQna) {
		ClassQna saveQna = classQnaRep.save(classQna);
		//System.out.println("saveQna.getQnaId = " + saveQna.getQnaId());
		//System.out.println("saveQna.getQnaTitle = " + saveQna.getQnaTitle());
		//System.out.println("saveQna.getClasses().getClassId() = " + saveQna.getClasses().getClassId());
		//System.out.println("saveQna.getStudent().getStudentId() = " + saveQna.getStudent().getStudentId());
		

	}

	@Override
	public void updateQuestion(ClassQna classQna) {
		ClassQna dbQna = classQnaRep.findById(classQna.getQnaId()).orElse(null);
		if(dbQna==null) {
			throw new RuntimeException("Q&A 문의글 번호 오류로 수정되지 않았습니다.");
		}
		
		dbQna.setQnaTitle(classQna.getQnaTitle());
		dbQna.setQnaContent(classQna.getQnaContent());
		dbQna.setBlindState(classQna.getBlindState());

	}

	@Override
	public void deleteQuestion(Long qnaId) {
		ClassQna dbQna = classQnaRep.findById(qnaId).orElse(null);
		
		if(dbQna==null) {
			throw new RuntimeException("글번호 오류로 삭제되지 않았습니다.");
		}
		
		classQnaRep.deleteById(qnaId);
	}

	@Override
	public List<ClassQna> selectByClassId(Long classId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ClassQna> selectByTeacherId(String teacherId) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * qna 상세보기
	 * */
	@Override
	public ClassQna selectByQnaId(Long qnaId) {
		ClassQna classQna = classQnaRep.findById(qnaId).orElse(null);
		if(classQna==null) {
			new RuntimeException("Q&A 상세보기에 오류가 발생했습니다.");
		}
		return classQna;
	}

	@Override
	public void updateBlind(Long qnaId) {
		// TODO Auto-generated method stub

	}

	@Override
	public void insertReply(ClassReply classReply) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateReply(ClassReply classReply) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteReply(Long replyId) {
		// TODO Auto-generated method stub

	}

	

}
