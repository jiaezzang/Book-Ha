package com.bookha.main.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookha.main.dto.DTOReviewBoard;
import com.bookha.main.dto.DTOReviewComment;
import com.bookha.main.mapper.MapperReview;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DAOReviewBoard implements MapperReview {

	@Autowired
	private MapperReview mapper;

	@Override
	public ArrayList<DTOReviewBoard> listAll() {
		return mapper.listAll();
	}
	
	@Override
	public ArrayList<DTOReviewBoard> listHashTag(String hashTag) {
		return mapper.listHashTag(hashTag);
	}
	
	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return mapper.countBoard();
	}

	@Override
	public DTOReviewBoard view(int seq) {
		return mapper.view(seq);
	}
	
	@Override
	public void viewHit(int seq) {
		// TODO Auto-generated method stub
		mapper.viewHit(seq);
	}

	@Override
	public int writeOk(DTOReviewBoard to) {
		int flag = 1;
		int result = mapper.writeOk(to); 
		if(result == 1) {
			flag = 0;
		}
		return flag;
	}

	@Override
	public DTOReviewBoard modify(DTOReviewBoard to) {
		// TODO Auto-generated method stub
		return mapper.modify(to);
	}

	@Override
	public int modifyOk(DTOReviewBoard to) {
		// TODO Auto-generated method stub
		return mapper.modifyOk(to);
	}

	@Override
	public int deleteOk(DTOReviewBoard to) {
		// TODO Auto-generated method stub
		
		int flag = 1;
		int result = mapper.deleteOk(to); 
		if(result == 1) {
			flag = 0;
		}
		return flag;
	}

	@Override
	public ArrayList<DTOReviewComment> commentList(int board_seq) {
		// TODO Auto-generated method stub
		return mapper.commentList(board_seq);
	}

	@Override
	public int commentWrite(DTOReviewComment to) {
		// TODO Auto-generated method stub
		return mapper.commentWrite(to);
	}

	@Override
	public int commentDelete(int comment_seq) {
		// TODO Auto-generated method stub
		return mapper.commentDelete(comment_seq);
	}
}