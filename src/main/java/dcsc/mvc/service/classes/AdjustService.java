package dcsc.mvc.service.classes;

import java.util.List;

import dcsc.mvc.domain.classes.Adjust;
import dcsc.mvc.domain.classes.AdjustState;

public interface AdjustService {
	/**
	 * 정산 가능 금액 조회 기능
	 * @param String teacherId(검색기준)
	 * @return int (정산금액)
	 * */
	int selectAdjust(String teacherId);
	
	
	/**
	 * 정산 신청 기능
	 * @param Adjust(강사아이디,정산금액,은행명,예금주,계좌번호)
	 * @return int(신청된 데이터 수)
	 * 정산 가능 금액 변경 : 총 수익에서 정산 신청 금액 차감 (update)
	 * */
	void insertAdjust(Adjust adjust);
	
	
	/**
	 * 요청된 정산 처리 기능
	 * 
	 * 정산 상태 '진행중'으로 변경 (update)
	 * 
	 * state로 정산 상태 관리(정산테이블의 정산일,정산상태Id변경)
	 * 
	 * @param int adjustStateId(정렬기준) //String state??? //Long adjustNo
	 * @return int(수정된 데이터 수)
	 * */
	void updateAdjust(Adjust adjust, AdjustState adjustState);
	

	/**
	 * 정산 내역 조회 기능
	 * @param String teacherId(검색기준)
	 * @return List<Adjust>
	 * */
	List<Adjust> selectByTeacherId(String teacherId);
	
	
	/**
	 * 정산 내역 전체 조회 - 관리자
	 * @return List<Adjust>
	 * */
	List<Adjust> selectAll();
	
	
}
 