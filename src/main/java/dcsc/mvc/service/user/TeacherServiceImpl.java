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
	
//	private final Student student;
//	private final Teacher teacher;
	
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
