package com.bookha.main.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookha.main.dto.DTOAlbumBoard;
import com.bookha.main.dto.DTOAlbumTotal;
import com.bookha.main.dto.DTOAttendance;
import com.bookha.main.dto.DTOReviewBoard;
import com.bookha.main.dto.DTOReviewTotal;
import com.bookha.main.dto.DTOShareBoard;
import com.bookha.main.dto.DTOShareTotal;
import com.bookha.main.dto.DTOUser;
import com.bookha.main.mapper.MapperMyBoard;
import com.bookha.main.mapper.MapperMyPage;


import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DAOMyBoard implements MapperMyBoard {
	
	@Autowired
	private MapperMyBoard mapper;
	
	@Override
	public ArrayList<DTOShareBoard> myshareList(DTOShareTotal sto) {
		// TODO Auto-generated method stub
		return mapper.myshareList(sto);
	}

	@Override
	public int countMyshare(String hashTag) {
		// TODO Auto-generated method stub
		return mapper.countMyshare(hashTag);
	}

	@Override
	public ArrayList<DTOReviewBoard> myreviewList(DTOReviewTotal rto) {
		// TODO Auto-generated method stub
		return mapper.myreviewList(rto);
	}

	@Override
	public int countMyreview(String hashTag) {
		// TODO Auto-generated method stub
		return mapper.countMyreview(hashTag);
	}

	@Override
	public ArrayList<DTOAlbumBoard> myalbumList(DTOAlbumTotal ato) {
		// TODO Auto-generated method stub
		return mapper.myalbumList(ato);
	}

	@Override
	public int countMyalbum() {
		// TODO Auto-generated method stub
		return mapper.countMyalbum();
	}

}
