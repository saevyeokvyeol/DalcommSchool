package dcsc.mvc.service.board;

import java.util.List;

import dcsc.mvc.domain.board.ClassQna;
import dcsc.mvc.domain.board.ClassReview;

public interface ClassesReviewService {
	/**
	 * 클래스 후기 등록
	 * @param ClassReview(클래스ID, 학생ID, 내용, 이미지, 별점)
	 * */
	void insert(ClassReview classReview);

	/**
	 * 클래스 후기 수정
	 * @param ClassReview(후기ID, 학생ID, 내용, 이미지, 별점)
	 * */
	void update(ClassReview classReview);

	/**
	 * 클래스 후기 삭제
	 * @param Long reviewId
	 * */
	void delete(Long reviewId);

	/**
	 * 클래스ID로 클래스 후기 검색
	 * @param Long classId
	 * @return List<ClassReview>
	 * */
	List<ClassReview> selectByClassId(Long classId);

	/**
	 * 강사ID로 클래스 후기 검색
	 * @param String teacherId
	 * @return List<ClassReview>
	 * */
	List<ClassReview> selectByTeacherId(String teacherId);

	/**
	 * 클래스 후기 상세 보기
	 * @param Long reviewId
	 * @return ClassQna
	 * */
	ClassQna selectByReviewId(Long reviewId);

	/**
	 * 클래스 후기 블라인드
	 * @param Long reviewId
	 * */
	void updateBlind(Long reviewId);
}
