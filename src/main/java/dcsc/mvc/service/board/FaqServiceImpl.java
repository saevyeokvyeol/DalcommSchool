package dcsc.mvc.service.board;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import dcsc.mvc.domain.board.Faq;
import dcsc.mvc.domain.board.FaqCategory;
import dcsc.mvc.repository.board.FAQRepository;
import dcsc.mvc.repository.board.FaqCategoryRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class FaqServiceImpl implements FaqService {
	
	private final FAQRepository faqRepository;
	private final FaqCategoryRepository faqCategoryRepository;
	
	@Override
	public void insertFAQ(Faq faq) {
		Faq saveFree= faqRepository.save(faq);
		
	}

	@Override
	public Faq updateFAQ(Faq faq,FaqCategory faqCategory) {
		
		Faq dbFaq = faqRepository.findById(faq.getFaqNo()).orElse(null);
		if(dbFaq==null) {
			throw new RuntimeException("글번호 오류 수정할수 없습니다.");
		}
		
		dbFaq.setFaqTitle(faq.getFaqTitle());
		dbFaq.setFaqCategory(faq.getFaqCategory());
		dbFaq.setFaqContent(faq.getFaqContent());
		
		return dbFaq;
	}

	@Override
	public void deleteFAQ(Long faqNo) {
		Faq dbFaq = faqRepository.findById(faqNo).orElse(null);
		if(dbFaq==null) {
			throw new RuntimeException("글번호 오류로 삭제할수 없습니다.");
		}
		faqRepository.deleteById(faqNo);
	}
	
	@Override
	public Faq selectByFaqNo(Long faqNo, boolean state) {
		if(state) {
			//조회수 증가해보자
			}
			Faq faq = faqRepository.findById(faqNo).orElse(null);
			if(faq==null)new RuntimeException("상세보기에 오류가 발생했습니다.");
			return faq;
	}


	@Override
	public List<Faq> selectAllfqa() {
		return faqRepository.findAll();
	}

	@Override
	public List<Faq> selectBykeyword(String keyword) {
		
		return null;
	}

	@Override
	public List<FaqCategory>  selectfaqCategory() {
		List<FaqCategory> list = faqCategoryRepository.findAll();
		
		return list;
	}

	@Override
	public List<Faq> selectByfaqCategoryId(Long FaqCategoryId) {
		
		
		return null;
	}


}
