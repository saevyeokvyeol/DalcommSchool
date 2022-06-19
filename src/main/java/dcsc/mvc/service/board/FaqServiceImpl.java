package dcsc.mvc.service.board;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.jpa.JPQLQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;

import dcsc.mvc.domain.board.Faq;
import dcsc.mvc.domain.board.FaqCategory;
import dcsc.mvc.domain.board.QFaq;
import dcsc.mvc.repository.board.FAQRepository;
import dcsc.mvc.repository.board.FaqCategoryRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class FaqServiceImpl implements FaqService {
	

	private final FAQRepository faqRepository;
	private final FaqCategoryRepository faqCategoryRepository;
	private final JPAQueryFactory factory;
	
	@Override
	public void insertFAQ(Faq faq) {
		Faq saveFree= faqRepository.save(faq);
		System.out.println("saveFree = " + saveFree);
		System.out.println("faq +  = " + faq );
	}

	@Override
	public Faq updateFAQ(Faq faq) {
		
		Faq dbFaq = faqRepository.findById(faq.getFaqNo()).orElse(null);
		if(dbFaq==null) {
			throw new RuntimeException("글번호 오류 수정할수 없습니다.");
		}
		
		dbFaq.setFaqTitle(faq.getFaqTitle());
		dbFaq.setFaqCategory(faq.getFaqCategory());
		dbFaq.setFaqContent(faq.getFaqContent());
		dbFaq.setFaqImg(faq.getFaqImg());
		
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
	public Page<Faq> selectAllfqa(Pageable pageable) {
		return faqRepository.findAll(pageable);
	}
	
	@Override
	public Page<Faq> selectBykeyword(String keyword, Pageable pageable) {
		BooleanBuilder booleanBuilder = new BooleanBuilder();
		QFaq faq = QFaq.faq;
		booleanBuilder.and(faq.faqContent.like("%"+keyword+"%"));
		booleanBuilder.or(faq.faqTitle.like("%"+keyword+"%"));
		JPQLQuery<Faq> jpqlQuery = factory.selectFrom(faq).where(booleanBuilder)
				.offset(pageable.getOffset()).limit(pageable.getPageSize());
				
		Page<Faq> list = new PageImpl<Faq>(jpqlQuery.fetch(), pageable, jpqlQuery.fetch().size());
		
		System.out.println("list입니다123"+ list);
		return list;
	}


	@Override
	public List<FaqCategory>  selectfaqCategory() {
		List<FaqCategory> list = faqCategoryRepository.findAll();
		
		return list;
	}

	@Override
	public Page<Faq> selectByfaqCategoryId(Long FaqCategoryId, Pageable pageable) {
		BooleanBuilder builder = new BooleanBuilder();
		QFaq faq = QFaq.faq;
		
		builder.and(faq.faqCategory.faqCategoryId.eq(FaqCategoryId));

		JPQLQuery<Faq> jpqlQuery = factory.selectFrom(faq).where(builder)
				.offset(pageable.getOffset()).limit(pageable.getPageSize());
		
		Page<Faq> list = new PageImpl<Faq>(jpqlQuery.fetch(), pageable, jpqlQuery.fetchCount());
		
		return list;
	}

	

	
	

}
