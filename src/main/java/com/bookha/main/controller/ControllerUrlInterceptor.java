package com.bookha.main.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.bookha.main.filter.FilterUrlInterceptor;

@Configuration
public class ControllerUrlInterceptor implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		registry.addInterceptor(new FilterUrlInterceptor())
		// 모든 경로에 인터셉터가 가로채 필터처리할 예정.
		.addPathPatterns("/*")
        // 해당 경로는 인터셉터가 가로채지 않는다.
		.excludePathPatterns("/static/*")
        .excludePathPatterns("/login")
        .excludePathPatterns("/logout")
        .excludePathPatterns("/findUserId")
        .excludePathPatterns("/findPw")
        .excludePathPatterns("/signIn.do")
        .excludePathPatterns("/signUp")
        .excludePathPatterns("/signUp/*")
        .excludePathPatterns("/KakaoTalk.png")
        .excludePathPatterns("/kakaoUser/kakao_add")
        .excludePathPatterns("/kakaoUser/userInfo")
        .excludePathPatterns("/register_policy")
        .excludePathPatterns("/new")
        .excludePathPatterns("/chkSameId")
        .excludePathPatterns("/chkSameNickName");
	}
}