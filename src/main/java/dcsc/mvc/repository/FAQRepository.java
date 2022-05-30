package dcsc.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.board.FAQ;

public interface FAQRepository extends JpaRepository<FAQ, Long>{

}
