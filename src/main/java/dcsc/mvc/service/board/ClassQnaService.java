package dcsc.mvc.service.board;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import dcsc.mvc.domain.board.ClassQna;
import dcsc.mvc.domain.board.ClassReply;

public interface ClassQnaService {
	
	/**
	 * 클래스 QnA 전체 보기
	 * */
	List<ClassQna> selectAllQna();
	
	/**
	 * 클래스 QnA 전체 보기 -Page처리
	 * */
	Page<ClassQna> selectAllQna(Pageable Pageable);
	
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
	void updateBlind(Long qnaId ,String blindState);
	
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
	
	/**
	 * 클래스 Q&A 답글 조회(문의글 id로 조회)
	 * @param Long qnaId
	 * */
	ClassReply selectByReplyQnaId(Long qnaId);
	
	/**
	 * 클래스 Q&A 댓글 상세조회(댓글 id 로 조회)
	 * */
	ClassReply selectByReplyId(Long replyId);
	
	/**
	 * 학생ID로 클래스 Q&A 검색
	 * @param String studentId
	 * @return List<ClassQna>
	 * */
	List<ClassQna> selectByStudentId(String studentId);
}
