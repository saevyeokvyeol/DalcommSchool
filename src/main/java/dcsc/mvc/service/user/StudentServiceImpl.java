package dcsc.mvc.service.user;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import javax.management.Query;
import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.jpa.JPQLQuery;
import com.querydsl.jpa.JPQLQueryFactory;

import dcsc.mvc.domain.user.QStudent;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.repository.user.StudentRepository;
import dcsc.mvc.repository.user.TeacherRepository;
import lombok.RequiredArgsConstructor;

@Service //생성
@RequiredArgsConstructor
@Transactional
public class StudentServiceImpl implements StudentService {

	private final StudentRepository studentRep;
	private final TeacherRepository teacherRep;
	
	private final JPQLQueryFactory jpqlQueryFactory;

	private final BCryptPasswordEncoder getBCryptPasswordEncoder;

	
	/**
	 * 회원가입
	 * */
	@Override
	public void insertStudent(Student student) { 
		System.out.println(student);
		
//		인수로 들어오는 비밀번호 암호화
		String rawPassword = student.getStudentPwd();
		String encPassword = getBCryptPasswordEncoder.encode(rawPassword); 
		student.setStudentPwd(encPassword);
		
		Student stu = studentRep.save(student);
		if(stu==null) {
			new RuntimeException("회원가입에 실패했습니다.");
		}
	}
	
	/**
	 * 로그인
	 * */
	@Override
	public Student login(String userId, String userPwd) {
		Student student = studentRep.selectStudentIdPwd(userId, userPwd);

		return student;
	}
	
	/**
	 * 학생 회원 정보 수정
	 * */
	@Override
	public Student updateStudent(Student student) {
		Student dbStudent = studentRep.findById(student.getStudentId()).orElse(student);
		
		if(dbStudent==null) {
			new RuntimeException("회원 정보 수정에 실패했습니다.");
		}
		
		dbStudent.setStudentPhone(student.getStudentPhone());
		dbStudent.setStudentEmail(student.getStudentEmail());
		

		return dbStudent;

	}


	/**
	 * 회원 탈퇴
	 * */
	@Override
	public void deleteStudent(String userId, String userPwd) { 
		//저장된 사용자 정보를 불러온다
		Student student = (Student)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//DB에 저장된 비밀번호화 입력받은 비밀번호 비교
		if(!getBCryptPasswordEncoder.matches(userPwd, student.getStudentPwd())) {
			throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
		} else {
			studentRep.deleteById(userId);
		}
	}
	
	/**
	 * 전체 학생 조회
	 * */
	@Override
	public List<Student> selectAllStudent() { 
		List<Student> stuList = studentRep.findAll();
		
		if(stuList==null) {
			throw new RuntimeException("조회 가능한 회원 데이터가 없습니다.");
		}
		
		return stuList;
	}
	
	/**
	 * 학생 상세 정보 조회 (아이디로 검색)
	 * */
	@Override
	public Student selectStudent(String studentId) {
		Student student = studentRep.findById(studentId).orElse(null);
			if(student==null) {
				throw new RuntimeException("해당하는 학생 상세정보가 없습니다.");
			}
		return student;
	}
	
	
	/**
	 * 아이디, 이름, 핸드폰, 이메일 등등으로 학생 조회하기
	 * keyword(검색어), key field(컬럼명)
	 * */
	@Override
	public Page<Student> selectByStudentId(String keyfield, String keyword, Pageable pageable) {
		BooleanBuilder booleanBuilder = new BooleanBuilder();
		
		QStudent student = QStudent.student;
		
		switch(keyfield) {
				case "studentID" :
					booleanBuilder.and(student.studentId.like("%" + keyword + "%"));
					break;
					
				case "studentName" :
					booleanBuilder.and(student.studentName.like("%" + keyword + "%"));
					break;	
					
				case "studentPhone" :
					booleanBuilder.and(student.studentPhone.like("%" + keyword + "%"));
					break;	
					
				case "studentEmail" :
					booleanBuilder.and(student.studentEmail.like("%" + keyword + "%"));
					break;	
		}
		
		JPQLQuery<Student> query = jpqlQueryFactory.selectFrom(student)
				.where(booleanBuilder)
				.orderBy(student.studentInsertDate.desc())
				.offset(pageable.getOffset())
				.limit(pageable.getPageSize());
		
		Page<Student> list = new PageImpl<Student>(query.fetch(), pageable, query.fetch().size());
		
		return list;
	}

	//관리자페이지 학생 조회 페이징처리
	@Override
	public Page<Student> selectAllStudent(Pageable pageable) {
		return studentRep.findAll(pageable);
	}
	
	//탈퇴시 비밀번호 검증
	@Override
	public boolean checkPwd(String userPwd) {
		//저장된 사용자 정보를 불러온다
		Student student = (Student)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//DB에 저장된 비밀번호화 입력받은 비밀번호 비교
		if(!getBCryptPasswordEncoder.matches(userPwd, student.getStudentPwd())) {
			return false; //비밀번호 틀림
		} else { 
			return true; //비밀번호 일치
		}
	}
	
	/**
	 * 신규 학생 수 검색
	 * @return: List<Student>
	 * */
	@Override
	public List<Student> selectNewStudent() {
		BooleanBuilder booleanBuilder = new BooleanBuilder();
		
		QStudent student = QStudent.student;
		
		LocalDateTime from = LocalDateTime.of(LocalDate.now(), LocalTime.of(0, 0));
		LocalDateTime to = from.plusDays(1);
		booleanBuilder.and(student.studentInsertDate.between(from, to));
		
		JPQLQuery<Student> query = jpqlQueryFactory.selectFrom(student)
				.where(booleanBuilder);
		
		return query.fetch();
	}

}
