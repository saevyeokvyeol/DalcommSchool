package dcsc.mvc.service.user;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.RequestParam;

import dcsc.mvc.domain.user.Infra;
import dcsc.mvc.domain.user.Place;
import dcsc.mvc.domain.user.PlaceInfra;
import dcsc.mvc.domain.user.PlaceRegion;
import dcsc.mvc.domain.user.Teacher;

public interface TeacherService {

	/**
	 * 회원가입
	 * @param: Teacher teacher
	 * @return:
	 * */
	void insertTeacher (Teacher teacher);
	
	/**
	 * 로그인
	 * */
	Teacher login (String userId, String userPwd);
	
	/**
	 * 아이디 찾기
	 * @param: String userName, String userPhone
	 * @return: String Id
	 * */
	String selectId (String userName, String userPhone);
	
	/**
	 * 비밀번호 찾기
	 * @param: String teacherId, String teacherName, String teacherPhone
	 * */
	boolean selectPwd(String userId, String userName, String userPhone);
	
	/**
	 * 회원정보 수정
	 * @param: Teacher teahcer
	 * @return:
	 * */
	void updateTeacher (Teacher teacher);
	
	/**
	 * 비밀번호 찾기 성공 후 수정
	 * */
	void updateUserPwd(String userId, String newUserPwd);
	
	/**
	 * 비밀번호 수정(로그인 상태에서)
	 * @param: String userPwd, String newUserPwd, HttpSession session
	 * @return:
	 * */
	void updateLoginUserPwd (String userPwd, String newUserPwd);
	
	
	/**
	 * 아이디 중복체크
	 * @param: String teacherId
	 * @return: boolean
	 * */
	boolean userIdCheck (String userId);
	
	/**
	 * 강사 닉네임 중복체크
	 * @param: String teacherNick
	 * @return: boolean
	 * */
	boolean teacherNickCheck (String teacherNick);
	
	/**
	 * 핸드폰 번호 중복체크
	 * @param: String teacherPhone
	 * @return: boolean
	 * */
	boolean userPhoneCheck (String userPhone);

	/**
	 * 강사 한명 조회
	 * */	
	Teacher selectById(String teacherId);
	
	/**
	 * 강사 조회
	 * @param
	 * @return List<Teacher>
	 * */
	List<Teacher> selectAllTeacher ();
	
	
	/**
	 * 공방 등록
	 * @param Place place //Place 안에 PlaceInfra 있음 (JPA) 트랜잭션으로 인프라까지 등록
	 * @return 
	 * */
	void insertPlace (Place place,@RequestParam List<Long> infraId);
	
	/**
	 * 공방 정보 수정
	 * @param Place place //Place 안에 PlaceInfra 있음 (JPA) 트랜잭션으로 인프라까지 수정
	 * @return
	 * */
	void updatePlace (Place place, @RequestParam List<Long> infraId);
	
	/**
	 * 공방 조회하기
	 * */
	Place selectByPlaceId(Long placeId);
	
	/**
	 * 공방 인프라 가져오기
	 * @return PlaceInfra
	 * */
	List<Infra> selectPlaceInfra();
	
	/**
	 * 공방 지역 가져오기
	 * */
	List<PlaceRegion> selectPlaceRegion();

	/**
	 * 공방 아이디로 공방 인프라 가져오기
	 * */
	List<PlaceInfra> selectInfraByPlaceId(Long placeId);
	
	/**
	 * 아이디, 이름 등등으로 강사 조회하기
	 * @param: String keyword(검색어), String keyfield(컬럼명)
	 * @return: List<Teacher>
	 * */
	List<Teacher> selectByTeacherId (String keyfield, String keyword);
	
	/**
	 * 강사 조회 페이징처리
	 * */
	Page<Teacher> selectAllTeacher(Pageable pageable);
	
	
}
