package dcsc.mvc.repository.board;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.board.ClassReview;

public interface ClassReviewReposiroty extends JpaRepository<ClassReview, Long> {

	/**
	 * 클래스 ID로 클래스 리뷰 검색
	 * */
	List<ClassReview> findByClassesClassIdEquals(Long classId);
	
	/**
	 * 강사 ID로 클래스 리뷰 검색
	 * */
	List<ClassReview> findByClassesTeacherTeacherIdEquals(String teacherId);
	
	/**
	 * 학생 ID로 클래스 리뷰 검색
	 * */
	List<ClassReview> findByStudentStudentIdEquals(String studentId);
	
	/**
	 * 클래스 아이디로 리뷰 검색 - 페이징 처리
	 * */
	Page<ClassReview> findByClassesClassIdEquals(Long classId, Pageable pageable);
	
	/**
	 * 강사 ID로 클래스 리뷰 검색 - 페이징 처리
	 * */
	Page<ClassReview> findByClassesTeacherTeacherIdEquals(String teacherId, Pageable pageable);
	
	/**
	 * 학생 ID로 클래스 리뷰 검색 - 페이징 처리
	 * */
	Page<ClassReview> findByStudentStudentIdEquals(String studentId, Pageable pageable);
	
}
