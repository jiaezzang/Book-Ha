package com.bookha.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAO_KakaoUser;
import com.bookha.main.dto.DTO_User;




@RestController
@RequestMapping(value="/kakaoUser")
public class Controller_KakaoLogin {

	@Autowired
	private DAO_KakaoUser dao_KakaoUser;
	
	@GetMapping("/kakao_add")
	public ModelAndView kakaoAdd(ModelAndView mav) {
		mav.setViewName("login/kakao_add");
		
		return mav;
	}
	
	@PostMapping("/userInfo")
	public DTO_User userInfo(@RequestBody DTO_User user) {
		dao_KakaoUser.kakaoUserJoin(user);
		
		return user;
	}
}
