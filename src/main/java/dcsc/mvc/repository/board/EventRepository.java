package dcsc.mvc.repository.board;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.board.Event;

public interface EventRepository extends JpaRepository<Event, Long>{

}
