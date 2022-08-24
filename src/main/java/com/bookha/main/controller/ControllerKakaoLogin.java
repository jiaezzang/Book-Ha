package com.bookha.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAOKakaoUser;
import com.bookha.main.dto.DTOUser;
import com.bookha.model.ModelLogoHtml;




@RestController
@RequestMapping(value="/kakaoUser")
public class ControllerKakaoLogin {

	@Autowired
	private DAOKakaoUser dao_KakaoUser;
	
	@GetMapping("/kakao_add")
	public ModelAndView kakaoAdd(ModelAndView mav) {
		mav.addObject("logo", new ModelLogoHtml().getLogo().toString());
		mav.setViewName("login/kakao_add");
		
		return mav;
	}
	
	@PostMapping("/userInfo")
	public DTOUser userInfo(@RequestBody DTOUser user) {
		dao_KakaoUser.kakaoUserJoin(user);
		
		return user;
	}
}
