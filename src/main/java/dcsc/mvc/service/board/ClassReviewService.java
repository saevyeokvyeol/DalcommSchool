package dcsc.mvc.service.board;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import dcsc.mvc.domain.board.ClassReview;
import dcsc.mvc.domain.classes.Classes;

public interface ClassReviewService {
	/**
	 * 클래스 후기 등록
	 * @param ClassReview(클래스ID, 학생ID, 내용, 이미지, 별점)
	 * */
	void insert(ClassReview classReview);

	/**
	 * 클래스 후기 수정
	 * @param ClassReview(후기ID, 학생ID, 내용, 이미지, 별점)
	 * */
	ClassReview update(ClassReview classReview);

	/**
	 * 클래스 후기 수정(아작스)
	 * */
//	void updateAjax(Long reviewId, int reviewRate, String reviewContent, String file);
	
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
	 * 학생ID로 후기 검색
	 * */
	List<ClassReview> selectByStudentId(String studentId);	
	
	/**
	 * 클래스 후기 전체 가져오기
	 * */
	List<ClassReview> selectAll();
	
	/**
	 * 클래스ID로 클래스 후기 검색 - 페이징처리
	 * */
	Page<ClassReview> selectByClassId(Long classId, Pageable pageable);
	
	/**
	 * 강사ID로 클래스 후기 검색 - 페이징처리
	 * */
	Page<ClassReview> selectByTeacherId(String teacherId, Pageable pageable);
	
	/**
	 * 학생ID로 후기 검색 - 페이징처리
	 * */
	Page<ClassReview> selectByStudentId(String studentId, Pageable pageable);
	
	/**
	 * 클래스 후기 전체 가져오기 - 페이징처리
	 * */
	Page<ClassReview> selectAll(Pageable pageable);
	
	/**
	 * 클래스 후기 상세 보기
	 * @param Long reviewId
	 * @return ClassQna
	 * */
	ClassReview selectByReviewId(Long reviewId);

	/**
	 * 클래스 후기 블라인드
	 * @param Long reviewId
	 * */
	void updateBlind(Long reviewId, String reviewBlindState);
	
	/**
	 * 학생 아이디로 수강한 클래스 리스트 가져오기
	 * */
	List<Classes> selectStudentClassList(String studentId);
}
