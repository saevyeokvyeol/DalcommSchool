package dcsc.mvc.service.classes;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import dcsc.mvc.domain.classes.Likes;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.repository.classes.LikeRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class LikeServiceImpl implements LikeService {
	private final LikeRepository likeRepository;

	/**
	 * 클래스 찜 등록
	 * @param Like(클래스ID, 학생ID);
	 * */
	@Override
	public Likes insert(Likes like) {
		return likeRepository.save(like);
	}

	/**
	 * 클래스 찜 삭제
	 * @param Long likeId;
	 * */
	@Override
	public Likes deleteByLikeId(Long likeId) {
		Likes like = likeRepository.findById(likeId).orElse(null);
		likeRepository.delete(like);
		
		return like;
	}

	/**
	 * 클래스 찜 전체 삭제
	 * @param String studentId;
	 * */
	@Override
	public void deleteByStudentId(String studentId) {
		likeRepository.deleteByStudentId(studentId);

	}

	/**
	 * 회원ID로 클래스 찜 목록 조회
	 * @param String studentId;
	 * @return List<Like>;
	 * */
	@Override
	public List<Likes> selectByStudentId(String studentId) {
		List<Likes> list = likeRepository.findByStudentStudentIdEquals(studentId);
		
		return list;
	}

}
