package com.bookha.main.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.bookha.main.dto.DTOAlbumBoard;
import com.bookha.main.dto.DTOAttendance;
import com.bookha.main.dto.DTOReviewBoard;
import com.bookha.main.dto.DTOShareBoard;
import com.bookha.main.dto.DTOUser;

@Mapper
@Repository
public interface MapperRanking {
	
	ArrayList<DTOAttendance> countAttendance();
	
	ArrayList<DTOReviewBoard> reviewRanking();
	
	ArrayList<DTOAlbumBoard> albumRanking();
	
	ArrayList<DTOShareBoard> shareRanking();
	
	DTOUser getProfile(int user_num);

}
	