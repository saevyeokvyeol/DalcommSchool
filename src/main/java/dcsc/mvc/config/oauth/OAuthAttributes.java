package dcsc.mvc.config.oauth;

import java.util.Map;

import dcsc.mvc.domain.user.Student;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
public class OAuthAttributes {
	private Map<String, Object> attributes;
	private String nameAttributeKey;
	private String studentId;
	private String studentEmail;
	private String role;
	
    public static OAuthAttributes of(String registrationId, 
									String userNameAttributeName,
									Map<String, Object> attributes) {

    	/* 구글, 네이버, 카카오 구분하기 위한 메소드 (ofNaver, ofKakao) */
    	
    	return ofGoogle(userNameAttributeName,attributes);
    	
    }
    
    private static OAuthAttributes ofGoogle(String userNameAttributeName, 
    										Map<String, Object> attributes) {
    	
    	return OAuthAttributes.builder()
    			.studentId((String) attributes.get("email"))
    			.studentEmail((String) attributes.get("email"))
    			.attributes(attributes)
    			.nameAttributeKey(userNameAttributeName)
    			.build();
    }
    
//    public Student toEntity() {
//    	return Student.builder()
//    			.studentId(studentId)
//    			.studentEmail(studentEmail)
//    			.role(role)
//    			.build();
//    }
    

}