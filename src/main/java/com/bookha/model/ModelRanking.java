package com.bookha.model;

import java.util.ArrayList;

import com.bookha.main.dto.DTOUser;

public class ModelRanking {
	public ModelRanking() {
		
	}
	
	public String getRankingList(String title, ArrayList<DTOUser> lists) {
		
		StringBuilder sbHtml = new StringBuilder();
		sbHtml.append("<div class='card h-100'>");
		sbHtml.append("<div class='card-body' style='height:220px; display:flex; justify-content:space-around; align-items:center;'>");
		sbHtml.append("<div class='rankingtitle' style='display:inline-block;' >");
		sbHtml.append("<h5>" + title + "</h5>");
		sbHtml.append("</div>");
		
		int index = 0;
		for( DTOUser dto : lists){
			index ++;
			
			sbHtml.append("<div class='mt-3 first' style='display:inline-block; text-align:center;' >");
			sbHtml.append("<div>");
			sbHtml.append("<img class='mb-sm-0 mb-2 h-auto' src='../assets/img/achievements/" + dto.getUser_profile() + "' style='width:110px;'/>");
			sbHtml.append("</div>");
			sbHtml.append("<div>");
			sbHtml.append("<img class='medal' src='../assets/img/icons/medals/");
			if(index == 1) {
				sbHtml.append("gold");
			} else if(index == 2) {
				sbHtml.append("silver");
			} else if(index == 3) {
				sbHtml.append("bronze");
			}
			sbHtml.append(".png' style='width:90px'/>");
			sbHtml.append("</div>");
			sbHtml.append("<div>");
			sbHtml.append("<p>" + dto.getUser_nickname() + "</p>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
		}
		sbHtml.append("</div>");
		sbHtml.append("</div><br />");
		
		return sbHtml.toString();
	}
	
	
}
