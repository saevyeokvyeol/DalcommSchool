package dcsc.mvc.service.classes;

import java.util.List;

import dcsc.mvc.domain.classes.Like;

public interface LikeService {
	/**
	 * 클래스 찜 등록
	 * @param Like(클래스ID, 학생ID);
	 * */
	void insert(Like like);
	
	/**
	 * 클래스 찜 삭제
	 * @param Long likeId;
	 * */
	void delete(Long likeId);
	
	/**
	 * 회원ID로 클래스 찜 목록 조회
	 * @param String studentId;
	 * @return List<Like>;
	 * */
	List<Like> selectByStudentId(String studentId);
	
}
