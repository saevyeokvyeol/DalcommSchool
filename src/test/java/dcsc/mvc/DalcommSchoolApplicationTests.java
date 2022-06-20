package dcsc.mvc;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import dcsc.mvc.domain.classes.ClassSchedule;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.user.PlaceRegion;
import dcsc.mvc.repository.classes.ClassScheduleRepository;
import dcsc.mvc.repository.classes.ClassesRepository;
import dcsc.mvc.repository.user.PlaceRegionRepository;

@SpringBootTest
@Transactional
@Commit
class DalcommSchoolApplicationTests {
	
	@Autowired
	private ClassScheduleRepository classScheduleRepository;
	@Autowired
	private PlaceRegionRepository placeRegionRepository;

	@Test
	void contextLoads() {
		for(int i = 1; i <= 5; i++) {
			Date date1 = Date.valueOf(LocalDate.now().minusDays(i * 2));
			Date date2 = Date.valueOf(LocalDate.now().plusDays(i * 2));
			
			classScheduleRepository.save(new ClassSchedule(null, date1, "11:00 AM", "13:00 PM", null, null, 5, 5, new Classes(25L), null));
			classScheduleRepository.save(new ClassSchedule(null, date2, "11:00 AM", "13:00 PM", null, null, 5, 5, new Classes(25L), null));
			classScheduleRepository.save(new ClassSchedule(null, date1, "11:00 AM", "13:00 PM", null, null, 5, 5, new Classes(24L), null));
			classScheduleRepository.save(new ClassSchedule(null, date2, "11:00 AM", "13:00 PM", null, null, 5, 5, new Classes(24L), null));
			classScheduleRepository.save(new ClassSchedule(null, date1, "11:00 AM", "13:00 PM", null, null, 5, 5, new Classes(23L), null));
			classScheduleRepository.save(new ClassSchedule(null, date2, "11:00 AM", "13:00 PM", null, null, 5, 5, new Classes(23L), null));
			classScheduleRepository.save(new ClassSchedule(null, date1, "11:00 AM", "13:00 PM", null, null, 5, 5, new Classes(22L), null));
			classScheduleRepository.save(new ClassSchedule(null, date2, "11:00 AM", "13:00 PM", null, null, 5, 5, new Classes(22L), null));
			classScheduleRepository.save(new ClassSchedule(null, date1, "11:00 AM", "13:00 PM", null, null, 5, 5, new Classes(21L), null));
			classScheduleRepository.save(new ClassSchedule(null, date2, "11:00 AM", "13:00 PM", null, null, 5, 5, new Classes(21L), null));
		}
	}

}
