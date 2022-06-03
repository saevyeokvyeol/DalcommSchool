package dcsc.mvc.service.user;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.Transactional;

//import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Service;

import dcsc.mvc.domain.user.Place;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.repository.user.StudentRepository;
import dcsc.mvc.repository.user.TeacherRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class TeacherServiceImpl implements TeacherService {
	
	private final TeacherRepository teacherRep;
	private final StudentRepository studentRep;
	
	private final Student student;
	private final Teacher teacher;
	
	@Override
	public void insertTeacher(Teacher teacher) {
		
		Teacher saveTeacher = teacherRep.save(teacher);

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
	public void updateTeacherPwd(String teacherPwd) {
//		if(!passwordEncoder.matches(password, vo.getPassword())){
//			throw new BadCredentialsException("패스워드 오류입니다."); 이런 방식으로~~

	}

	/**
	 * 아이디 중복체크
	 * */
	@Override
	public boolean userIdCheck(String userId) {
		List<Teacher> listTeacher = teacherRep.findByTeacherId(userId);
		List<Student> listStudent = studentRep.findByStudentId(userId);
		
		if(listTeacher != null || listStudent != null) { //아이디가 이미 있다면
			return true;
		}else {
			return false;
		}
	}

	/**
	 * 선생님 닉네임 중복체크
	 * */
	@Override
	public boolean teacherNickCheck(String teacherNickname) {
		List<Teacher> list = teacherRep.findByTeacherNickname(teacherNickname);
		
		if(list != null) {
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
		List<Teacher> listTeacher = teacherRep.findByTeacherPhone(userPhone);
		List<Student> listStudent = studentRep.findByStudentPhone(userPhone);
		
		if(listTeacher != null || listStudent != null) { //번호가 이미 있다면
			return true;
		}else {
			return false;
		}
	}

	@Override
	public List<Teacher> selectAllTeacher() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 선생님 아이디로 정보 불러오기
	 * */
	@Override
	public Teacher selectByTeacherId(String teacherId) {
		Teacher teacher = teacherRep.getById(teacherId);
		if(teacher==null) {throw new RuntimeException("해당 ID에 대한 정보가 없습니다.");};
		return teacher;
	}
	
	@Override
	public List<Teacher> selectTeacherByKeyword(String keyword, String keyfield) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertPlace(Place place) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updatePlace(Place place) {
		// TODO Auto-generated method stub

	}

	

}
