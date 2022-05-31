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

	@Override
	public void insertQuestion(ClassQna classQna) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateQuestion(ClassQna classQna) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteQuestion(Long qnaId) {
		// TODO Auto-generated method stub

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
