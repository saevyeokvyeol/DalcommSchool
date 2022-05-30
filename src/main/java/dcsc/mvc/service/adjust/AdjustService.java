package dcsc.mvc.service.adjust;

public interface AdjustService {
	/**
	 * 정산 가능 금액 조회 기능
	 * @param int teacherId(정렬기준)
	 * @return int 
	 * */
	
	
	/**
	 * 정산 신청 기능
	 * @param Adjust(String teacherId, int adjustPrice, String bank, String depositor, String account)
	 * @return int(신청된 데이터 수)
	 * */
	
	
	/**
	 * 요청된 정산 처리 기능
	 * @param int adjustStateId(정렬기준)
	 * @return int(수정된 데이터 수)
	 * */
	
	
	/**
	 * 정산 내역 조회 기능
	 * @param String teacherId(정렬기준)
	 * @return List<AdjustDTO>
	 * */

}
 