package dcsc.mvc.domain.user;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@RequiredArgsConstructor
public class Infra {
	
	@Id
	@NonNull
	private Long infraId;
	
	private String infraName;
	
	@OneToMany(mappedBy = "infra")
	private List<PlaceInfra> placeInfra;
}
