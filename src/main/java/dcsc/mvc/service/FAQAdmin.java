package dcsc.mvc.service;

import dcsc.mvc.domain.board.FAQ;

/**
 * FAQ(관리자)
 * */
public interface FAQAdmin {
	
	/**
	 * FAQ 등록 기능
	 * */
	void insertFAQ(FAQ faq)throws Exception;
	/**
	 * FAQ 수정 기능
	 * 	수정된 FAQ를 리턴해준다.
	 * */
	FAQ update(FAQ faq)throws Exception;
	
	/**
	 * FAQ 삭제 기능
	 * (글번호)시퀀스를 받고 FAQ를 삭제한다.
	 * */
	void delete(Long faqNo, FAQ faq)throws Exception;
}
