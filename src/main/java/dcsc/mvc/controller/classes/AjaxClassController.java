package dcsc.mvc.controller.classes;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import dcsc.mvc.domain.classes.Book;
import dcsc.mvc.domain.classes.ClassCategory;
import dcsc.mvc.domain.classes.ClassSchedule;
import dcsc.mvc.domain.classes.ClassStatistics;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.classes.FullCalendar;
import dcsc.mvc.domain.user.Place;
import dcsc.mvc.domain.user.PlaceRegion;
import dcsc.mvc.service.classes.ClassesService;
import dcsc.mvc.service.user.TeacherService;
import lombok.RequiredArgsConstructor;
import nonapi.io.github.classgraph.fileslice.reader.RandomAccessArrayReader;

@RestController
@RequiredArgsConstructor
public class AjaxClassController {
	private final ClassesService classesService;
	private final TeacherService teacherService;
	
	private final int SIZE = 9;
	private final int BLOCK_COUNT = 5;
	
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
	 * 강사ID로 클래스 검색
	 * */
	@RequestMapping("/teacher/selectByTeacherId")
	public List<Classes> selectByTeacherId(){
		String teacherId = "Tkim1234";
		
		List<Classes> list = classesService.selectByTeacherId(teacherId);
		
		return list;
	}
	
	/**
	 * 강사의 모든 클래스 일정 가져오기
	 * */
	@RequestMapping("/selectScheduleByTeacherId")
	public List<FullCalendar> selectScheduleByTeacherId(){
		String teacherId = "Tkim1234";
		List<ClassSchedule> schedules = classesService.selectScheduleByTeacherId(teacherId);
		List<FullCalendar> list = new ArrayList<FullCalendar>();
		for(ClassSchedule c : schedules) {
			c.getScheduleDate().setHours(Integer.parseInt(c.getStartTime().substring(0, 2)));
			c.getScheduleDate().setMinutes(Integer.parseInt(c.getStartTime().substring(3, 5)));
			Date start = c.getScheduleDate();
			
			list.add(new FullCalendar(c.getScheduleId(), c.getClasses().getClassId(), c.getClasses().getClassName(), start.toString()));
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
			
			list.add(new FullCalendar(c.getScheduleId(), classId, c.getTotalSeat() + "명", start.toString()));
		}
		return list;
	}
	
	/**
	 * 이용 가능한 클래스 일정 가져오기
	 * */
	@RequestMapping("/selectAvailableSchedule")
	public List<FullCalendar> selectAvailableSchedule(Long bookId){
		System.out.println(bookId);
		List<ClassSchedule> schedules = classesService.selectAvailableSchedule(bookId);
		List<FullCalendar> list = new ArrayList<FullCalendar>();
		for(ClassSchedule c : schedules) {
			c.getScheduleDate().setHours(Integer.parseInt(c.getStartTime().substring(0, 2)));
			c.getScheduleDate().setMinutes(Integer.parseInt(c.getStartTime().substring(3, 5)));
			Date start = c.getScheduleDate();
			
			list.add(new FullCalendar(c.getScheduleId(), c.getClasses().getClassId(), c.getTotalSeat() + "명", start.toString()));
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
		classesService.updateSchedule(classSchedule);	
	}
	
	/**
	 * 클래스 일정 삭제
	 * */
	@RequestMapping("/teacher/class/deleteSchedule")
	public void deleteSchedule(Long scheduleId) {
		classesService.deleteSchedule(scheduleId);	
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
	 * 강사 클래스 통계
	 * */
	@RequestMapping("/teacher/classStatistics")
	@ResponseBody
	public List<ClassStatistics> classStatistics(){
		List<Classes> classList = classesService.selectByTeacherId("Tkim1234");
		List<ClassStatistics> list = new ArrayList<ClassStatistics>();
		
		for (Classes c : classList) {
			ClassStatistics cs = new ClassStatistics();
			cs.setName(c.getClassName());
			cs.setBookCount(0);
			cs.setClassTotalProfit(0);
			
			if(c.getBooks() != null) {
				cs.setBookCount(c.getBooks().size());
				
				int profit = 0;
				
				for(Book b : c.getBooks()) {
					profit += b.getTotalPrice();
				}
				cs.setClassTotalProfit(profit);
			}
			
			list.add(cs);
		}
		
		return list;
	}
	
	/**
	 * 카테고리별 매출 통계
	 * */
	@RequestMapping("/teacher/categoryStatistics")
	@ResponseBody
	public List<ClassStatistics> categoryStatistics(){
		
		List<ClassCategory> categories = classesService.selectAllCategory();
		List<ClassStatistics> list = new ArrayList<ClassStatistics>();
		
		for (ClassCategory c : categories) {
			ClassStatistics cs = new ClassStatistics();
			cs.setName(c.getCategoryName());
			int totalProfit = 0;
			
			if(c.getClasses() != null) {
				for(Classes classes : c.getClasses()) {
					if(classes.getBooks() != null) {
						for(Book b : classes.getBooks()) {
							totalProfit += b.getTotalPrice();
						}
					}
				}
			}
			cs.setClassTotalProfit(totalProfit);
			
			list.add(cs);
		}
		
		return list;
	}
	
	/**
	 * 지역별 매출 통계
	 * */
	@RequestMapping("/teacher/regionStatistics")
	@ResponseBody
	public List<ClassStatistics> regionStatistics(){
		
		List<PlaceRegion> regions = teacherService.selectPlaceRegion();
		List<ClassStatistics> list = new ArrayList<ClassStatistics>();
		
		for (PlaceRegion r : regions) {
			ClassStatistics cs = new ClassStatistics();
			cs.setName(r.getRegionName());
			
			int totalProfit = 0;
			
			if(r.getPlace() != null) {
				for(Place p : r.getPlace()) {
					totalProfit += p.getTeacher().getTotalProfit();
				}
			}
			cs.setClassTotalProfit(totalProfit);
			
			list.add(cs);
		}
		
		return list;
	}
}