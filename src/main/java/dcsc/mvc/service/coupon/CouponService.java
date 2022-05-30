package dcsc.mvc.service.coupon;

public interface CouponService {
	/**
	 * 자신이 보유한(발급 받은) 쿠폰 조회 기능; 학생
	 * @param studentId (정렬 기준)
	 * @return List<issueCoupon>
	 * */
	
	
	/**
	 * 클래스 발급 쿠폰 조회 기능 ; 선생님
	 * @param classId (정렬 기준)
	 * @return List<Coupon>
	 * */
	
	
	/**
	 * 클래스 쿠폰 등록 기능 ; 선생님
	 * @param Coupon(classId, couponName, couponDc, couponEndDate)
	 * @return int(등록된 데이터 수)
	 * */
	
	/**
	 * 클래스 쿠폰 수정 기능 ; 선생님
	 * @param Coupon(classId, couponName, couponDc, couponEndDate)
	 * @return int(수정된 데이터 수)
	 * */
	
	
	/**
	 * 클래스 쿠폰 삭제 기능 ; 선생님
	 * @param couponId
	 * @return int(삭제된 데이터 수)
	 * */
	
	/**
	 * 등록한 전체 쿠폰(클래스 쿠폰 + 이벤트 쿠폰)조회 기능 ; 관리자
	 * @param couponId(정렬기준)
	 * @return List<Coupon>
	 * */
	
	/**
	 * 학생이 보유한 쿠폰 조회 기능 ; 관리자
	 * @param studentId(정렬기준)
	 * @return List<issueCoupon>
	 * */
	
	/**
	 * 이벤트 쿠폰 등록 기능 ; 관리자
	 * @param Coupon(classId, couponName, couponDc, couponEndDate)
	 * @return int(등록된 데이터 수)
	 * */
	
	/**
	 * 이벤트 쿠폰 수정 기능 ; 관리자
	 * @param Coupon(classId, couponName, couponDc, couponEndDate)
	 * @return int(수정된 데이터 수)
	 * */	
	
	/**
	 * 이벤트 쿠폰 삭제 기능 ; 관리자
	 * @param couponId
	 * @return int(삭제된 데이터 수)
	 * */

}
