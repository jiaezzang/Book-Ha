package com.bookha.main.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bookha.main.dto.DTO_User;


@Mapper
public interface Mapper_User {
	void userJoin(DTO_User user);
	
	void kakaoUserJoin(DTO_User user);
	
	List<Map<String, String>> userSignIn(DTO_User user);
	
	String chkSameId(String string);
	
	String chkSameNickname(String string);
	
	List<Map<String, String>> findUserId(DTO_User user);
	
	List<Map<String, String>> findPw(DTO_User user);
	
	void deleteAccount(DTO_User user);
	
	void updateAccount(DTO_User user);
}
