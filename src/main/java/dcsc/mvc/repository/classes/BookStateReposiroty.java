package dcsc.mvc.repository.classes;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.classes.BookState;

public interface BookStateReposiroty extends JpaRepository<BookState, Long> {

}
