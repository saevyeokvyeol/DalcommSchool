package dcsc.mvc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class TilesConfig {

	@Bean
	public UrlBasedViewResolver getUrlBasedViewResolver() {
		UrlBasedViewResolver tilesViewResolver = new UrlBasedViewResolver();
		
		tilesViewResolver.setOrder(0);
		tilesViewResolver.setViewClass(TilesView.class);
		
		return tilesViewResolver;
	}
	
	@Bean
	public TilesConfigurer getTilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		
		tilesConfigurer.setDefinitions(new String[] {"/WEB-INF/tiles/tiles.xml"});
		
		return tilesConfigurer;
	}
}
