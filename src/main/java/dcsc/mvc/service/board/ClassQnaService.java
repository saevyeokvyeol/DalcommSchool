package dcsc.mvc.service.board;

import java.util.List;

import dcsc.mvc.domain.board.ClassQna;
import dcsc.mvc.domain.board.ClassReply;

public interface ClassQnaService {
	/**
	 * 클래스 Q&A 등록
	 * @param ClassQna(클래스ID, 학생ID, 제목, 내용, 비밀글 여부)
	 * */
	void insertQuestion(ClassQna classQna);

	/**
	 * 클래스 Q&A 수정
	 * @param ClassQna(클래스ID, 학생ID, 제목, 내용, 비밀글 여부)
	 * */
	void updateQuestion(ClassQna classQna);

	/**
	 * 클래스 Q&A 삭제
	 * @param Long classId
	 * */
	void deleteQuestion(Long qnaId);

	/**
	 * 클래스ID로 클래스 Q&A 검색
	 * @param Long classId
	 * @return List<ClassQna>
	 * */
	List<ClassQna> selectByClassId(Long classId);

	/**
	 * 강사ID로 클래스 Q&A 검색
	 * @param String teacherId
	 * @return List<ClassQna>
	 * */
	List<ClassQna> selectByTeacherId(String teacherId);

	/**
	 * 클래스 QnA 상세 보기
	 * @param Long qnaId
	 * @return ClassQna
	 * */
	ClassQna selectByQnaId(Long qnaId);

	/**
	 * 클래스 Q&A 블라인드
	 * @param Long qnaId
	 * */
	void updateBlind(Long qnaId);
	
	/**
	 * 클래스 Q&A 답글 등록
	 * @param ClassReply(질문ID, 내용, 선생님ID)
	 * */
	void insertReply(ClassReply classReply);

	/**
	 * 클래스 Q&A 답글 수정
	 * @param ClassReply(답글ID, 내용, 선생님ID)
	 * */
	void updateReply(ClassReply classReply);

	/**
	 * 클래스 Q&A 답글 삭제
	 * @param Long replyId
	 * */
	void deleteReply(Long replyId);
}