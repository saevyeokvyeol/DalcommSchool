package dcsc.mvc.controller.classes;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dcsc.mvc.domain.board.ClassReview;
import dcsc.mvc.domain.classes.Adjust;
import dcsc.mvc.domain.classes.AdjustState;
import dcsc.mvc.domain.user.Teacher;
import dcsc.mvc.service.classes.AdjustService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class AdjustController {
	private final AdjustService adjustService;
	
	private final static int PAGE_COUNT=10;
	private final static int BLOCK_COUNT=3;
	
	/**
	 * 정산 내역 조회 기능
	 * @param String teacherId(검색기준)
	 * @return List<Adjust>
	 * */
	/*@RequestMapping("teacher/adjust/adjustList")
	public void selectAllAdjustByTeacherId(String teacherId, Model model) {
		teacherId="Tkim1234";
		
		List<Adjust> list = adjustService.selectByTeacherId(teacherId);
		model.addAttribute("list", list);
	}*/
	
	/**
	 * 정산 내역 조회 기능 - 페이징처리
	 * @param String teacherId(검색기준)
	 * @return List<Adjust>
	 * */
	@RequestMapping("teacher/adjust/adjustList")
	public void selectAllAdjustByTeacherId(String teacherId, Model model, @RequestParam(defaultValue="1") int nowPage) {
		teacherId="Tkim1234";
		//teacherId="Tann1234";
		
		//페이징 처리하기
		Pageable page = PageRequest.of((nowPage-1),PAGE_COUNT, Direction.DESC,"adjustNo");
		Page<Adjust> adjustList = adjustService.selectByTeacherId(teacherId, page);
		
		model.addAttribute("adjustList", adjustList);
		
		int temp=(nowPage-1)%BLOCK_COUNT;
		int startPage = nowPage-temp;
	
		model.addAttribute("blockCount",BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage",nowPage);
		
		System.out.println(BLOCK_COUNT);
		System.out.println(startPage);
		System.out.println(nowPage);
		
	}
	
	/**
	 * 정산 가능 금액 조회 기능
	 * @param String teacherId(검색기준)
	 * @return int (정산금액)
	 * */
	@RequestMapping("teacher/adjust/adjustable")
	public void adjustableByTeacherId(String teacherId, Model model) {
		teacherId="Tkim1234";
		int adjustable = adjustService.selectAdjust(teacherId);
		System.out.println("adjustable = "+ adjustable);
		model.addAttribute("adjustable", adjustable);
		model.addAttribute("teacherId", teacherId);
	}
	
	/**
	 * 정산 신청 폼
	 * */
	@RequestMapping("teacher/adjust/adjustForm")
	public void couponForm(String teacherId, Model model) {
		teacherId="Tkim1234";
		int adjustable = adjustService.selectAdjust(teacherId);
		model.addAttribute("adjustable", adjustable);
	}
	
	/**
	 * 정산 신청 기능
	 * @param Adjust(강사아이디,정산금액,은행명,예금주,계좌번호)
	 * @return
	 * 정산 가능 금액 변경 : 총 수익에서 정산 신청 금액 차감 (update)
	 * */
	@RequestMapping("applyAdjust")
	public String applyAdjust(Adjust adjust, Teacher teacher, AdjustState adjustState) {
		System.out.println("adjust.getAdjustPrice()= "+ adjust.getAdjustPrice());
		System.out.println("teacher.getTeacherId()= "+ teacher.getTeacherId());
		System.out.println("adjustState.getAdjustStateId()= "+ adjustState.getAdjustStateId());
		adjust.setAdjustState(adjustState);
		adjust.setTeacher(teacher);
		adjustService.insertAdjust(adjust);
		
		return"redirect:/teacher/adjust/adjustList";
	}
	
	/**
	 * 정산 내역 전체 조회 - 관리자
	 * @return List<Adjust>
	 * */
	/*@RequestMapping("admin/adjust/adjustAllList")
	public void selectAllAdjust(Model model) {
		List<Adjust> list = adjustService.selectAll();
		model.addAttribute("list", list);
	}*/
	
	/**
	 * 정산 내역 전체 조회(페이징처리) - 관리자
	 * @return List<Adjust>
	 * */
	@RequestMapping("admin/adjust/adjustAllList")
	public void selectAllAdjust(Model model, @RequestParam(defaultValue = "1") int nowPage) {
		
		//페이징처리하기
		Pageable page = PageRequest.of( (nowPage-1), PAGE_COUNT, Direction.DESC, "adjustNo");
		Page<Adjust> adjustList = adjustService.selectAll(page);
		
		//pageList.getContent() : 뷰단 상황 이해하기 //${requestScope.pageList.content}
		
		model.addAttribute("adjustList", adjustList);
		
		
		int temp = (nowPage-1)%BLOCK_COUNT; //나머지는 항상 0 1 2 임 why? 3이므로 3보다 작은 값
		int startPage = nowPage-temp;
		
		model.addAttribute("blockCount", BLOCK_COUNT);
		model.addAttribute("startPage", startPage);
		model.addAttribute("nowPage", nowPage);
	}
	
	/**
	 * 요청된 정산 처리 기능
	 * 
	 * 정산 상태 '정산진행중'으로 변경 (update)
	 * 
	 * state로 정산 상태 관리(정산테이블의 정산일,정산상태Id변경)
	 * 
	 * @param int adjustStateId(정렬기준)
	 * @return
	 * */
	@RequestMapping("admin/adjust/changeAdjustState")
	@ResponseBody
	public void changeAdjustState(Adjust adjust, AdjustState adjustState) {
		adjust.setAdjustState(adjustState);
		adjustService.updateAdjust(adjust, adjustState);
	}
	
}
