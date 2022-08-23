package com.bookha.main.dto;

import lombok.Data;

@Data
public class DTOAlbumBoard {
	private int al_seq;
	private int al_user_num;
	private String al_subject;
	private String al_wdate;
	private String al_imgName;
	private String user_name;
	private String user_nickname;
	private String user_role;
}