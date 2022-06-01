package dcsc.mvc;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import dcsc.mvc.domain.classes.Classes;
<<<<<<< HEAD

=======
>>>>>>> 9e38053b0ad4e1e8890eee9bfefb968de99cc8f5
import dcsc.mvc.repository.classes.ClassesRepository;

@SpringBootTest
class DalcommSchoolApplicationTests {
	
	@Autowired
	private ClassesRepository classesRepository;

	@Test
	void contextLoads() {
		List<Classes> list = classesRepository.findAll();
		System.out.println(list);
	}

}
