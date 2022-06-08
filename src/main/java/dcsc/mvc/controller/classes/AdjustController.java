package dcsc.mvc.controller.classes;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	/**
	 * 정산 내역 조회 기능
	 * @param String teacherId(검색기준)
	 * @return List<Adjust>
	 * */
	@RequestMapping("teacher/adjust/adjustList")
	public void selectAllAdjustByTeacherId(String teacherId, Model model) {
		teacherId="Tkim1234";
		
		List<Adjust> list = adjustService.selectByTeacherId(teacherId);
		model.addAttribute("list", list);
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
		
	
	
}
