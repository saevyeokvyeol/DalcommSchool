package dcsc.mvc.service.board;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import dcsc.mvc.domain.board.ClassQna;
import dcsc.mvc.domain.board.ClassReply;
import dcsc.mvc.domain.classes.Classes;
import dcsc.mvc.domain.user.Student;
import dcsc.mvc.repository.board.ClassQnaReposiroty;
import dcsc.mvc.repository.board.ClassReplyReposiroty;
import dcsc.mvc.repository.classes.ClassesRepository;
import dcsc.mvc.repository.user.StudentRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ClassQnaServiceImpl implements ClassQnaService {
	
	private final ClassQnaReposiroty classQnaRep;
	private final ClassReplyReposiroty classReplyRep;
	
	
	/**
	 * 전체검색
	 * */
	@Override
	public List<ClassQna> selectAllQna() {
		List<ClassQna> list = classQnaRep.findAll();
		System.out.println(list);
		return list;
	}
	
	/**
	 * 전체검색 - 페이징처리
	 * */
	@Override
	public Page<ClassQna> selectAllQna(Pageable Pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * Q&A 등록하기
	 * */
	@Override
	public void insertQuestion(ClassQna classQna) {
		ClassQna saveQna = classQnaRep.save(classQna);
		//System.out.println("saveQna.getQnaId = " + saveQna.getQnaId());
		//System.out.println("saveQna.getQnaTitle = " + saveQna.getQnaTitle());
		//System.out.println("saveQna.getClasses().getClassId() = " + saveQna.getClasses().getClassId());
		//System.out.println("saveQna.getStudent().getStudentId() = " + saveQna.getStudent().getStudentId());
		

	}

	/**
	 * Q&A 수정하기
	 * */
	@Override
	public void updateQuestion(ClassQna classQna) {
		ClassQna dbQna = classQnaRep.findById(classQna.getQnaId()).orElse(null);
		if(dbQna==null) {
			throw new RuntimeException("Q&A 문의글 번호 오류로 수정되지 않았습니다.");
		}
		
		dbQna.setQnaTitle(classQna.getQnaTitle());
		dbQna.setQnaContent(classQna.getQnaContent());
		dbQna.setBlindState(classQna.getBlindState());

	}

	/**
	 * Q&A 삭제하기
	 * */
	@Override
	public void deleteQuestion(Long qnaId) {
		ClassQna dbQna = classQnaRep.findById(qnaId).orElse(null);
		
		if(dbQna==null) {
			throw new RuntimeException("글번호 오류로 삭제되지 않았습니다.");
		}
		
		classQnaRep.deleteById(qnaId);
	}

	/**
	 * classId 로 Q&A 전체조회
	 * */
	@Override
	public List<ClassQna> selectByClassId(Long classId) {
		List<ClassQna> list = classQnaRep.findByClassesClassIdEquals(classId);
		return list;
	}

	/**
	 * 강사ID 로 Q&A 전체조회
	 * */
	@Override
	public List<ClassQna> selectByTeacherId(String teacherId) {
		/*Student student = studentRepository.findById(teacherId).orElse(null);
		List<ClassQna> list = student.getQnaList();
		return list;*/
		
		List<ClassQna> list = classQnaRep.findByClassesTeacherTeacherIdEquals(teacherId);
		return list;
	}

	/**
	 * qna 상세보기
	 * */
	@Override
	public ClassQna selectByQnaId(Long qnaId) {
		ClassQna classQna = classQnaRep.findById(qnaId).orElse(null);
		if(classQna==null) {
			new RuntimeException("Q&A 상세보기에 오류가 발생했습니다.");
		}
		return classQna;
	}

	/**
	 * 블라인드처리
	 * */
	@Override
	public void updateBlind(Long qnaId ,String blindState) {
		ClassQna dbQna = classQnaRep.findById(qnaId).orElse(null);
		//ClassQna dbQna = classQnaRep.updateBlind(blindState , qnaId);
		if(dbQna==null) {
			throw new RuntimeException("블라인드 처리를 하는 도중 오류가 발생했습니다.");
		}

		dbQna.setBlindState(blindState);
	}

	/**
	 * Q&A 댓글 등록
	 * */
	@Override
	public void insertReply(ClassReply classReply) {
		classReplyRep.save(classReply);
		ClassQna dbQna = classQnaRep.findById(classReply.getClassQna().getQnaId()).orElse(null);
		dbQna.setQnaComplete("T");
		

	}

	/**
	 * Q&A 댓글 수정
	 * */
	@Override
	public void updateReply(ClassReply classReply) {
		ClassReply dbReply = classReplyRep.findById(classReply.getReplyId()).orElse(classReply);
		if(dbReply==null) {
			throw new RuntimeException("Q&A 답변글 번호 오류로 수정되지 않았습니다.");
		}
		dbReply.setReplyContent(classReply.getReplyContent());
		
	}

	@Override
	public void deleteReply(Long replyId) {
		// TODO Auto-generated method stub

	}

	/**
	 * qnaId로 답글 조회
	 * */
	@Override
	public ClassReply selectByReplyQnaId(Long qnaId) {
		ClassReply classReply = classReplyRep.findByClassQnaQnaIdEquals(qnaId);
		return classReply;
	}

	

}
