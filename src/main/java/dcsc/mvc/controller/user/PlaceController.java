package dcsc.mvc.controller.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonIgnore;

import dcsc.mvc.domain.classes.Book;
import dcsc.mvc.domain.classes.BookDTO;
import dcsc.mvc.domain.user.Infra;
import dcsc.mvc.domain.user.Place;
import dcsc.mvc.domain.user.PlaceInfra;
import dcsc.mvc.domain.user.PlaceInfraDTO;
import dcsc.mvc.domain.user.PlaceRegion;
import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.service.user.TeacherService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("teacher/teacherMypage/place")
@RequiredArgsConstructor
public class PlaceController {
	
	public final TeacherService teacherService;
	
	
	/**
	 * 공방 등록 폼
	 * */
	@RequestMapping("/insertForm")
	public void insertForm() {}
	
	/**
	 * 공방 등록하기
	 * */
	@RequestMapping("/insert")
	public String insertPlace(Place place, PlaceRegion placeRegion,@RequestParam List<Long> infraId) {
		System.out.println("placeController - insertPlace 실행");
		place.setPlaceRegion(placeRegion);
		teacherService.insertPlace(place, infraId);
		
		return "redirect:/teacher/teacherMypage/place/placeDetail";
	}
	
	/**
	 * 공방 수정 폼
	 * */
	@RequestMapping("/updateForm")
	public ModelAndView updateForm(Long placeId) {
		placeId=24L;
		Place place = teacherService.selectByPlaceId(placeId);
		
		return new ModelAndView("teacher/teacherMypage/place/updateForm", "place", place);
	}
	
	/**
	 * 공방 수정하기
	 * */
	@RequestMapping("/update")
	public String updatePlace(Place place, PlaceRegion placeRegion, @RequestParam List<Long> infraId) {
		
		place.setPlaceRegion(placeRegion);
		teacherService.updatePlace(place, infraId);
		
		return "redirect:/teacher/teacherMypage/place/detail";
		//redirect:/ 는 오른쪽의 주소로 URL요청을 다시 하는 것. 즉 매핑 주소를 입력.(컨트롤러 재사용)
		//ModelAndView에 들어오는 view는 viewname 그대로 받음.
	}
	
	/**
	 * 공방 상세보기
	 * */
	@RequestMapping("/detail")
	public ModelAndView readPlace(Long placeId) {
		placeId=24L;
		
		Place place = teacherService.selectByPlaceId(placeId);
		return new ModelAndView("teacher/teacherMypage/place/placeDetail", "place", place);
	}
	
	/**
	 * 공방 인프라 리스트 가져오기
	 * */
	@RequestMapping("/selectPlaceInfra")
	@ResponseBody
	public List<Infra> selectPlaceInfra() {
		List<Infra> list = teacherService.selectPlaceInfra();
		
		return list;
	}
	
	/**
	 * 공방 지역 가져오기
	 * */
	@RequestMapping("/selectPlaceRegion")
	@ResponseBody
	public List<PlaceRegion> selectPlaceRegion() {
		List<PlaceRegion> list = teacherService.selectPlaceRegion();
		
		return list;
	}
	
	/**
	 * 공방 아이디로 공방 인프라 가져오기
	 * */
	@RequestMapping("/selectInfra")
	@ResponseBody
	public List<PlaceInfraDTO> selectInfraByPlaceId(Long placeId){
		List<PlaceInfra> list = teacherService.selectInfraByPlaceId(placeId);
		List<PlaceInfraDTO> dtolist = new ArrayList<PlaceInfraDTO>();
		
		for(PlaceInfra p : list) {
			PlaceInfraDTO placeInfraDTO = new PlaceInfraDTO(p.getPlaceInfraId(),p.getInfra().getInfraId(),
															p.getPlace().getPlaceId(), p.getInfra().getInfraName());
		dtolist.add(placeInfraDTO);
		}
		return dtolist;
	}
	
}
