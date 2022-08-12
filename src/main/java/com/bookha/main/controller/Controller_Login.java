package com.bookha.main.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAO_User;
import com.bookha.main.dto.DTO_User;


@RestController
public class Controller_Login {
	
	@Autowired
	private DAO_User dao_User;
	
	@GetMapping("/")
	public ModelAndView index(ModelAndView mav) {
		
		mav.setViewName("login/index");
		
		return mav;
	}

	@GetMapping("/login")
	public ModelAndView login(HttpSession session, ModelAndView mav) {
		mav.setViewName("login/login");
		
		return mav;
	}
	
	@GetMapping("/signUp")
	public ModelAndView signUp(ModelAndView mav) {
		mav.setViewName("login/signUp");
		
		return mav;
	}
	
	@PostMapping("/signIn.do")
	public DTO_User signIn(HttpServletRequest request, HttpSession session, @RequestBody DTO_User user) {
		session = request.getSession();
		session.setAttribute("login", true);
		
		
		return dao_User.signIn(user);
	}
	
	
	@GetMapping("/logout")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
		session.invalidate();
		mav.setViewName("/login/index");
		return mav;
	}
	
	@GetMapping("/findUserId")
	public ModelAndView findUserId(ModelAndView mav) {
		mav.setViewName("login/findUserId");
		
		return mav;
	}
	
	@PostMapping("/findUserId")
	public List<Map<String, String>> findUserId(@RequestBody DTO_User user) {
		
		return dao_User.findUserId(user);
	}
	
	@GetMapping("/findPw")
	public ModelAndView findPw(ModelAndView mav) {
		mav.setViewName("login/findPw");
		
		return mav;
	}
	
	@PostMapping("/findPw")
	public List<Map<String, String>> findPw(@RequestBody DTO_User user) {
		
		return dao_User.findPw(user);
	}
}
