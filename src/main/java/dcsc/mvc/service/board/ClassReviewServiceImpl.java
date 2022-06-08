package dcsc.mvc.service.board;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import dcsc.mvc.domain.board.ClassReview;
import dcsc.mvc.repository.board.ClassReviewReposiroty;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ClassReviewServiceImpl implements ClassReviewService {

	private final ClassReviewReposiroty reviewRep;
	
	@Override
	public void insert(ClassReview classReview) {
		reviewRep.save(classReview);
	}

	@Override
	public ClassReview update(ClassReview classReview) {
		ClassReview newReview = reviewRep.findById(classReview.getReviewId()).orElse(null);
		if(newReview==null) {
			throw new RuntimeException("리뷰 아이디 오류로 수정할 수 없습니다.");
		}
		newReview.setReviewContent(classReview.getReviewContent());
		newReview.setReviewImg(classReview.getReviewImg());
		newReview.setReviewRate(classReview.getReviewRate());
		
		return newReview;
	}

	@Override
	public void delete(Long reviewId) {
		reviewRep.deleteById(reviewId);
	}

	/**
	 * 클래스 ID로 후기 검색
	 * */
	@Override
	public List<ClassReview> selectByClassId(Long classId) {
		List<ClassReview> list = reviewRep.findByClassesClassIdEquals(classId);
		return list;
	}

	/**
	 * 강사 ID로 후기 검색
	 * */
	@Override
	public List<ClassReview> selectByTeacherId(String teacherId) {
		List<ClassReview> list = reviewRep.findByClassesTeacherTeacherIdEquals(teacherId);
		return list;
	}

	/**
	 * 학생 ID로 후기 검색
	 * */
	@Override
	public List<ClassReview> selectByStudentId(String studentId) {
		List<ClassReview> list = reviewRep.findByStudentStudentIdEquals(studentId);
		return list;
	}

	/**
	 * 전체 후기 가져오기(리스트)
	 * */
	@Override
	public List<ClassReview> selectAll() {
		List<ClassReview> list = reviewRep.findAll();
		return list;
	}

	/**
	 * 후기 상세보기
	 * */
	@Override
	public ClassReview selectByReviewId(Long reviewId) {
		ClassReview review = reviewRep.findById(reviewId).orElse(null);
		return review;
	}

	/**
	 * 블라인드 처리
	 * */
	@Override
	public void updateBlind(Long reviewId, String reviewBlindState) {
		ClassReview review = reviewRep.findById(reviewId).orElse(null);
		if(review==null) {
			throw new RuntimeException("블라인드 처리에 실패하였습니다.");
		}
		review.setReviewBlindState(reviewBlindState);

	}

}
