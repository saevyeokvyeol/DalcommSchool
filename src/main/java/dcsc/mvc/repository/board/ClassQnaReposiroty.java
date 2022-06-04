package dcsc.mvc.repository.board;

import java.util.List;

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
	
	
}
