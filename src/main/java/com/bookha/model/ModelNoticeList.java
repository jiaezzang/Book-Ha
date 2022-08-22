package com.bookha.model;

import java.util.ArrayList;

import com.bookha.main.dto.DTOAdminBoard;

public class ModelNoticeList {
	public ModelNoticeList() {
		// TODO Auto-generated constructor stub
	}
	
	public String NoticeList(ArrayList<DTOAdminBoard> nolists) {
		
		String table = "";
		for( DTOAdminBoard dto : nolists ) {
			table += "<tr>";
			table += "<td>";
			table += "<i class='fab fa-angular fa-lg text-danger me-2'></i>";
			if(dto.getWgap().equals("0")) {
				table+= "<span class='badge bg-info rounded-pill'>New</span>&nbsp;&nbsp;";
			} else {
				table+= "<span class='badge bg-info rounded-pill' style='visibility: hidden;'>New</span>&nbsp;&nbsp;";
			}
			table += "<a href='/notice.do?seq=" + dto.getSeq() + "' style='color: gray'> ";
			table += "<strong>[필독]&nbsp;&nbsp;</strong>" + dto.getSubject() + "</a>";
			table += "</td>";
			table += "<td style='margin: auto; text-align: center;'>" + dto.getUser_nickname() + "</td>";
			table += "<td style='margin: auto; text-align: center;'>" + dto.getWdate() +"</td>";
			table += "</tr>";			
		}
		return table;
	}
}
