package dcsc.mvc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class UploadConfig {
	/**
	 * 업로드 컴포넌트 생성
	 * : 메소드 이름을 반드시 multipartResolver로 생성
	 * */
	@Bean // Bean 등록을 위한 어노테이션
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
		return commonsMultipartResolver;
	}
}
