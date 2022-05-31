package dcsc.mvc.service.classes;

import java.util.List;

import dcsc.mvc.domain.classes.Classes;

public interface ClassesService {
	/**
	 * 클래스 등록
	 * @param Class(선생님ID, 클래스명, 클래스 소개글, 클래스 금액, 카테고리);
	 * */
	void insert(Classes classes);

	/**
	 * 클래스 수정
	 * @param Class(클래스ID, 선생님ID, 클래스명, 클래스 소개글, 클래스 금액, 공개일자, 카테고리);
	 * */
	void update(Classes classes);

	/**
	 * 클래스 삭제
	 * @param Long classId;
	 * */
	void delete(Long classId);

	/**
	 * 클래스 전체 보기
	 * @return List<Class> 클래스 전체 목록 반환
	 * */
	List<Classes> selectAll();

	/**
	 * 클래스 검색 및 필터링
	 * @param Class(공방 지역, 카테고리), String keyword(검색 키워드), String sort(정렬),
	 *        boolean timeOut(내일까지 체험 가능한 클래스)
	 * @return List<Class>
	 * */
	List<Classes> selectByFilter(Classes classes, String keyword, String sort, String newClass, String timeOut);

	/**
	 * 클래스 상세 보기
	 * @param Long ClassId
	 * @return Class
	 * */
	Classes selectByClassId(Long ClassId);
}