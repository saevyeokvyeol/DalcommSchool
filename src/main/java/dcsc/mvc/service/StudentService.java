package dcsc.mvc.service;

import java.util.List;

import dcsc.mvc.domain.board.Ask;
import dcsc.mvc.domain.board.ClassQna;
import dcsc.mvc.domain.board.ClassReview;
import dcsc.mvc.domain.classes.Book;
import dcsc.mvc.domain.user.Student;

public interface StudentService {

	/**
	 * 회원가입
	 * @param: Student student
	 * */
	void insertStudent (Student student);
	
	/**
	 * 아이디 찾기
	 * @param: String studentName, String studentPhone
	 * @return: String studentId
	 * */
	String selectStudentId (String studentName, String studentPhone);
	
	/**
	 * 비밀번호 찾기
	 * @param:String studentId, String studentName, String studentPhone
	 * */
	void selectStudentPwd (String studentId, String studentName, String studentPhone);
	
	/**
	 * 회원정보 수정
	 * @param: Student student
	 * */
	void updateStudent (Student student);
	
	/**
	 * 비밀번호 수정
	 *  : 새로운 비밀번호와 기존 비밀번호 일치/불일치 여부 확인
	 * @param: String studentPwd
	 * */
	void updateStudentPwd (String studentOldPwd, String studentNewPwd);
	
	/**
	 * 회원 탈퇴하기(학생)
	 * @param: String studentId
	 * */
	void deleteStudent (String studentId);
	
	/**
	 * 학생 아이디 중복체크
	 * @param: String studentId
	 * @return: boolean
	 * */
	boolean studentIdCheck (String studentId);
	
	/**
	 * 학생 핸드폰 번호 중복체크
	 * @param: String studentPhone
	 * @return: boolean
	 * */
	boolean studentPhoneCheck (String studentPhone);
	
	/**
	 * 학생 이메일 주소 중복체크
	 * @param: String studentEmail
	 * @return: boolean
	 * */
	boolean studentEmailCheck (String studentEmail);
	
	/**
	 * 학생 조회하기
	 * @param: 
	 * @return: List<Student>
	 * */
	List<Student> selectAllStudent ();
	
	/**
	 * 아이디로 학생 조회하기
	 * @param: String keyword, String keyfield
	 * @return: List<Student>
	 * */
	List<Student> selectByStudentId (String keyword, String keyfield);
		
}
