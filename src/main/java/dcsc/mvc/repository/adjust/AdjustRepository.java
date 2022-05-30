package dcsc.mvc.repository.adjust;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.classes.Adjust;

public interface AdjustRepository extends JpaRepository<Adjust, Long> {
	/**
	 * 총 수익 조회 기능 ; 선생님
	 * List<ClassSchedule> 에서 수강생 수 , 가격으로 총 수익 구하기
	 * 
	 * @param List<ClassSchedule> 
	 * @return int 
	 * */
	
	
	/**
	 * 정산 가능 금액 조회 ; 선생님
	 * 
	 * @param int teacherId(정렬기준)
	 * @return int 
	 * */
	
	
	/**
	 * - 관리자에게 정산 신청 ; 선생님
	 * 1. 정산 테이블 insert
	 * 2. 정산 상태 '대기 신청'으로 변경 (update)
	 * 3. 정산 가능 금액 변경 : 총 수익에서 정산 신청 금액 차감 (update)
	 * 
	 * 1. 정산 테이블 insert
	 *  : 원천 징수 세금(3.3%), 카드사 수수료(2.53%), 플랫폼 수수료(7.5%)를 뺀 나머지가 최종 정산 금액
	 * @param Adjust(String teacherId, int adjustPrice, String bank, String depositor, String account)
	 * @return int(신청된 데이터 수)
	 * */
	
	
	/**
	 * 2. 정산 상태 '진행중'으로 변경 (update)
	 * @param Connection con, int adjustStateId
	 * @return int (수정된 데이터 수)
	 * */
	
	
	/**
	 * 3. 정산 가능 금액 변경 : 선생님 테이블의 총 수익에서 정산 신청 금액 차감 (update)
	 * @param Connection con, int adjustStateId
	 * @return int (수정된 데이터 수)
	 * */
	
	
	/**
	 * 정산 처리 ; 관리자
	 * : 정산 상태로 미정산 건 정렬 후, 정산 상태 변경 (update) 성공시 commit
	 * : 정산 반려시 roll back
	 * 
	 * @param int adjustStateId(정렬기준)
	 * @return int(수정된 데이터 수)
	 * */
	
	
	/**
	 * 정산 내역 리스트로 조회 ; 선생님
	 * @param String teacherId(정렬기준)
	 * @return List<AdjustDTO>
	 * */
	
	
	
	/**
	 * 정산 코드 클릭시 정산 내역 상세보기 ; 선생님
	 * @param int adjustNo(정렬기준)
	 * @return AdjustDTO
	 * */
	

}
