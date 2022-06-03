package dcsc.mvc.repository.board;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.board.FaqCategory;

public interface FaqCategoryRepository extends JpaRepository<FaqCategory, Long> {

}
