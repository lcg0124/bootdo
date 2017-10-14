package com.bootdo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@ServletComponentScan
@MapperScan("com.bootdo.*.dao")
@SpringBootApplication
public class BootdoApplication {
	public static void main(String[] args) {
		SpringApplication.run(BootdoApplication.class, args);
		System.out.println(
				" ______                    _   ______  \n" + "|_   _ \\                  / |_|_   _ `.          \n"
						+ "  | |_) |   .--.    .--. `| |-' | | `. \\  .--.   \n"
						+ "  |  __'. / .'`\\ \\/ .'`\\ \\| |   | |  | |/ .'`\\ \\\n"
						+ " _| |__) || \\__. || \\__. || |, _| |_.' /| \\__. | \n"
						+ "|_______/  '.__.'  '.__.' \\__/|______.'  '.__.'  ");
	}

	@Bean
	public EmbeddedServletContainerCustomizer containerCustomizer() {
		return new EmbeddedServletContainerCustomizer() {
//			ErrorPage error401Page = new ErrorPage(HttpStatus.UNAUTHORIZED, "/401.html");
//			ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/404.html");
//			ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500.html");

			@Override
			public void customize(ConfigurableEmbeddedServletContainer container) {
//				container.addErrorPages(error401Page, error404Page, error500Page);
				container.setSessionTimeout(3600);// 单位为S
			}
		};
	}
}
