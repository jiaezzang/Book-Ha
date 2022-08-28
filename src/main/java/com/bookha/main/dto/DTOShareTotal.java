package com.bookha.main.dto;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DTOShareTotal {
	private int cpage;
	private int recordPerPage;
	private int blockPerPage;
	private int totalPage;
	private int totalRecord;
	private int startBlock;
	private int endBlock;
	
	private String hash_tag;
	private String searchSubject;
	
	private int skip;
	
	private ArrayList<DTOShareBoard> board;
	private ArrayList<DTOShareComment> comment;
	
	private int user_num;
	
	public DTOShareTotal() {
		// TODO Auto-generated constructor stub
		this.cpage = 1;
		this.recordPerPage = 10;
		this.blockPerPage = 5;
		this.totalPage = 1;
		this.totalRecord = 0;
		
		this.searchSubject = "";
	}
}