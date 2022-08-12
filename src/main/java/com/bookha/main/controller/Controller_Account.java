package com.bookha.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAO_Account;
import com.bookha.main.dto.DTO_User;


@RestController
@RequestMapping(value="account")
public class Controller_Account {
	
	@Autowired
	DAO_Account dao_Account;
	
	@GetMapping("/user_account_setting")
	public ModelAndView userAccountSetting(ModelAndView mav) {
		mav.setViewName("mypage/user_account_setting");
		
		return mav;
	}
	
	@PostMapping("/update")
	public DTO_User updateAccount(@RequestBody DTO_User user) {
		dao_Account.updateAccount(user);
		return user;
	}
	
	
	@PostMapping("/delete")
	public DTO_User deleteAccount(@RequestBody DTO_User user) {
		dao_Account.deleteAccount(user);
		
		return user;
		
	}
}
