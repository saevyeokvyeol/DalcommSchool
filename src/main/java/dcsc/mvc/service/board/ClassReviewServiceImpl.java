package dcsc.mvc.service.board;

import java.util.List;
import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dcsc.mvc.domain.board.ClassReview;
import dcsc.mvc.domain.board.ClassReviewDTO;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.repository.board.ClassReviewReposiroty;
import dcsc.mvc.repository.classes.ClassesRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ClassReviewServiceImpl implements ClassReviewService {

	private final ClassReviewReposiroty reviewRep;
	private final ClassesRepository classRep;
	
	@Override
	public void insert(ClassReview classReview) {
		reviewRep.save(classReview);
	}

	@Override
	public ClassReview update(ClassReview review) {
		ClassReview newReview = reviewRep.findById(review.getReviewId()).orElse(null);
		if(newReview==null) {
			throw new RuntimeException("리뷰 아이디 오류로 수정할 수 없습니다.");
		}
		newReview.setReviewContent(review.getReviewContent());
		newReview.setReviewImg(review.getReviewImg());
		newReview.setReviewRate(review.getReviewRate());
		
		return newReview;
	}
	
//	@Override
//	public void updateAjax(Long reviewId, int reviewRate, String reviewContent, String file) {
//		ClassReview newReview = reviewRep.findById(reviewId).orElse(null);
//		if(newReview==null) {
//			throw new RuntimeException("리뷰 아이디 오류로 수정할 수 없습니다.");
//		}
		
//	}

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
	 * 클래스 ID로 후기 검색 - 페이징 처리
	 * */
	@Override
	public Page<ClassReview> selectByClassId(Long classId, Pageable pageable) {
		
//		List<ClassReview> list = reviewRep.findByClassesClassIdEquals(classId);

		return reviewRep.findByClassesClassIdEquals(classId, pageable);
	}
	
	/**
	 * 강사 ID로 후기 검색 - 페이징 처리
	 * */
	@Override
	public Page<ClassReview> selectByTeacherId(String teacherId, Pageable pageable) {
		
		return reviewRep.findByClassesTeacherTeacherIdEquals(teacherId, pageable);
	}
	/**
	 * 학생 ID로 후기 검색 - 페이징 처리
	 * */
	@Override
	public Page<ClassReview> selectByStudentId(String studentId, Pageable pageable) {
		
		return reviewRep.findByStudentStudentIdEquals(studentId, pageable);
	}
	
	/**
	 * 후기 전체 검색 - 페이징 처리
	 * */
	@Override
	public Page<ClassReview> selectAll(Pageable pageable) {
		
		return reviewRep.findAll(pageable);
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
	
	/**
	 * 학생 아이디로 수강한 클래스 가져오기
	 * */
	@Override
	public List<Classes> selectStudentClassList(String studentId) {
//		List<Classes> list = classRep.findByStudentStudentIdEquals(studentId);
		return null;
	}

}
