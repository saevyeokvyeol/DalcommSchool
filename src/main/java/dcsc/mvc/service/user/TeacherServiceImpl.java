package dcsc.mvc.service.user;

import java.sql.SQLException;
import java.util.List;

import javax.transaction.Transactional;

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
	public void selectPwd(String userId, String userName, String userPhone) {
		

	}

	@Override
	public void updateTeacher(Teacher teahcer) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateTeacherPwd(String teacherPwd) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteTeacher(String teacherId) {
		// TODO Auto-generated method stub

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

	@Override
	public boolean teacherNickCheck(String teacherNickname) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean userPhoneCheck(String userPhone) {
		List<Teacher> listTeacher = teacherRep.findByTeacherPhone(userPhone);
		List<Student> listStudent = studentRep.findByStudentPhone(userPhone);
		
		if(listTeacher != null || listStudent != null) { //아이디가 이미 있다면
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
