package com.bookha.main.dto;

import lombok.Data;

@Data
public class DTO_Album_Board {
	private int seq;
	private int user_num;
	private String title;
	private String wdate;
	private String imgName;
	private int imgSize;
	private int hit;
}