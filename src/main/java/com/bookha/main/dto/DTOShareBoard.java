package com.bookha.main.dto;

import lombok.Data;

@Data
public class DTOShareBoard {
	private int seq;
	private int user_num;
	private String title;
	private String content;
	private String hash_tag;
	private int hit;
	private String wdate;
}