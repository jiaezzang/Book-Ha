package com.bookha.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAOKakaoUser;
import com.bookha.main.dao.DAOUser;
import com.bookha.main.dto.DTOUser;
import com.bookha.model.ModelLogoHtml;




@RestController
@RequestMapping(value="/kakaoUser")
public class ControllerKakaoLogin {

	@Autowired
	private DAOKakaoUser dao_KakaoUser;
	
	@Autowired
	private DAOUser dao_User;
	
	@RequestMapping(value = "/kakao_add", method = RequestMethod.POST)
	public ModelAndView kakaoAdd(ModelAndView mav, HttpServletRequest request) {
		mav.addObject("logo", new ModelLogoHtml().getLogo().toString());
		mav.addObject("email", request.getParameter("email"));
		mav.addObject("name", request.getParameter("name"));
		mav.setViewName("login/kakao_add");
		
		return mav;
	}
	
	@RequestMapping(value = "/userInfo", method = RequestMethod.POST)
	public DTOUser userInfo(@RequestBody DTOUser user, HttpServletRequest request, HttpSession session) {
		dao_KakaoUser.kakaoUserJoin(user);
		user.setUser_num(dao_KakaoUser.lastUserNum());
		
		session = request.getSession();
		session.setAttribute("login", true);
		session.setAttribute("user_num", user.getUser_num());
		
		session.setMaxInactiveInterval(-1);
		
		return user;
	}
	
	@RequestMapping(value = "/kakao_user_check", method = RequestMethod.POST)
	public String kakoUserCheck(@RequestBody DTOUser user, HttpServletRequest request, HttpSession session) {
		int user_num = 0;
		int check = dao_User.checkId(user.getUser_mail());
		String flag = "0";
		
		if(check != 0) {
			user_num = dao_KakaoUser.checkKakaoId(user.getUser_mail());
			flag = "1";
		}
		
		session = request.getSession();
		session.setAttribute("login", true);
		session.setAttribute("user_num", user_num);
		
		session.setMaxInactiveInterval(-1);
		
		return flag;
	}
}
