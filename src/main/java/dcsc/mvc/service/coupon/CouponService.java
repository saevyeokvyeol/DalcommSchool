package dcsc.mvc.service.coupon;

import java.util.List;

import dcsc.mvc.domain.coupon.Coupon;
import dcsc.mvc.domain.coupon.IssueCoupon;

public interface CouponService {
	/**
	 * 자신이 보유한(발급 받은) 쿠폰 조회 기능; 학생
	 * @param studentId (검색 기준)
	 * @return List<IssueCoupon>
	 * */
	List<IssueCoupon> selectByStudentId(String studentId);
	
	/**
	 * 클래스 발급 쿠폰 조회 기능 ; 선생님
	 * @param classId (검색 기준)
	 * @return List<Coupon>
	 * */
	List<Coupon> selectByClassId(String classId);
	
	
	/**
	 * 전체 발급 쿠폰 조회 기능 ; 선생님
	 * @param teacherId (검색 기준)
	 * @return List<Coupon>
	 * */
	List<Coupon> selectByTeacherId(String teacherId);
	
	
	/**
	 * 클래스 쿠폰 등록 기능 ; 선생님
	 * @param Coupon(classId, couponName, couponDc, couponEndDate)
	 * @return void
	 * */
	void insertCoupon(Coupon coupon);
	
	
	/**
	 * 클래스 쿠폰 수정 기능 ; 선생님
	 * @param Coupon(couponId, couponName, couponDc, couponEndDate)
	 * @return void
	 * */
	void updateCoupon(Coupon coupon);
	
	/**
	 * 클래스 쿠폰 삭제 기능 ; 선생님
	 * @param String couponId
	 * @return void
	 * */
	void deleteCoupon(String couponId);
	
	/**
	 * 클래스 쿠폰 상태 변경 기능 ; 선생님
	 * @param Coupon coupon(couponId,couponStateId)
	 * @return void
	 * */
	void updateCouponState(Coupon coupon);
	
	
	/**
	 * 등록한 전체 쿠폰(클래스 쿠폰 + 이벤트 쿠폰)조회 기능 ; 관리자
	 * @param 
	 * @return List<Coupon>
	 * */
	List<Coupon> selectAll();
	
	
	/**
	 * 학생이 보유한 쿠폰 조회 기능 ; 관리자
	 * @param studentId(검색기준)
	 * @return List<IssueCoupon>
	 * */
	List<IssueCoupon> selectByStudent(String studentId);
	
	/**
	 * 이벤트 쿠폰 등록 기능 ; 관리자
	 * @param Coupon(couponName, couponDc, couponEndDate)
	 * @return void
	 * */
	void insertEventCoupon(Coupon coupon);
	
	/**
	 * 이벤트 쿠폰 수정 기능 ; 관리자
	 * @param Coupon(couponId, couponName, couponDc, couponEndDate)
	 * @return void
	 * */	
	void updateEventCoupon(Coupon coupon);
	
	
	/**
	 * 이벤트 쿠폰 삭제 기능 ; 관리자
	 * @param couponId
	 * @return void
	 * */
	void deleteEventCoupon(String couponId);

}
