package com.bookha.main.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.bookha.main.dto.DTOShareBoard;
import com.bookha.main.dto.DTOShareComment;
import com.bookha.main.dto.DTOShareTotal;
import com.bookha.main.dto.DTOUser;

@Mapper
@Repository
public interface MapperShare {
	// Board
	ArrayList<DTOShareBoard> list(DTOShareTotal dto);
	
	int countBoard(String hashTag);
	
	DTOShareBoard view(int seq);
	
	void viewHit(int seq);
	
	int writeOk(DTOShareBoard to);
	
	DTOShareBoard modify(DTOShareBoard to);
	
	int modifyOk(DTOShareBoard to);
	
	int deleteOk(DTOShareBoard to);
	
	// comment
	ArrayList<DTOShareComment> commentList(int board_seq);
	
	int commentWrite(DTOShareComment to);
	
	int commentDelete(int comment_seq);
}