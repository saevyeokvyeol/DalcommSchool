package dcsc.mvc.repository.classes;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.classes.ClassSchedule;

public interface ClassesScheduleRepository extends JpaRepository<ClassSchedule, Long> {

}
