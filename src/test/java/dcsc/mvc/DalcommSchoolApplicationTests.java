package dcsc.mvc;

import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.user.PlaceRegion;
import dcsc.mvc.repository.classes.ClassesRepository;
import dcsc.mvc.repository.user.PlaceRegionRepository;

@SpringBootTest
@Transactional
class DalcommSchoolApplicationTests {
	
	@Autowired
	private ClassesRepository classesRepository;
	@Autowired
	private PlaceRegionRepository placeRegionRepository;

	@Test
	void contextLoads() {
		List<PlaceRegion> list = placeRegionRepository.findAll();
		System.out.println(list.size());
		for(PlaceRegion pr : list) {
			System.out.println(pr.getRegionName());
		}
	}

}
