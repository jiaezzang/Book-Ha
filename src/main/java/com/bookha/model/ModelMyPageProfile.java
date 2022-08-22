package com.bookha.model;

import com.bookha.main.dto.DTOUser;


public class ModelMyPageProfile {
	public ModelMyPageProfile() {
		
	}
	
	public String reloadPf(String user_profile) {
		
		StringBuilder sbHtml = new StringBuilder();
		sbHtml.append("<img src='../assets/img/achievements/" + user_profile + "' alt='user-avatar' class='d-block rounded' height='100' width='100' id='uploadedAvatar'>");
		
		sbHtml.append("<div class='button-wrapper'>");
		sbHtml.append("<button type='button' class='btn btn-primary me-2 mb-4' onclick='changePf();'>");
		sbHtml.append("<i class='bx bx-upload d-block d-sm-none'></i> <span class='d-none d-sm-block'>사진 변경</span>");
		sbHtml.append("</button>");
		sbHtml.append("</div>");
		
		return sbHtml.toString();
	}
}
