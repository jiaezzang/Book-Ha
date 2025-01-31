package com.bookha.main.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@RestController
public class ControllerImageReqURL implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry
			// 이미지 파일의 요청 경로를 지정한다.
			.addResourceHandler("/images/**")
			// 이미지 파일을 불러올 로컬 저장소의 위치를 지정한다.
			.addResourceLocations("file:/C:/imageSaveStorage/");
	}
}