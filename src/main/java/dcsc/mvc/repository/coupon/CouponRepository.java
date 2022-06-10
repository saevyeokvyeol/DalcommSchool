package dcsc.mvc.repository.coupon;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import dcsc.mvc.domain.coupon.Coupon;

public interface CouponRepository extends JpaRepository<Coupon, Long>, QuerydslPredicateExecutor<Coupon>{
	
	/**
	 * 클래스 발급 쿠폰 조회 기능 ; 선생님
	 * @param classId (검색 기준)
	 * @return List<Coupon>
	 * */
	List<Coupon> findByClassesClassId(Long classId);
	
	/**
	 * 클래스 발급 쿠폰 조회 기능 ; 선생님 - 페이징처리
	 * @param classId (검색 기준)
	 * @return List<Coupon>
	 * */
	Page<Coupon> findByClassesClassId(Long classId, Pageable pagealbe);
	
	/**
	 * 전체 발급 쿠폰 조회 기능 ; 선생님
	 * @param teacherId (검색 기준)
	 * @return List<Coupon>
	 * */
	List<Coupon> findByTeacherTeacherId(String teacherId);
	
	/**
	 * 전체 발급 쿠폰 조회 기능 ; 선생님- 페이징처리
	 * @param teacherId (검색 기준)
	 * @return List<Coupon>
	 * */
	Page<Coupon> findByTeacherTeacherId(String teacherId, Pageable pagealbe);
	
	
}
