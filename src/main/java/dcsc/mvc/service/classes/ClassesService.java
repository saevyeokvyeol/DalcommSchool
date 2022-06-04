package dcsc.mvc.service.classes;

import java.util.List;

import dcsc.mvc.domain.classes.ClassCategory;
import dcsc.mvc.domain.classes.ClassImage;
import dcsc.mvc.domain.classes.ClassSchedule;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.classes.Search;

public interface ClassesService {
	/**
	 * 클래스 등록
	 * @param Classes(선생님ID, 클래스명, 클래스 소개글, 클래스 금액, 카테고리);
	 * */
	void insert(Classes classes, ClassImage mainImage, ClassImage[] subImages);

	/**
	 * 클래스 수정
	 * @param Classes(클래스ID, 선생님ID, 클래스명, 클래스 소개글, 클래스 금액, 공개일자, 카테고리);
	 * */
	void update(Classes classes);

	/**
	 * 클래스 삭제
	 * @param Long classId;
	 * */
	void delete(Long classId);

	/**
	 * 클래스 전체 보기
	 * @return List<Classes> 클래스 전체 목록 반환
	 * */
	List<Classes> selectAll();

	/**
	 * 클래스 검색 및 필터링
	 * @param Class(공방 지역, 카테고리), String keyword(검색 키워드), String sort(정렬),
	 *        boolean timeOut(내일까지 체험 가능한 클래스)
	 * @return List<Classes>
	 * */
	List<Classes> selectByFilter(Search search);

	/**
	 * 클래스 상세 보기
	 * @param Long ClassId
	 * @return Classes
	 * */
	Classes selectByClassId(Long ClassId);
	
	/**
	 * 클래스 카테고리 조회
	 * @return List<ClassCategory>
	 * */
	List<ClassCategory> selectAllCategory();

	/**
	 * 클래스 일정 등록
	 * @param ClassSchedule(클래스ID, 일정, 시작시간, 종료시간, 총인원수, 남은인원수);
	 * */
	void insertSchedule(ClassSchedule schedule);

	/**
	 * 클래스 일정 수정
	 * @param ClassSchedule(클래스ID, 일정, 시작시간, 종료시간, 총인원수, 남은인원수);
	 * */
	void updateSchedule(ClassSchedule schedule);

	/**
	 * 클래스 일정 삭제
	 * @param Long scheduleId;
	 * */
	void deleteSchedule(Long scheduleId);

	/**
	 * 선생님 일정 조회
	 * @param String teacherId 선생님ID로 선생님의 전체 일정 조회
	 * @return List<ClassSchedule> 선생님의 모든 일정 조회
	 * */
	List<ClassSchedule> selectScheduleByTeacherId(String teacherId);

	/**
	 * 클래스별 일정 조회
	 * @return List<ClassSchedule>
	 * */
	List<ClassSchedule> selectScheduleByClassId(Long classId);

	/**
	 * 일정 상세 보기
	 * @param Long ClassId
	 * @return ClassSchedule
	 * */
	ClassSchedule selectScheduleByscheduleId(Long scheduleId);
}