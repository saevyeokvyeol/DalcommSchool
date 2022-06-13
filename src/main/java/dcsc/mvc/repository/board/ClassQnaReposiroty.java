package dcsc.mvc.repository.board;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.board.ClassQna;

public interface ClassQnaReposiroty extends JpaRepository<ClassQna, Long> {

	/**
	 * 클래스ID로 클래스 Q&A 검색
	 * */
	List<ClassQna> findByClassesClassIdEquals(Long classId);
	
	
	/**
	 * 강사ID로 클래스 Q&A 검색
	 * */
	List<ClassQna> findByClassesTeacherTeacherIdEquals(String teacherId);
	
	/**
	 * 자신이 쓴 클래스 Q&A 검색
	 * */
	List<ClassQna> findByStudentStudentIdEquals(String studentId);
	
	
	/**
	 * 클래스ID로 클래스 Q&A 검색 - 페이징처리
	 * */
	Page<ClassQna> findByClassesClassIdEquals(Long classId ,Pageable pageable);
	
	
	/**
	 * 강사ID로 클래스 Q&A 검색 - 페이징처리
	 * */
	Page<ClassQna> findByClassesTeacherTeacherIdEquals(String teacherId ,Pageable pageable);
	
	/**
	 * 자신이 쓴 클래스 Q&A 검색 - 페이징처리
	 * */
	Page<ClassQna> findByStudentStudentIdEquals(String studentId ,Pageable pageable);
}
