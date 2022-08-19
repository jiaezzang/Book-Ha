package com.bookha.main.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookha.main.dto.DTOShareBoard;
import com.bookha.main.dto.DTOShareComment;
import com.bookha.main.dto.DTOShareTotal;
import com.bookha.main.mapper.MapperShare;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DAOShareBoard implements MapperShare {
	
	@Autowired
	private MapperShare mapper;

	@Override
	public ArrayList<DTOShareBoard> list(DTOShareTotal dto) {
		// TODO Auto-generated method stub
		return mapper.list(dto);
	}
	
	@Override
	public int countBoard(String hashTag) {
		// TODO Auto-generated method stub
		return mapper.countBoard(hashTag);
	}
	
	@Override
	public DTOShareBoard view(int seq) {
		// TODO Auto-generated method stub
		return mapper.view(seq);
	}
	
	@Override
	public void viewHit(int seq) {
		// TODO Auto-generated method stub
		mapper.viewHit(seq);
	}
	
	@Override
	public int writeOk(DTOShareBoard to) {
		// TODO Auto-generated method stub
		int flag = 1;
		int result = mapper.writeOk(to); 
		if(result == 1) {
			flag = 0;
		}
		return flag;
	}

	@Override
	public DTOShareBoard modify(DTOShareBoard to) {
		// TODO Auto-generated method stub
		return mapper.modify(to);
	}

	@Override
	public int modifyOk(DTOShareBoard to) {
		// TODO Auto-generated method stub
		int flag = 1;
		int result = mapper.modifyOk(to); 
		if(result == 1) {
			flag = 0;
		}
		return flag;
	}

	@Override
	public int deleteOk(DTOShareBoard to) {
		// TODO Auto-generated method stub
		int flag = 1;
		int result = mapper.deleteOk(to); 
		if(result == 1) {
			flag = 0;
		}
		return flag;
	}

	@Override
	public ArrayList<DTOShareComment> commentList(int board_seq) {
		// TODO Auto-generated method stub
		return mapper.commentList(board_seq);
	}

	@Override
	public int commentWrite(DTOShareComment to) {
		// TODO Auto-generated method stub
		return mapper.commentWrite(to);
	}

	@Override
	public int commentDelete(int comment_seq) {
		// TODO Auto-generated method stub
		return mapper.commentDelete(comment_seq);
	}

}
