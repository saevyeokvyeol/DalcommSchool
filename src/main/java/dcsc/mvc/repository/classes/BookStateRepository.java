package dcsc.mvc.repository.classes;

import org.springframework.data.jpa.repository.JpaRepository;

import dcsc.mvc.domain.classes.BookState;

public interface BookStateRepository extends JpaRepository<BookState, Long> {

}
