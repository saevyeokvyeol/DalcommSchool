package dcsc.mvc.service.user;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
			return null;
		}else if(teacherId != null) {
			return teacherId;
		}else {
			System.out.println("학생 아이디는 " + studentId + "입니다");
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
			return false;
		}else{
			return true;
		}
	}

	@Override
	public void updateTeacher(Teacher teacher) {
		Teacher newTeacher = teacherRep.findById(teacher.getTeacherId()).orElse(null);
		
		if(newTeacher==null) {
			throw new RuntimeException("선생님 아이디 오류로 수정할 수 없습니다.");
		}
		
		newTeacher.setTeacherPhone(teacher.getTeacherPhone());
		newTeacher.setTeacherEmail(teacher.getTeacherEmail());
		newTeacher.setTeacherNickname(teacher.getTeacherNickname());
		newTeacher.setTeacherTel(teacher.getTeacherTel());
	}
	
	@Override
	public void updateUserPwd(String userId, String newUserPwd) {
		System.out.println("teacherService, updateUserPwd 호출");
		
		Teacher teacher = teacherRep.findById(userId).orElse(null);
		Student student = studentRep.findById(userId).orElse(null);
		
		if(teacher!=null) {
			teacher.setTeacherPwd(newUserPwd);
			System.out.println("강사 비밀번호 수정 완료");
		}else {
			student.setStudentPwd(newUserPwd);
			System.out.println("학생 비밀번호 수정 완료");
		}
		
	}

	@Override
	public void updateLoginUserPwd(String userPwd, String encodePassword) {
		System.out.println("teacherService, updateUserPwd 호출");
		System.out.println("userPwd : " + userPwd + "encodePassword : " + encodePassword );

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		boolean result = principal.toString().contains("Student");
		
		if(!result) { //강사일 때
			Teacher teacher = (Teacher)principal;
			//입력한 기존 비밀번호랑 DB의 비밀번호를 비교한다.
			if(!getBCryptPasswordEncoder.matches(userPwd, teacher.getTeacherPwd())) {
				throw new BadCredentialsException("패스워드 오류입니다.");
			}else {
				(teacherRep.findById(teacher.getTeacherId()).orElse(null)).setTeacherPwd(encodePassword);
				System.out.println("강사 비밀번호 바꾸기 성공");
			}
		}else if(result) { //학생일 때
			Student student = (Student)principal;
			if(!getBCryptPasswordEncoder.matches(userPwd, student.getStudentPwd())) {
				throw new BadCredentialsException("패스워드 오류입니다.");
			}else {
				(studentRep.findById(student.getStudentId()).orElse(null)).setStudentPwd(encodePassword);
				System.out.println("학생 비밀번호 바꾸기 성공");
			}
		}
		
	}

	/**
	 * 강사 한명 가져오기
	 * */
	@Override
	public Teacher selectById(String teacherId) {
		Teacher teacher = teacherRep.findById(teacherId).orElse(null);
		if(teacher == null) new RuntimeException("강사 불러오기에 실패했습니다.");
		return teacher;
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
		List<Teacher> list = teacherRep.findAll();
		
		if(list==null) {
			throw new RuntimeException("조회가능한 회원 데이터가 없습니다.");
		}
		return list;
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
		
		place2.setPlaceInfra(place.getPlaceInfra());
		
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
		Place place = placeRep.findById(placeId).orElse(null);
		if(place == null) new RuntimeException("상세보기에 오류가 생겼습니다.");
		return place;
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
