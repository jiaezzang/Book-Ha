package com.bookha.model;

import java.util.ArrayList;

import com.bookha.main.dto.DTOShareBoard;
import com.bookha.main.dto.DTOShareComment;

public class ModelShareCmt {
	public ModelShareCmt() {
		// TODO Auto-generated constructor stub
	}
	
	public String cmtList(ArrayList<DTOShareComment> comment_lists) {
		
		String cmtTable = "";
		for(DTOShareComment cto : comment_lists ) {
			cmtTable += "<label class='list-group-item'>";
			cmtTable += "<h6 style='color: #696CFF; display: inline-block;'>" + cto.getUser_nickname() +"</h6>";
			cmtTable += "&emsp;&emsp;";
			cmtTable += "<a href='#' class='deleteReply' style='color: gray; display: inline-block;'>댓글 삭제</a>";
			cmtTable += "<div style='display: inline-block; visibility: hidden;'>" + cto.getSeq() +"</div>";
			cmtTable += "<p>" + cto.getContent().replaceAll("\n", "<br />") +"</p>";
			cmtTable += "</label>";
			cmtTable += "<br /><br />";
			
		}
		return cmtTable;
	}
	
}
