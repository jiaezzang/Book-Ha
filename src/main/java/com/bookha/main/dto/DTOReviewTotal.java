package com.bookha.main.dto;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DTOReviewTotal {
	// 현재 페이지
	private int cpage;
	private int recordPerPage;
	private int blockPerPage;
	// 총 페이지
	private int totalPage;
	// 
	private int totalRecord;
	// 시작페이지
	private int startBlock;
	// 끝 페이지
	private int endBlock;
	
	private ArrayList<DTOReviewBoard> board;
	private ArrayList<DTOReviewComment> comment;
	
	public DTOReviewTotal() {
		// TODO Auto-generated constructor stub
		this.cpage = 1;
		this.recordPerPage = 10;
		this.blockPerPage = 5;
		this.totalPage = 1;
		this.totalRecord = 0;
	}
}