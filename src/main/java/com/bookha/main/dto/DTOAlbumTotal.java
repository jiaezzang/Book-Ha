package com.bookha.main.dto;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DTOAlbumTotal {
	private int cpage; //현재 페이지
	private int recordPerPage;  //보여질 게시글 수 
	private int blockPerPage; //보여질 블록 수 
	private int totalPage; //총 페이지 수
	private int totalRecord;//총 게시글 수 
	private int startBlock; //시작 블록
	private int endBlock; //마지막 블록
	
	private ArrayList<DTOAlbumBoard> board;
	
	public DTOAlbumTotal() {
		// TODO Auto-generated constructor stub
		this.cpage = 1;
		this.recordPerPage = 12;
		this.blockPerPage = 5;
		this.totalPage = 1;
		this.totalRecord = 0;
	}
}