package dcsc.mvc.config.oauth;

import java.io.Serializable;

import dcsc.mvc.domain.user.Student;

public class SessionUser implements Serializable {
		private String name;
		private String email;
		
		public SessionUser(Student student){
			this.name = student.getStudentId();
			this.email = student.getStudentEmail();
		}
	

}
