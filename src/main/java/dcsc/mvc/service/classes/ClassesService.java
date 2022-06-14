package dcsc.mvc.service.classes;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import dcsc.mvc.domain.classes.ClassCategory;
import dcsc.mvc.domain.classes.ClassSchedule;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.classes.Search;

public interface ClassesService {
	/**
	 * 클래스 등록
	 * @param Classes(선생님ID, 클래스명, 클래스 소개글, 클래스 금액, 카테고리);
	 * */
	void insert(Classes classes);

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
	 * 클래스 공개 수락
	 * @param Long classId;
	 * */
	void updateStateOpen(Long classId);

	/**
	 * 클래스 상태 변경
	 * @param Long classId, Long stateId(변경할 stateId);
	 * */
	void updateState(Long classId, Long stateId);

	/**
	 * 클래스 전체 보기
	 * @param Pageable pageable
	 * @return List<Classes> 클래스 전체 목록 반환
	 * */
	Page<Classes> selectAll(Pageable pageable);

	/**
	 * 강사ID로 클래스 조회
	 * @param String teacherId
	 * @return List<Classes> 클래스 전체 목록 반환
	 * */
	List<Classes> selectByTeacherId(String teacherId);

	/**
	 * 강사ID로 클래스 조회
	 * @param String teacherId, Pageable pageable
	 * @return List<Classes> 클래스 전체 목록 반환
	 * */
	Page<Classes> selectByTeacherId(String teacherId, Pageable pageable);

	/**
	 * 클래스 검색 및 필터링
	 * @param Search search, Pageable pageable, Long flag
	 * @return List<Classes>
	 * */
	Page<Classes> selectByFilter(Search search, Pageable pageable, Long flag);

	/**
	 * 클래스 상세 보기
	 * @param Long ClassId
	 * @return Classes
	 * */
	Classes selectByClassId(Long ClassId);

	/**
	 * 신규 클래스 검색
	 * @param Pageable
	 * @return List<Classes>
	 * */
	Page<Classes> selectNewClass(Pageable pageable);

	/**
	 * 이틀 이내 체험 가능한 클래스 검색
	 * @param Pageable
	 * @return List<Classes>
	 * */
	Page<ClassSchedule> selectNearClass(Pageable pageable);
	
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
	 * 이용 가능한 클래스 일정 조회
	 * @return List<ClassSchedule>
	 * */
	List<ClassSchedule> selectAvailableSchedule(Long bookId);

	/**
	 * 일정 상세 보기
	 * @param Long ClassId
	 * @return ClassSchedule
	 * */
	ClassSchedule selectScheduleByscheduleId(Long scheduleId);
}