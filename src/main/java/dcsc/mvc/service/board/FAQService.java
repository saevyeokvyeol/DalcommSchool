package dcsc.mvc.service.board;

import java.util.List;

import dcsc.mvc.domain.board.FAQ;

/**
 * FAQ(관리자)
 * */
public interface FAQService {
	
	/**
	 * FAQ 등록 기능
	 * @param FAQ( 제목, 카테고리, 내용, 이미지)
	 * */
	void insertFAQ(FAQ faq);
	/**
	 * FAQ 수정 기능
	 * @param FAQ( 제목, 카테고리, 내용, 이미지)
	 * */
	void updateFAQ(FAQ faq);
	
	/**
	 * FAQ 삭제 기능
	 * (글번호)시퀀스를 받고 FAQ를 삭제한다.
	 * @param Long faqNo
	 * */
	void deleteFAQ(Long faqNo);
	
	/**
	 * FAQ 게시판 카테고리보기 기능
	 * 	faqCategory를 들고 들어와서 카테고리별로 출력한다
	 * @param String faqCategory
	 * @return List<FAQ>
	 * */
	List<FAQ> faqCategoryList(String faqCategoty);
	
	/**
	 * FAQ 게시판 전체 조회 기능
	 * @return List<FAQ>
	 * */
	List<FAQ> faqListAll();
	
	/**
	 * FAQ 게시판 검색 기능
	 * 1개 이상 나올수 있어서 List로 했다 제목또는 내용으로 검색하는 거여서 keyword로 받는다.
	 * @param String keyword
	 * @return List<FAQ>
	 * */
	List<FAQ> selectFAQKeyword(String keyword);
}
