package com.bookha.main.dto;

import lombok.Data;

@Data
public class DTOShareComment {
	private int seq;
	private int user_num;
	private String content;
	private String wdate;
	private int board_seq;
	private String nickname;
}