package com.bookha.main.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.bookha.main.dto.DTOAttendance;
import com.bookha.main.dto.DTOUser;

@Mapper
@Repository
public interface MapperMyPage {
	// Board
	String checkAttendance(int user_num);
	
	int addAttendance(int user_num);
	
	String addStamp();
	
	ArrayList<DTOAttendance> listAt(int user_num);
	
	int countAttendance(int user_num);
	
	int countReview(int user_num);
	
	int countAlbum(int user_num);
	
	int countShare(int user_num);
	
	int checkPw(DTOUser dto);
	
	int changePf(DTOUser dto);
	
	String reloadPf(int user_num);
	
}
	