package dcsc.mvc.service.board;

import java.util.List;

import dcsc.mvc.domain.board.Faq;
import dcsc.mvc.domain.board.FaqCategory;

/**
 * FAQ(관리자)
 * */
public interface FaqService {
	
	/**
	 * FAQ 등록 기능
	 * @param FAQ( 제목, 카테고리, 내용, 이미지)
	 * */
	void insertFAQ(Faq faq);
	/**
	 * FAQ 수정 기능
	 * @param faqCategory 
	 * @param FAQ( 제목, 카테고리, 내용, 이미지)
	 * */
	Faq updateFAQ(Faq faq, FaqCategory faqCategory);
	
	/**
	 * FAQ 삭제 기능
	 * (글번호)시퀀스를 받고 FAQ를 삭제한다.
	 * @param Long faqNo
	 * */
	void deleteFAQ(Long faqNo);
	
	/**
	 * 리스트 
	 * */
	Faq selectByFaqNo(Long faq ,boolean state);
	
	/**
	 * FAQ 게시판 전체 조회 기능
	 * @return List<FAQ>
	 * */
	List<Faq> selectAllfqa();
	
	
	/**
	 * 카테고리 조회하기
	 * */
	List<FaqCategory> selectfaqCategory();
	
	/**
	 * FAQ 게시판 검색 기능
	 * 1개 이상 나올수 있어서 List로 했다 제목또는 내용으로 검색하는 거여서 keyword로 받는다.
	 * @param String keyword
	 * @return List<FAQ>
	 * */
	List<Faq> selectBykeyword(String keyword);
	
	/**
	 * 카테고리 별로 정렬
	 * */
	List<Faq> selectByfaqCategoryId(Long FaqCategoryId);
	
}
