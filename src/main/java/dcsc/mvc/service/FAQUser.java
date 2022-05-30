package dcsc.mvc.service;

import java.util.List;

import dcsc.mvc.domain.board.FAQ;

/**
 * FAQ(강사&회원)
 * */
public interface FAQUser {
	
	/**
	 * FAQ 게시판 카테고리보기 기능
	 * 	faqCategory를 들고 들어와서 카테고리별로 출력한다
	 * */
	List<FAQ> faqCategoryList(String faqCategoty);
	
	/**
	 * FAQ 게시판 전체 조회 기능
	 * */
	List<FAQ> faqListAll();
	
	/**
	 * FAQ 게시판 검색 기능
	 * 1개 이상 나올수 있어서 List로 했다 제목또는 내용으로 검색하는 거여서 keyword로 받는다.
	 * */
	List<FAQ> selectFAQKeyword(String keyword);
	
}
