package dcsc.mvc.repository.board;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.board.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Long>{

}
