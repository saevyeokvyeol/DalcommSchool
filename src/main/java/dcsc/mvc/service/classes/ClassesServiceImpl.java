package dcsc.mvc.service.classes;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import dcsc.mvc.domain.classes.ClassCategory;
import dcsc.mvc.domain.classes.ClassImage;
import dcsc.mvc.domain.classes.ClassSchedule;
import dcsc.mvc.domain.classes.ClassState;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.classes.Search;
import dcsc.mvc.repository.classes.ClassCategoryRepository;
import dcsc.mvc.repository.classes.ClassImageRepository;
import dcsc.mvc.repository.classes.ClassScheduleRepository;
import dcsc.mvc.repository.classes.ClassesRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ClassesServiceImpl implements ClassesService {
	private final ClassesRepository classesRepository;
	private final ClassImageRepository classImageRepository;
	private final ClassScheduleRepository classScheduleRepository;
	private final ClassCategoryRepository classCategoryRepository;

	/**
	 * 클래스 등록
	 * @param Class(선생님ID, 클래스명, 클래스 소개글, 클래스 금액, 카테고리);
	 * */
	@Override
	public void insert(Classes classes, ClassImage mainImage, ClassImage[] subImages) {
		classes.setClassState(new ClassState(1L, null));
		Classes dbClass = classesRepository.save(classes);
		System.out.println(dbClass.getClassId());
		
		mainImage.setClasses(dbClass);
		classImageRepository.save(mainImage);
		
		for(ClassImage subImage : subImages) {
			if(subImage != null) {
				subImage.setClasses(classes);
				classImageRepository.save(subImage);
			}
		}
	}

	/**
	 * 클래스 수정
	 * @param Class(클래스ID, 클래스명, 클래스 소개글, 클래스 금액, 카테고리);
	 * */
	@Override
	public void update(Classes classes) {
		Classes dbClass = classesRepository.findById(classes.getClassId()).orElse(null);
		
		if(dbClass == null) throw new RuntimeException("[" + classes.getClassName() + "] 클래스가 존재하지 않습니다");
		
		dbClass.setClassName(classes.getClassName());
		dbClass.setClassInfo(classes.getClassInfo());
		dbClass.setClassPrice(classes.getClassPrice());
		dbClass.getClassCategory().setCategoryId(classes.getClassCategory().getCategoryId());
	}

	/**
	 * 클래스 삭제
	 * @param Long classId;
	 * */
	@Override
	public void delete(Long classId) {
		Classes dbClass = classesRepository.findById(classId).orElse(null);
		
		if(dbClass == null) throw new RuntimeException("[" + classId + "] 클래스가 존재하지 않습니다");
		
		dbClass.setClassState(new ClassState(5L, null));

	}

	/**
	 * 클래스 전체 보기
	 * @return List<Classes> 클래스 전체 목록 반환
	 * */
	@Override
	public List<Classes> selectAll() {
		List<Classes> list = classesRepository.findAll();
		return list;
	}

	/**
	 * 클래스 검색 및 필터링
	 * @param Search(공방 지역, 카테고리, 검색 키워드, 새로운 클래스 여부, 이틀 이내 체험 가능 여부, 정렬 기준)
	 *        boolean timeOut(내일까지 체험 가능한 클래스)
	 * @return List<Classes>
	 * */
	@Override
	public List<Classes> selectByFilter(Search search) {
//		BooleanBuilder booleanBuilder = new BooleanBuilder();
//		
//		QClasses classes = QClasses.classes;
//		
//		if(search.getRegion() != null) booleanBuilder.and(classes.teacher.place.placeRegion.regionId.eq(search.getRegion()));
//		if(search.getCategory() != null) booleanBuilder.and(classes.classCategory.categoryId.eq(search.getCategory()));
//		
//		LocalDate from = LocalDate.now();
//		LocalDate to 
////		if(search.getNewClass() == "T") booleanBuilder.and(classes.classSchedule.);
//
//		
		return null;
	}

	/**
	 * 클래스 상세 보기
	 * @param Long ClassId
	 * @return Classes
	 * */
	@Override
	public Classes selectByClassId(Long ClassId) {
		Classes classes = classesRepository.findById(ClassId).orElse(null);
		
		if(classes == null) throw new RuntimeException("해당 클래스가 존재하지 않습니다.");
		
		return classes;
	}
	
	/**
	 * 클래스 카테고리 조회
	 * @return List<ClassCategory>
	 * */
	@Override
	public List<ClassCategory> selectAllCategory() {
		List<ClassCategory> list = classCategoryRepository.findAll();
		return list;
	}

	/**
	 * 클래스 일정 등록
	 * @param ClassSchedule(클래스ID, 일정, 시작시간, 종료시간, 총인원수, 남은인원수);
	 * */
	@Override
	public void insertSchedule(ClassSchedule schedule) {
		ClassSchedule dbSchedule = classScheduleRepository.save(schedule);
		
		if(dbSchedule == null) throw new RuntimeException("클래스 등록을 실패했습니다.");
	}

	/**
	 * 클래스 일정 수정
	 * @param ClassSchedule(클래스ID, 일정, 시작시간, 종료시간, 총인원수, 남은인원수);
	 * */
	@Override
	public void updateSchedule(ClassSchedule schedule) {
		ClassSchedule dbSchedule = classScheduleRepository.findById(schedule.getScheduleId()).orElse(null);
		
		if(dbSchedule == null) throw new RuntimeException("해당 일정이 존재하지 않습니다");

		dbSchedule.setScheduleDate(schedule.getScheduleDate());
		
		if(schedule.getTotalSeat() - dbSchedule.getLeftSeat() == 0) {
			dbSchedule.setStartTime(schedule.getStartTime());
			dbSchedule.setEndTime(schedule.getEndTime());
		}
		
		int leftSeat = dbSchedule.getLeftSeat() - (dbSchedule.getTotalSeat() - schedule.getTotalSeat());
		if(leftSeat < 0) throw new RuntimeException("변경할 수강 가능 인원이 수강 신청자의 수보다 적어 변경할 수 없습니다.");
		else if(schedule.getTotalSeat() < schedule.getLeftSeat()) throw new RuntimeException("수강 가능 인원은 남은 수강 인원보다 작을 수 없습니다.");
		
		dbSchedule.setLeftSeat(schedule.getLeftSeat());
		dbSchedule.setTotalSeat(schedule.getTotalSeat());
	}

	/**
	 * 클래스 일정 삭제
	 * @param Long scheduleId;
	 * */
	@Override
	public void deleteSchedule(Long scheduleId) {
		ClassSchedule dbSchedule = classScheduleRepository.findById(scheduleId).orElse(null);
		if(dbSchedule.getTotalSeat() != dbSchedule.getLeftSeat()) {
			throw new RuntimeException("수강 신청자가 있을 경우 일정을 삭제할 수 없습니다.");
		}
		classScheduleRepository.deleteById(scheduleId);
	}
	
	/**
	 * 선생님 일정 조회
	 * @param String teacherId 선생님ID로 선생님의 전체 일정 조회
	 * @return List<Class> 선생님의 모든 일정 조회
	 * */
	@Override
	public List<ClassSchedule> selectScheduleByTeacherId(String teacherId) {
		List<ClassSchedule> list = classScheduleRepository.findByClassesTeacherTeacherIdEquals(teacherId);
		return list;
	}
	
	/**
	 * 클래스별 일정 조회
	 * @return List<ClassSchedule>
	 * */
	@Override
	public List<ClassSchedule> selectScheduleByClassId(Long classId) {
		List<ClassSchedule> list = classScheduleRepository.findByClassesClassIdEquals(classId);
		return list;
	}

	/**
	 * 일정 상세 보기
	 * @param Long ClassId
	 * @return ClassSchedule
	 * */
	@Override
	public ClassSchedule selectScheduleByscheduleId(Long scheduleId) {
		ClassSchedule schedule = classScheduleRepository.findById(scheduleId).orElse(null);
		
		if(schedule == null) throw new RuntimeException("해당 클래스가 존재하지 않습니다.");
		
		return schedule;
	}

}
