package com.bookha.main.dto;

import lombok.Data;

@Data
public class DTOAttendance {
	private int at_seq;
	private int at_num;
	private String at_login;
	
	private int cnt;
	private String date;
	private String start;
	private String end;
}