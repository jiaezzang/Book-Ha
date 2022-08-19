package com.bookha.main.dao;

import java.util.ArrayList;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookha.main.dto.DTOAlbumBoard;
import com.bookha.main.dto.DTOAttendance;
import com.bookha.main.dto.DTOReviewBoard;
import com.bookha.main.dto.DTOShareBoard;
import com.bookha.main.dto.DTOUser;
import com.bookha.main.mapper.MapperAlbum;
import com.bookha.main.mapper.MapperRanking;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DAORanking implements MapperRanking {

	@Autowired
	private MapperRanking mapper;

	@Override
	public ArrayList<DTOAttendance> countAttendance() {
		// TODO Auto-generated method stub
		return mapper.countAttendance();
	}

	@Override
	public ArrayList<DTOReviewBoard> reviewRanking() {
		// TODO Auto-generated method stub
		return mapper.reviewRanking();
	}

	@Override
	public ArrayList<DTOAlbumBoard> albumRanking() {
		// TODO Auto-generated method stub
		return mapper.albumRanking();
	}

	@Override
	public ArrayList<DTOShareBoard> shareRanking() {
		// TODO Auto-generated method stub
		return mapper.shareRanking();
	}

	@Override
	public DTOUser getProfile(int user_num) {
		// TODO Auto-generated method stub
		
		return mapper.getProfile(user_num);
	}
}