package com.bookha.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.bookha.main.dto.DTOAttendance;

public class ModelCalendar {
	public ModelCalendar() {
		
	}
	
	public String ModelCheckAt(ArrayList<DTOAttendance> lists) {
		
		StringBuilder sbHtml = new StringBuilder();
		
		for(DTOAttendance dto : lists){
		sbHtml.append("{");
		sbHtml.append("start : '" + dto.getAt_login() + "',");
		sbHtml.append("image_url : '../assets/img/stamps/stamp.png'");
		sbHtml.append("}, ");
		}
		
		
		return sbHtml.toString().replaceAll(",$", "");
	}
}
