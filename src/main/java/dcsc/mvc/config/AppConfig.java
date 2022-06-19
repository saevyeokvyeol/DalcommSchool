package dcsc.mvc.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

@Configuration
public class AppConfig {
	@Bean
	public SimpleMappingExceptionResolver getSimpleMappingExceptionResolver() {
		SimpleMappingExceptionResolver exceptionResolver = new SimpleMappingExceptionResolver();
		
		Properties properties = new Properties();
		properties.put("Exception", "error/errorView");
		
		exceptionResolver.setExceptionMappings(properties);
		
		return exceptionResolver;
	}
}
