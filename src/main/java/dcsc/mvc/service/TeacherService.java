package dcsc.mvc.service;

import java.sql.Connection;
import java.util.List;

import dcsc.mvc.domain.user.Place;
import dcsc.mvc.domain.user.Teacher;

public interface TeacherService {

	/**
	 * 회원가입
	 * @param: Teacher teacher
	 * @return:
	 * */
	void InsertTeacher (Teacher teacher);
	
	/**
	 * 아이디 찾기
	 * @param: String teacherName, String teacherPhone
	 * @return: String teacherId
	 * */
	String selectTeacherId (String teacherName, String teacherPhone);
	
	/**
	 * 비밀번호 찾기
	 * @param: String teacherId, String teacherName, String teacherPhone
	 * */
	void selectTeacherPwd(String teacherId, String teacherName, String teacherPhone);
	
	/**
	 * 회원정보 수정
	 * @param: Teacher teahcer
	 * @return:
	 * */
	void updateTeacher (Teacher teahcer);
	
	/**
	 * 비밀번호 수정
	 * @param: String teacherPwd
	 * @return:
	 * */
	void updateTeacherPwd (String teacherPwd);
	
	/**
	 * 강사 탈퇴하기
	 * @param: String teacherId
	 * @return: 
	 * */
	void deleteTeacher (String teacherId);
	
	/**
	 * 강사 아이디 중복체크
	 * @param: String teacherId
	 * @return: boolean
	 * */
	boolean teacherIdCheck (String teacherId);
	
	/**
	 * 강사 닉네임 중복체크
	 * @param: String teacherNickname
	 * @return: boolean
	 * */
	boolean teacherNickCheck (String teacherNickname);
	
	/**
	 * 강사 핸드폰 번호 중복체크
	 * @param: String teacherPhone
	 * @return: boolean
	 * */
	boolean teacherPhoneCheck (String teacherPhone);
	
	/**
	 * 강사 이메일 주소 중복체크
	 * @param: String teacherEmail
	 * @return: boolean
	 * */
	boolean teacherEmailCheck (String teacherEmail);
	
	/**
	 * 강사 조회
	 * @param
	 * @return List<Teacher>
	 * */
	List<Teacher> selectAllTeacher ();
	
	/**
	 * 아이디로 강사 조회
	 * @param String teacherId
	 * @return List<Teacher>
	 * */
	List<Teacher> selectByTeacherId (String keyword, String keyfield);
	
	/**
	 * 공방 등록
	 * @param Place place //Place 안에 PlaceInfra 있음 (JPA) 트랜잭션으로 인프라까지 등록
	 * @return 
	 * */
	void insertPlace (Place place);
	
	/**
	 * 공방 정보 수정
	 * @param Place place //Place 안에 PlaceInfra 있음 (JPA) 트랜잭션으로 인프라까지 수정
	 * @return
	 * */
	void updatePlace (Place place);
	
}
