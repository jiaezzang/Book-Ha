package com.bookha.main.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookha.main.dto.DTOUser;
import com.bookha.main.mapper.MapperUser;

@Service
public class DAOAccount {
	
	@Autowired
	MapperUser mapper_User;
	
	@Transactional
	public void deleteAccount(DTOUser user) {
		user.setUser_mail(user.getUser_mail());
		user.setUser_password(user.getUser_password());
		
		mapper_User.deleteAccount(user);
	}
	
	@Transactional
	public void updateAccount(DTOUser user) {
		user.setUser_mail(user.getUser_mail());
		user.setUser_password(user.getUser_password());
		user.setUser_nickname(user.getUser_nickname());
		user.setUser_phonenumber(user.getUser_phonenumber());
		user.setUser_self(user.getUser_self());
		
		mapper_User.updateAccount(user);
	}

}
