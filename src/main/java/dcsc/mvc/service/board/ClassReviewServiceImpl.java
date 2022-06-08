package dcsc.mvc.service.board;

import java.util.List;

import org.springframework.stereotype.Service;

import dcsc.mvc.domain.board.ClassReview;

@Service
public class ClassReviewServiceImpl implements ClassReviewService {

	@Override
	public void insert(ClassReview classReview) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(ClassReview classReview) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Long reviewId) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ClassReview> selectByClassId(Long classId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ClassReview> selectByTeacherId(String teacherId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ClassReview> selectByStudentId(String studentId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ClassReview> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ClassReview selectByReviewId(Long reviewId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateBlind(Long reviewId) {
		// TODO Auto-generated method stub

	}

}
