package dcsc.mvc.controller.classes;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import dcsc.mvc.domain.classes.ClassCategory;
import dcsc.mvc.domain.classes.ClassSchedule;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.classes.FullCalendar;
import dcsc.mvc.service.classes.ClassesService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class AjaxClassController {
	private final ClassesService classesService;
	
	/**
	 * 클래스 카테고리 가져오기
	 * */
	@RequestMapping("/teacher/class/selectAllCategory")
	public List<ClassCategory> selectAllCategory() {
		List<ClassCategory> list = classesService.selectAllCategory();
		return list;
	}
	
	/**
	 * 클래스 삭제
	 * */
	@RequestMapping("/teacher/class/delete")
	public void delete(Long classId) {
		classesService.delete(classId);
	}
	
	/**
	 * 클래스 공개 수락
	 * */
	@RequestMapping("/admin/class/updateStateOpen")
	public void updateStateOpen(Long classId) {
		classesService.updateStateOpen(classId);
	}
	
	/**
	 * 클래스 상태 변경
	 * */
	@RequestMapping("/teacher/class/updateState")
	public void updateState(Long classId, Long stateId) {
		classesService.updateState(classId, stateId);
	}
	
	/**
	 * 강사의 모든 클래스 일정 가져오기
	 * */
	@RequestMapping("/selectScheduleByTeacherId")
	public List<FullCalendar> selectScheduleByTeacherId(Long classId){
		List<ClassSchedule> schedules = classesService.selectScheduleByClassId(classId);
		List<FullCalendar> list = new ArrayList<FullCalendar>();
		for(ClassSchedule c : schedules) {
			c.getScheduleDate().setHours(Integer.parseInt(c.getStartTime().substring(0, 2)));
			c.getScheduleDate().setMinutes(Integer.parseInt(c.getStartTime().substring(3, 5)));
			Date start = c.getScheduleDate();
			System.out.println(start);
			System.out.println(start.toString());
			
			c.getScheduleDate().setHours(Integer.parseInt(c.getEndTime().substring(0, 2)));
			c.getScheduleDate().setMinutes(Integer.parseInt(c.getEndTime().substring(3, 5)));
			Date end = c.getScheduleDate();
			
			list.add(new FullCalendar(c.getScheduleId(), classId, c.getClasses().getClassName(), start.toString(), end.toString()));
		}
		return list;
	}
	
	/**
	 * 클래스 ID로 클래스 일정 가져오기
	 * */
	@RequestMapping("/selectScheduleByClassId")
	public List<FullCalendar> selectScheduleByClassId(Long classId){
		List<ClassSchedule> schedules = classesService.selectScheduleByClassId(classId);
		List<FullCalendar> list = new ArrayList<FullCalendar>();
		for(ClassSchedule c : schedules) {
			c.getScheduleDate().setHours(Integer.parseInt(c.getStartTime().substring(0, 2)));
			c.getScheduleDate().setMinutes(Integer.parseInt(c.getStartTime().substring(3, 5)));
			Date start = c.getScheduleDate();
			System.out.println(start);
			System.out.println(start.toString());
			
			c.getScheduleDate().setHours(Integer.parseInt(c.getEndTime().substring(0, 2)));
			c.getScheduleDate().setMinutes(Integer.parseInt(c.getEndTime().substring(3, 5)));
			Date end = c.getScheduleDate();
			
			list.add(new FullCalendar(c.getScheduleId(), classId, c.getLeftSeat() + "명", start.toString(), end.toString()));
		}
		return list;
	}
	
	/**
	 * 클래스 일정 등록
	 * */
	@RequestMapping("/teacher/class/insertSchedule")
	public void insertSchedule(Classes classes, ClassSchedule classSchedule) {		
		classSchedule.setClasses(classes);
		classesService.insertSchedule(classSchedule);	
	}
	
	/**
	 * 클래스 일정 수정
	 * */
	@RequestMapping("/teacher/class/updateSchedule")
	public void updateSchedule(ClassSchedule classSchedule) {
		System.out.println(classSchedule.getScheduleId());
		classesService.updateSchedule(classSchedule);	
	}
	
	
	/**
	 * 일정ID로 일정 가져오기
	 * */
	@RequestMapping("/selectScheduleByScheduleId")
	public ClassSchedule selectScheduleByScheduleId(Long scheduleId) {
		ClassSchedule schedule = classesService.selectScheduleByscheduleId(scheduleId);
		return schedule;
	}
	
	/**
	 * 클래스 찜 등록
	 * */
	
	/**
	 * 클래스 찜 삭제
	 * */
	
	/**
	 * 회원 아이디로 찜목록 조회
	 * */
}