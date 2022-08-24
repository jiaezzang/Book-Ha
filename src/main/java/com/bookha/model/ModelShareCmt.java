package com.bookha.model;

import java.util.ArrayList;

import com.bookha.main.dto.DTOShareBoard;
import com.bookha.main.dto.DTOShareComment;

public class ModelShareCmt {
	public ModelShareCmt() {
		// TODO Auto-generated constructor stub
	}
	
	public String cmtList(ArrayList<DTOShareComment> comment_lists, int session_user_num, String user_role) {
		
		String cmtTable = "";
		for(DTOShareComment cto : comment_lists ) {
			cmtTable += "<label class='list-group-item'>";
			cmtTable += "<h6 style='color: #696CFF; display: inline-block;'>" + cto.getNickname() +"</h6>";
			cmtTable += "&emsp;&emsp;";
			if(cto.getUser_num() == session_user_num) {
				cmtTable += "<a href='javascript:void(0);' class='deleteReply' style='color: gray; display: inline-block;'>댓글 삭제</a>";
			} else if( user_role.equals("admin")) {
				cmtTable += "<a href='javascript:void(0);' class='deleteReply' style='color: gray; display: inline-block;'>댓글 삭제</a>";
			}
			cmtTable += "<div style='display: inline-block; visibility: hidden;'>" + cto.getSeq() +"</div>";
			cmtTable += "<p>" + cto.getContent().replaceAll("\n", "<br />") +"</p>";
			cmtTable += "</label>";
			
		}
		return cmtTable;
	}

}
