package com.bookha.main.dao;

import java.util.ArrayList;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookha.main.dto.DTO_Album_Board;
import com.bookha.main.dto.DTO_Review_Board;
import com.bookha.main.dto.DTO_Share_Board;
import com.bookha.main.dto.DTO_User;
import com.bookha.main.mapper.Mapper_Album;
import com.bookha.main.mapper.Mapper_Ranking;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DAO_Ranking implements Mapper_Ranking {

	@Autowired
	private Mapper_Ranking mapper;
	
	@Override
	public int check_attendance(int user_num) {
		// TODO Auto-generated method stub
		int flag = mapper.check_attendance(user_num);
		
		return flag;
	}

	@Override
	public int add_attendance(int user_num) {
		// TODO Auto-generated method stub
		int flag = mapper.add_attendance(user_num);
		
		return flag;
	}

	@Override
	public ArrayList<DTO_Review_Board> review_ranking() {
		// TODO Auto-generated method stub
		return mapper.review_ranking();
	}

	@Override
	public ArrayList<DTO_Album_Board> album_ranking() {
		// TODO Auto-generated method stub
		return mapper.album_ranking();
	}

	@Override
	public ArrayList<DTO_Share_Board> share_ranking() {
		// TODO Auto-generated method stub
		return mapper.share_ranking();
	}

	@Override
	public DTO_User get_profile(int user_num) {
		// TODO Auto-generated method stub
		
		return mapper.get_profile(user_num);
	}
}