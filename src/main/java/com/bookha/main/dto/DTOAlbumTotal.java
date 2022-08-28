package com.bookha.main.dto;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DTOAlbumTotal {
	// 현재 페이지
	private int cpage;
	// 보여질 데이터 갯수
	private int recordPerPage;
	// 보여질 블록 수
	private int blockPerPage;
	// 전체 페이지 수
	private int totalPage;
	// 전체 게시글 수
	private int totalRecord;
	// 시작페이지
	private int startBlock;
	// 끝 페이지
	private int endBlock;
	
	// 검색용 Hash tag
	private String hash_tag;
	
	// skip
	private int skip;
	
	private int al_user_num;
	
	public DTOAlbumTotal() {
		// TODO Auto-generated constructor stub
		
		// 현재 페이지 : default = 1
		this.cpage = 1;
		// 보여질 데이터 갯수
		this.recordPerPage = 12;
		// 보여질 블록 수 : max = 5
		this.blockPerPage = 5;
		// 전체 페이지 수 : default = 1
		this.totalPage = 1;
		// 전체 게시글 수
		this.totalRecord = 0;
		
		// cpage
		//인자값으로 to 외부에서 전달받음
		
		// skip(시작번호) 수식
		//skip = (cpage - 1) * recordPerPage;
		
		// totalPage 수식
		//totalPage = ((totalRecord - 1) / recordPerPage) + 1;
		
		// startBlock 수식
		//startBlock = (((cpage - 1) / blockPerPage) * blockPerPage) + 1;
		
		// endBlock 수식
		//endBlock = (((cpage - 1) / blockPerPage) * blockPerPage) + blockPerPage;
	}
}