package com.bookha.main.dao;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookha.main.dto.DTOUser;
import com.bookha.main.mapper.MapperUser;

@Service
public class DAOKakaoUser {

	@Autowired
	MapperUser mapper_User;
	
	@Transactional
	public void kakaoUserJoin(DTOUser user) {
		user.setUser_mail(user.getUser_mail());
		Random random = new Random();
		random.setSeed(System.currentTimeMillis());
		int randomPw1 = random.nextInt(999999999)+1000000000;
		int randomPw2 = random.nextInt(999999999)+1000000000;
		user.setUser_password("kakao" + randomPw1 + randomPw2);
		user.setUser_name(user.getUser_name());
		user.setUser_nickname(user.getUser_nickname());
		user.setUser_phonenumber(user.getUser_phonenumber());
		user.setUser_profile(user.getUser_profile());
		user.setUser_self(null);
		user.setUser_enterdate(user.getUser_enterdate());
		user.setUser_final(user.getUser_final());
		user.setUser_role(user.getUser_role());
		
		mapper_User.kakaoUserJoin(user);
	}
	
	@Transactional
	public int lastUserNum() {
		
		return mapper_User.lastUserNum();
	}
	
	@Transactional
	public int checkKakaoId(String user_mail) {
		
		return mapper_User.checkKakaoId(user_mail);
	}
}
