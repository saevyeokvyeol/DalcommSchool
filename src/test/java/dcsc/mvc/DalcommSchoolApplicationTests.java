package dcsc.mvc;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import dcsc.mvc.domain.classes.Classes;


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
