package com.bookha.main.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.bookha.main.dto.DTOReviewBoard;
import com.bookha.main.dto.DTOReviewComment;

@Mapper
@Repository
public interface MapperReview {
	// Board
	ArrayList<DTOReviewBoard> listAll();
	
	ArrayList<DTOReviewBoard> listHashTag(String hashTag);
	
	int countBoard();
	
	DTOReviewBoard view(int seq);
	
	void viewHit(int seq);
	
	int writeOk(DTOReviewBoard to);
	
	DTOReviewBoard modify(DTOReviewBoard to);
	
	int modifyOk(DTOReviewBoard to);
	
	int deleteOk(DTOReviewBoard to);
	
	// comment
	ArrayList<DTOReviewComment> commentList(int board_seq);
	
	int commentWrite(DTOReviewComment to);
	
	int commentDelete(int comment_seq);
}