package com.bookha.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookha.main.dto.DTOUser;
import com.bookha.main.mapper.MapperUser;



@Service
public class DAOUser {

	@Autowired
	MapperUser mapper_User;
	
	@Transactional
	public void userJoin(DTOUser user) {
		user.setUser_mail(user.getUser_mail());
		user.setUser_password(user.getUser_password());
		user.setUser_name(user.getUser_name());
		user.setUser_nickname(user.getUser_nickname());
		user.setUser_phonenumber(user.getUser_phonenumber());
		user.setUser_profile("none.png");
		user.setUser_self("");
		user.setUser_enterdate(user.getUser_enterdate());
		user.setUser_final(user.getUser_final());
		user.setUser_role(user.getUser_role());
		user.setUser_option(user.getUser_option());
		
		mapper_User.userJoin(user);
	}
	
	@Transactional
	public DTOUser signIn(DTOUser user) {
		
		user.setUser_mail(user.getUser_mail());
		user.setUser_password(user.getUser_password());
		
//		System.out.println(user.toString());
		
		List<Map<String, String>> mapLists = mapper_User.userSignIn(user);
		
		Map<String, String> map = mapLists.get(0);

		user.setUser_num(Integer.parseInt(String.valueOf(map.get("user_num"))));
		
		if(!mapper_User.userSignIn(user).isEmpty()) {
			return user;
		}
		
		return null;
	}
	
	@Transactional
	public String chkSameId(DTOUser user) {
		if(user.getUser_mail().equals(mapper_User.chkSameId(user.getUser_mail()))) {
			return "0";
		}
		
		return "1";
	}
	
	@Transactional
	public String chkSameNickname(DTOUser user) {
		if(user.getUser_nickname().equals(mapper_User.chkSameNickname(user.getUser_nickname()))) {
			return "0";
		}
		
		return "1";
	}
	
	@Transactional
	public List<Map<String, String>> findUserId(DTOUser user) {
		
		return mapper_User.findUserId(user);
	}
	
	@Transactional
	public List<Map<String, String>> findPw(DTOUser user) {
		
		return mapper_User.findPw(user);
	}
	
	@Transactional
	public DTOUser userSetting(int session_user_num) {
		
		return mapper_User.userSetting(session_user_num);
	}
	
	@Transactional
	public int changeProfile(DTOUser user) {
		int flag = mapper_User.changeProfile(user);
		
		return flag;
	}
	
	@Transactional
	public int adminNum() {
		
		return mapper_User.adminNum();
	}
	
	@Transactional
	public int checkNickname(String user_nickname) {
		
		return mapper_User.checkNickname(user_nickname);
	}
}
