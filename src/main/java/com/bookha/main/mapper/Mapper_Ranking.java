package com.bookha.main.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.bookha.main.dto.DTO_Album_Board;
import com.bookha.main.dto.DTO_Attendance;
import com.bookha.main.dto.DTO_Review_Board;
import com.bookha.main.dto.DTO_Share_Board;
import com.bookha.main.dto.DTO_User;

@Mapper
@Repository
public interface Mapper_Ranking {
	// Board
	int check_attendance(int user_num);
	
	int add_attendance(int user_num);
	
	ArrayList<DTO_Attendance> count_attendance();
	
	ArrayList<DTO_Review_Board> review_ranking();
	
	ArrayList<DTO_Album_Board> album_ranking();
	
	ArrayList<DTO_Share_Board> share_ranking();
	
	DTO_User get_profile(int user_num);

}
	