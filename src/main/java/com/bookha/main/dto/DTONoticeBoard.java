package com.bookha.main.dto;

import lombok.Data;

@Data
public class DTONoticeBoard {
	private int seq;
	private String title;
	private String content;
	private int hit;
	private String wdate;
}