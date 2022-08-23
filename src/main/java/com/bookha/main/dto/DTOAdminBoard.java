package com.bookha.main.dto;

import lombok.Data;

@Data
public class DTOAdminBoard {
	private int seq;
	private int user_num;
	private String subject;
	private String content;
	private String wdate;
	private String wgap;
	private String user_nickname;
	private int rowno;
}