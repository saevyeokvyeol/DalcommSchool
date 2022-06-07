package dcsc.mvc.repository.board;

import java.util.List;

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
	
}
