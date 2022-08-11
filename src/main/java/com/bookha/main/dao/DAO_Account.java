package com.bookha.main.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookha.main.dto.DTO_User;
import com.bookha.main.mapper.Mapper_User;

@Service
public class DAO_Account {
	
	@Autowired
	Mapper_User mapper_User;
	
	@Transactional
	public void deleteAccount(DTO_User user) {
		user.setUser_mail(user.getUser_mail());
		user.setUser_password(user.getUser_password());
		
		mapper_User.deleteAccount(user);
	}
	
	@Transactional
	public void updateAccount(DTO_User user) {
		user.setUser_mail(user.getUser_mail());
		user.setUser_password(user.getUser_password());
		user.setUser_nickname(user.getUser_nickname());
		user.setUser_phonenumber(user.getUser_phonenumber());
		user.setUser_self(user.getUser_self());
		
		mapper_User.updateAccount(user);
	}

}
