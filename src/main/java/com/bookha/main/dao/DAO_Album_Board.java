package com.bookha.main.dao;

import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookha.main.dto.DTO_Album_Board;
import com.bookha.main.dto.DTO_Album_Total;
import com.bookha.main.mapper.Mapper_Album;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DAO_Album_Board implements Mapper_Album {

	@Autowired
	private Mapper_Album mapper;

	@Override
	public ArrayList<DTO_Album_Board> album_list() {
		return mapper.album_list();
	}

	@Override
	public int album_delete(int al_seq) {
		// TODO Auto-generated method stub
		int flag = mapper.album_delete(al_seq);
		
		return flag;
	}

	@Override
	public int album_modify(DTO_Album_Board dto) {
		// TODO Auto-generated method stub
		int flag = mapper.album_modify(dto);
		
		return flag;
	}

	@Override
	public int album_write(DTO_Album_Board dto) {
		// TODO Auto-generated method stub
		int flag = mapper.album_write(dto);
				
		return flag;
	}
}