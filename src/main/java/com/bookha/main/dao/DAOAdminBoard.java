package com.bookha.main.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookha.main.dto.DTOAdminBoard;
import com.bookha.main.dto.DTOAdminTotal;
import com.bookha.main.mapper.MapperAdmin;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DAOAdminBoard implements MapperAdmin {

	@Autowired
	private MapperAdmin mapper;
	
	@Override
	public ArrayList<DTOAdminBoard> list(DTOAdminTotal dto) {
		// TODO Auto-generated method stub
		return mapper.list(dto);
	}
	
	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return mapper.countBoard();
	}

	@Override
	public DTOAdminBoard view(int seq) {
		// TODO Auto-generated method stub
		return mapper.view(seq);
	}
	
	@Override
	public DTOAdminBoard viewBefore(int seq) {
		// TODO Auto-generated method stub
		return mapper.viewBefore(seq);
	}

	@Override
	public DTOAdminBoard viewAfter(int seq) {
		// TODO Auto-generated method stub
		return mapper.viewAfter(seq);
	}

	@Override
	public int writeOk(DTOAdminBoard to) {
		// TODO Auto-generated method stub
		int flag = 1;
		int result = mapper.writeOk(to); 
		if(result == 1) {
			flag = 0;
		}
		return flag;
	}

	@Override
	public DTOAdminBoard modify(DTOAdminBoard to) {
		// TODO Auto-generated method stub
		return mapper.modify(to);
	}

	@Override
	public int modifyOk(DTOAdminBoard to) {
		// TODO Auto-generated method stub
		int flag = 1;
		int result = mapper.modifyOk(to); 
		if(result == 1) {
			flag = 0;
		}
		return flag;
	}

	@Override
	public int deleteOk(DTOAdminBoard to) {
		// TODO Auto-generated method stub
		int flag = 1;
		int result = mapper.deleteOk(to); 
		if(result == 1) {
			flag = 0;
		}
		return flag;
	}

}
