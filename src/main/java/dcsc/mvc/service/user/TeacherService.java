package dcsc.mvc.service.user;

import java.sql.Connection;
import java.util.List;

import dcsc.mvc.domain.user.Place;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;

public interface TeacherService {

	/**
	 * 회원가입
	 * @param: Teacher teacher
	 * @return:
	 * */
	void insertTeacher (Teacher teacher);
	
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
	void updateTeacher (Teacher teahcer);
	
	/**
	 * 비밀번호 수정
	 * @param: String teacherPwd
	 * @return:
	 * */
	void updateTeacherPwd (String teacherPwd);
	
	
	/**
	 * 아이디 중복체크
	 * @param: String teacherId
	 * @return: boolean
	 * */
	boolean userIdCheck (String userId);
	
	/**
	 * 강사 닉네임 중복체크
	 * @param: String teacherNickname
	 * @return: boolean
	 * */
	boolean teacherNickCheck (String teacherNickname);
	
	/**
	 * 핸드폰 번호 중복체크
	 * @param: String teacherPhone
	 * @return: boolean
	 * */
	boolean userPhoneCheck (String userPhone);

	
	/**
	 * 강사 조회
	 * @param
	 * @return List<Teacher>
	 * */
	List<Teacher> selectAllTeacher ();
	
	/**
	 * 아이디로 강사 조회
	 * @param String teacherId
	 * @return Teacher
	 * */
	Teacher selectByTeacherId (String teacherId);
	
	/**
	 * 키워드로 강사 조회
	 * @param String keyword, String keyfield
	 * @return List<Teacher>
	 * */
	List<Teacher> selectTeacherByKeyword (String keyword, String keyfield);
	
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
	
	
	/**
	 * 아이디, 이름 등등으로 강사 조회하기
	 * @param: String keyword(검색어), String keyfield(컬럼명)
	 * @return: List<Teacher>
	 * */
	List<Teacher> selectByTeacherId (String keyfield, String keyword);
	
	
}
