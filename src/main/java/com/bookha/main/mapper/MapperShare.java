package com.bookha.main.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.bookha.main.dto.DTOShareBoard;
import com.bookha.main.dto.DTOShareComment;

@Mapper
@Repository
public interface MapperShare {
	// Board
	ArrayList<DTOShareBoard> listAll();
	
	ArrayList<DTOShareBoard> listHashTag(String hash_tag);
	
	void viewHit(int seq);
	
	DTOShareBoard view(int seq);
	
	int writeOk(DTOShareBoard to);
	
	DTOShareBoard modify(DTOShareBoard to);
	
	int modifyOk(DTOShareBoard to);
	
	int deleteOk(DTOShareBoard to);
	
	// comment
	ArrayList<DTOShareComment> commentList(int board_seq);
	
	int commentWriteOk(DTOShareComment to);
	
	int commentDeleteOk(int seq);
}