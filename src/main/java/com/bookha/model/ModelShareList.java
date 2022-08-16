package com.bookha.model;

import java.util.ArrayList;

import com.bookha.main.dto.DTOShareBoard;
import com.bookha.main.dto.DTOShareComment;

public class ModelShareList {
	public ModelShareList() {
		// TODO Auto-generated constructor stub
	}
	
	public String ShareList(ArrayList<DTOShareBoard> lists) {
		
		String table = "";
		for( DTOShareBoard dto : lists ) {
			table += "<tr>";
			table += "<td>";
			table += "<i class='fab fa-angular fa-lg text-danger me-2'></i>";
			table += "<a href='./share_view.do?seq=" + dto.getSeq() + "' style='color: gray'> <strong>[공유하기]&nbsp;&nbsp;</strong>" + dto.getSubject() +" </a>";
			table += "<span class='badge rounded-pill badge-center h-px-20 w-px-20 bg-danger'>" + dto.getCmt_cnt() + "</span>";
			if(dto.getWgap().equals("0")) {
				table += "&nbsp;&nbsp;<span class='badge bg-info rounded-pill'>New</span>";
			}
			table += "</td>";
			table+= "<td style='margin: auto; text-align: center;'>";
			table+= "<button type='button' class='btn rounded-pill btn-outline-primary' disabled=''>" + dto.getHash_tag() + "</button>";
			table+= "</td>";
			table += "<td style='margin: auto; text-align: center;'>" + dto.getUser_nickname() + "</td>";
			table += "<td style='margin: auto; text-align: center;'>" + dto.getWdate() + "</td>";
			table += "<td style='margin: auto; text-align: center;'>&nbsp;&nbsp;" + dto.getHit() + "</td>";
			table += "</tr>";
			
		}
		return table;
	}
	
}
