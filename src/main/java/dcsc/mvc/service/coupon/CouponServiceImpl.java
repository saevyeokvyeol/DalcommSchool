package dcsc.mvc.service.coupon;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;

import dcsc.mvc.domain.coupon.Coupon;
import dcsc.mvc.domain.coupon.IssueCoupon;
import dcsc.mvc.domain.coupon.QCoupon;
import dcsc.mvc.repository.coupon.CouponRepository;
import dcsc.mvc.repository.coupon.IssueCouponRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class CouponServiceImpl implements CouponService {
	
	private final CouponRepository couponRep;
	private final IssueCouponRepository issueCouponRep;
	
	/**
	 * 자신이 보유한(발급 받은) 쿠폰 조회 기능; 학생
	 * @param studentId (검색 기준)
	 * @return List<IssueCoupon>
	 * */
	@Override
	public List<IssueCoupon> selectByStudentId(String studentId) {
		List<IssueCoupon> list = issueCouponRep.findByStudentStudentIdEquals(studentId);
		return list;
	}

	/**
	 * 클래스 발급 쿠폰 조회 기능 ; 선생님
	 * @param classId (검색 기준)
	 * @return List<Coupon>
	 * */
	@Override
	public List<Coupon> selectByClassId(Long classId) {
		List<Coupon> list = couponRep.findByClassesClassId(classId);
		return list;
	}

	/**
	 * 전체 발급 쿠폰 조회 기능 ; 선생님
	 * @param teacherId (검색 기준)
	 * @return List<Coupon>
	 * */
	@Override
	public List<Coupon> selectByTeacherId(String teacherId) {
		List<Coupon> list = couponRep.findByTeacherTeacherId(teacherId);
		return list;
	}

	/**
	 * 클래스 쿠폰 등록 기능
	 * 선생님ID와 클래스ID가 들어올 경우 해당 컬럼도 입력하고
	 * 들어오지 않을 경우 입력하지 않도록 동적 쿼리로 제작
	 * @param Coupon(teacherId, classId, couponName, couponDc, couponEndDate)
	 * @return void
	 * */
	@Override
	public void insertCoupon(Coupon coupon) {
		
		if(coupon.getTeacher().getTeacherId() !=null && coupon.getClasses().getClassId() !=null) {
			couponRep.save(coupon);
		}

	}

	/**
	 * 클래스 쿠폰 수정 기능
	 * @param Coupon(couponId, couponName, couponDc, couponEndDate)
	 * @return void
	 * */
	@Override
	public void updateCoupon(Coupon coupon) {
		// TODO Auto-generated method stub

	}

	/**
	 * 클래스 쿠폰 삭제 기능 ; 선생님
	 * @param String couponId
	 * @return void
	 * */
	@Override
	public void deleteCoupon(String couponId) {
		// TODO Auto-generated method stub

	}

	/**
	 * 클래스 쿠폰 상태 변경 기능 ; 선생님
	 * @param Coupon coupon(couponId,couponStateId)
	 * @return void
	 * */
	@Override
	public void updateCouponState(Coupon coupon) {
		// TODO Auto-generated method stub

	}

	/**
	 * 등록한 전체 쿠폰(클래스 쿠폰 + 이벤트 쿠폰)조회 기능 ; 관리자
	 * @param 
	 * @return List<Coupon>
	 * */
	@Override
	public List<Coupon> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 학생이 보유한 쿠폰 조회 기능 ; 관리자
	 * @param studentId(검색기준)
	 * @return List<IssueCoupon>
	 * */
	@Override
	public List<IssueCoupon> selectByStudent(String studentId) {
		// TODO Auto-generated method stub
		return null;
	}

}
