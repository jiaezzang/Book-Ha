package com.bookha.model;

import java.util.ArrayList;

import com.bookha.main.dto.DTO_Review_Comment;

public class Model_ReviewCommentList {
	public Model_ReviewCommentList() {
		// TODO Auto-generated constructor stub
	}

	public String getCommentList(ArrayList<DTO_Review_Comment> lists) {
		String model = "";
		
		for(DTO_Review_Comment list : lists) {
			model += "<label class='list-group-item'>";
			model += "<h6 style='color: #696CFF; display: inline-block;'>" + list.getWriter() + "</h6>";
			model += "&emsp;&emsp;";
			model += "<a href='javascript:void(0);' class='deleteReply' style='color: gray; display: inline-block;'>댓글 삭제</a>";
			model += "<div style='display: inline-block; visibility: hidden;'>" + list.getSeq() + "</div>";
			model += "<p>" + list.getContent().replaceAll("\n", "<br />") + "</p>";
			model += "</label>";
		}
		return model;
	}
}