package com.bookha.main.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.bookha.model.ModelUrlInterceptor;

@Configuration
public class ControllerUrlInterceptor implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		registry.addInterceptor(new ModelUrlInterceptor())
        .addPathPatterns("/*")
        .excludePathPatterns("/login"); // 해당 경로는 인터셉터가 가로채지 않는다.
	}

}
