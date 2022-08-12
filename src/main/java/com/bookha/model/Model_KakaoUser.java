package com.bookha.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookha.main.dto.DTO_User;
import com.bookha.main.mapper.Mapper_User;

@Service
public class Model_KakaoUser {

	@Autowired
	Mapper_User mapper_User;
	
	@Transactional
	public void kakaoUserJoin(DTO_User user) {
		user.setUser_mail(user.getUser_mail());
		user.setUser_password("kakao");
		user.setUser_name(user.getUser_name());
		user.setUser_nickname(user.getUser_nickname());
		user.setUser_phonenumber(user.getUser_phonenumber());
		user.setUser_profile(null);
		user.setUser_profile_size(0);
		user.setUser_self(null);
		user.setUser_enterdate(user.getUser_enterdate());
		user.setUser_final(user.getUser_final());
		user.setUser_role(user.getUser_role());
		user.setUser_option("kakao");
		
		mapper_User.kakaoUserJoin(user);
	}
	
}
