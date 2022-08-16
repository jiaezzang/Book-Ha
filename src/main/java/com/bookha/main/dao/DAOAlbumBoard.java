package com.bookha.main.dao;

import java.util.ArrayList;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookha.main.dto.DTOAlbumBoard;
import com.bookha.main.mapper.MapperAlbum;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DAOAlbumBoard implements MapperAlbum {

	@Autowired
	private MapperAlbum mapper;

	@Override
	public ArrayList<DTOAlbumBoard> albumList() {
		return mapper.albumList();
	}
	
	@Override
	public int albumWrite(DTOAlbumBoard dto) {
		// TODO Auto-generated method stub
		int flag = mapper.albumWrite(dto);
				
		return flag;
	}

	@Override
	public int albumDelete(int al_seq) {
		// TODO Auto-generated method stub
		int flag = mapper.albumDelete(al_seq);
		
		return flag;
	}

	@Override
	public int albumModify(DTOAlbumBoard dto) {
		// TODO Auto-generated method stub
		int flag = mapper.albumModify(dto);
		
		return flag;
	}

}