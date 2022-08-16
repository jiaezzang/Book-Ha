package com.bookha.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAOUser;
import com.bookha.main.dto.DTOUser;


@RestController
@RequestMapping(value="signUp")
public class ControllerSignUp {
	
	@Autowired
	private DAOUser dao_User;
	
	@GetMapping("/register_policy")
	public ModelAndView policy(ModelAndView mav) {
		mav.setViewName("login/register_policy");
		
		return mav;
	}
	
	@PostMapping("/new")
	public DTOUser singUpForNew(@RequestBody DTOUser user) {
		dao_User.userJoin(user);
		
		return user;
	}
	
	@PostMapping("/chkSameId")
	public String chkSameId(@RequestBody DTOUser user) {
		return dao_User.chkSameId(user);
	}
	
	@PostMapping("/chkSameNickname")
	public String chkSameNickname(@RequestBody DTOUser user) {
		return dao_User.chkSameNickname(user);
	}
	
}
