package com.bookha.main.dto;

import lombok.Data;

@Data
public class DTOShareBoard {
	private int seq;
	private int user_num;
	private String subject;
	private String content;
	private String hash_tag;
	private int hit;
	private String wdate;
	private String wgap;
	private String user_nickname;
	private int cmt_cnt;
	private String myprofile;
	private String self;
}