package dcsc.mvc.service.user;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Service;

import dcsc.mvc.domain.user.Place;
import dcsc.mvc.domain.user.PlaceInfra;
import dcsc.mvc.domain.user.PlaceRegion;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.repository.user.PlaceInfraRepository;
import dcsc.mvc.repository.user.PlaceRegionRepository;
import dcsc.mvc.repository.user.PlaceRepository;
import dcsc.mvc.repository.user.StudentRepository;
import dcsc.mvc.repository.user.TeacherRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class TeacherServiceImpl implements TeacherService {
	
	private final TeacherRepository teacherRep;
	private final StudentRepository studentRep;
	private final PlaceRepository placeRep;
	private final PlaceRegionRepository regionRep;
	private final PlaceInfraRepository infraRep;
	
	private final BCryptPasswordEncoder getBCryptPasswordEncoder;
//	private final Student student;
//	private final Teacher teacher;
	
	@Override
	public void insertTeacher(Teacher teacher) {
		String rawPassword = teacher.getTeacherPwd();
		String encPassword = getBCryptPasswordEncoder.encode(rawPassword); 
		teacher.setTeacherPwd(encPassword);
		
		Teacher tea = teacherRep.save(teacher);
		if(tea==null) {
			new RuntimeException("회원가입에 실패했습니다.");
		}

	}
	
	/**
	 * 로그인
	 * */
	public Teacher login (String userId, String userPwd) {
		Teacher teacher = teacherRep.selectTeacherIdPwd(userId, userPwd);
		
		return teacher;
	}

	/**
	 * 아이디 찾기
	 * */
	@Override
	public String selectId(String userName, String userPhone) {
		String teacherId = teacherRep.selectTeacherId(userName, userPhone);
		String studentId = studentRep.selectStudentId(userName, userPhone);
		
		if(teacherId==null && studentId==null) {
			throw new RuntimeException("해당 정보에 일치하는 아이디가 없습니다.");
		}else if(teacherId != null) {
			return teacherId;
		}else {
			return studentId;
		}
		
	}
	
	/**
	 * 패스워드 찾기
	 * */
	@Override
	public boolean selectPwd(String userId, String userName, String userPhone) {
		String teacherPwd = teacherRep.selectTeacherPwd(userId, userName, userPhone);
		String studentPwd = studentRep.selectStudentPwd(userId, userName, userPhone);
		
		if(teacherPwd==null && studentPwd==null) {
			throw new RuntimeException("해당 정보에 일치하는 아이디가 없습니다.");
		}else{
			return true;
		}
	}

	@Override
	public void updateTeacher(Teacher teahcer) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateTeacherPwd(String teacherPwd) { //인수 하나 더 필요
//		if(!passwordEncoder.matches(password, vo.getPassword())){
//			throw new BadCredentialsException("패스워드 오류입니다."); 이런 방식으로~~
		//현재 비밀번호를 입력 받아 DB와 일치하면 새로운 비밀번호 입력하게 해준다.
		//(session에서 로그인된 사람의 정보를 가져와 그 사람의 패스워드 정보를 가져온다.)
		
		//가져온 패스워드를 입력한 비밀번호로 바꾼다.(암호화)

	}

	/**
	 * 아이디 중복체크
	 * */
	@Override
	public boolean userIdCheck(String userId) {
		Teacher teacher = teacherRep.findById(userId).orElse(null); //없으면 null
		Student student = studentRep.findById(userId).orElse(null);
		
		if(teacher == null && student == null) { //검색 결과 없다면
			return false;
		}else {
			return true;
		}
	}

	/**
	 * 선생님 닉네임 중복체크
	 * */
	@Override
	public boolean teacherNickCheck(String teacherNick) {
		Teacher teacher = teacherRep.findByTeacherNicknameEquals(teacherNick);
		
		if(teacher != null) {
			return true;
		}else {
			return false;
		}
		
	}

	/**
	 * 휴대폰 중복체크
	 * */
	@Override
	public boolean userPhoneCheck(String userPhone) {
		Teacher teacher = teacherRep.findByTeacherPhoneEquals(userPhone);
		Student student = studentRep.findByStudentPhoneEquals(userPhone);
		
		if(teacher == null && student == null) { 
			return false;
		}else {
			return true;
		}
	}

	@Override
	public List<Teacher> selectAllTeacher() {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 공방 등록하기
	 * */
	@Override
	public void insertPlace(Place place) {
		placeRep.save(place);
		infraRep.save(place.getPlaceInfra());
	}
	
	/**
	 * 공방 수정하기
	 * */
	@Override
	public Place updatePlace(Place place) {
		Place place2 = placeRep.findById(place.getPlaceId()).orElse(null);
		
		place2.setDetailAddr(place.getDetailAddr());
		place2.setPlaceName(place.getPlaceName());
		place2.setPlaceAddr(place.getPlaceAddr());
		place2.setPlaceRoute(place.getPlaceRoute());
		
		place2.setPlaceRegion(place.getPlaceRegion());
		
		return place2;
	}
	
	/**
	 * 공방 인프라 정보 가져오기
	 * */
	@Override
	public List<PlaceInfra> selectPlaceInfra(Long placeId) {
		
		return null;
	}
	
	/**
	 * 공방 상세 정보 가져오기
	 * */
	@Override
	public Place selectByPlaceId(Long placeId) {
		
		return null;
	}
	
	/**
	 * 공방 지역 가져오기
	 * */
	@Override
	public List<PlaceRegion> selectPlaceRegion() {
		List<PlaceRegion> list = regionRep.findAll();
		return list;
	}
	
	/**
	 * 강사 정보로 강사 검색하기
	 * */
	@Override
	public List<Teacher> selectByTeacherId(String keyfield, String keyword) {
		List<Teacher> list = null;
		switch(keyfield) {
				case "teacherID" :
					System.out.println("teacherID...");
					list = teacherRep.findByTeacherIdIsLike(keyword);
					break;
					
				case "teacherName" :
					System.out.println("teacherName...");
					list = teacherRep.findByTeacherNameIsLike(keyword);
					break;	
					
				case "teacherPhone" :
					System.out.println("teacherPhone...");
					list = teacherRep.findByTeacherIdIsLike(keyword);
					break;	
					
				case "teacherEmail" :
					System.out.println("teacherEmail...");
					list = teacherRep.findByTeacherIdIsLike(keyword);
					break;	
		}
		return list;
	}

	
	
	

}
