package com.bookha.main.dto;

import lombok.Data;

@Data
public class DTO_Review_Board {
	private int seq;
	private int user_num;
	private String title;
	private String content;
	private String hash_tag;
	private int hit;
	private String wdate;
	private String book_img_url;
	private String book_info_url;
	private String book_title;
	private String book_author;
	private String book_publisher;
	private String book_summary;
}