package com.bookha.main.dto;

import lombok.Data;

@Data
public class DTOReviewBoard {
	private int seq;
	private String subject;
	private int user_num;
	private String content;
	private String hash_tag;
	private int hit;
	private String wdate;
	private String wgap;
	private String book_img_url;
	private String book_info_url;
	private String book_title;
	private String book_author;
	private String book_publisher;
	private String book_summary;
	private String user_name;
	private int cmt_cnt;
}