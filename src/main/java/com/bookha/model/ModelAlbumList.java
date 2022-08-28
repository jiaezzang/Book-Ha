package com.bookha.model;

import java.util.ArrayList;

import com.bookha.main.dto.DTOAlbumBoard;

public class ModelAlbumList {
	public ModelAlbumList() {
		
	}
	
	public String getAlbumList(ArrayList<DTOAlbumBoard> lists, int session_user_num, int adminNum) {
		StringBuilder sbHtml = new StringBuilder();
		for( DTOAlbumBoard dto : lists){
			sbHtml.append("<div class='col'>");
			sbHtml.append("<div class='card h-100'>");
			sbHtml.append("<img class='card-img-top'");
			sbHtml.append("src='http://localhost:8080/images/" + dto.getAl_imgName() +"' alt='Card image cap'>");
			sbHtml.append("<div class='card-body'>");
			
			sbHtml.append("<div style='display: inline-block; width: 100%;'>");
			sbHtml.append("<div class='album-title' style='display:inline-block;'>");
			sbHtml.append("<h5 class='card-title'>"+ dto.getAl_subject() +"</h5> ");
			sbHtml.append("</div>");
			
			//Dropdown Button
			if(dto.getAl_user_num() == session_user_num || session_user_num == adminNum ) {
				sbHtml.append("<div class='btn-group'");
				sbHtml.append("style='display: inline-block; float: right;'>");
				sbHtml.append("<button type='button'");
				sbHtml.append("class='btn btn-outline-secondary btn-icon rounded-pill dropdown-toggle hide-arrow'");
				sbHtml.append("data-bs-toggle='dropdown' aria-expanded='false'>");
				sbHtml.append("<i class='bx bx-dots-vertical-rounded'></i>");
				sbHtml.append("</button>");
				sbHtml.append("<ul class='dropdown-menu dropdown-menu-right'");
				sbHtml.append("style='position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(0px, -40.8px, 0px);'");
				sbHtml.append("data-popper-placement='top-start'>");
				sbHtml.append("<li><a class='dropdown-item'");
				sbHtml.append("href='javascript:void(0);' data-bs-toggle='modal'");
				sbHtml.append("data-bs-target='#modalCenter1' onclick='modifyData(" + dto.getAl_seq() + ", \"" + dto.getAl_subject()+ "\")'>수정</a></li>");
				sbHtml.append("<li><a class='dropdown-item'");
				sbHtml.append("href='javascript:void(0);' data-bs-toggle='modal'");
				sbHtml.append("data-bs-target='#modalCenter2' onclick='deleteData(" + dto.getAl_seq() + ")'>삭제</a></li>");
				sbHtml.append("</ul>");
				sbHtml.append("</div>");
			}

			sbHtml.append("</div>");
			sbHtml.append("<br /><br />");

			sbHtml.append("<div id='textInfo'>");
			sbHtml.append("<h6 style='text-align: right;'>" + dto.getUser_name() + "</h6>");
			sbHtml.append("<h6 style='text-align: right;'>" + dto.getAl_wdate() + "</h6>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
		}
		
		return sbHtml.toString();
	}
	
	public String myAlbumList(ArrayList<DTOAlbumBoard> myalbumLists) {
		StringBuilder sbHtml = new StringBuilder();
		for( DTOAlbumBoard dto : myalbumLists){
			sbHtml.append("<div class='col'>");
			sbHtml.append("<div class='card h-100'>");
			sbHtml.append("<img class='card-img-top'");
			sbHtml.append("src='http://localhost:8080/images/" + dto.getAl_imgName() +"' alt='Card image cap'>");
			sbHtml.append("<div class='card-body'>");
			
			sbHtml.append("<div style='display: inline-block; width: 100%;'>");
			sbHtml.append("<div class='album-title' style='display:inline-block;'>");
			sbHtml.append("<h5 class='card-title'>"+ dto.getAl_subject() +"</h5> ");
			sbHtml.append("</div>");
			sbHtml.append("<div class='btn-group'");
			sbHtml.append("style='display: inline-block; float: right;'>");
			sbHtml.append("<button type='button'");
			sbHtml.append("class='btn btn-outline-secondary btn-icon rounded-pill dropdown-toggle hide-arrow'");
			sbHtml.append("data-bs-toggle='dropdown' aria-expanded='false'>");
			sbHtml.append("<i class='bx bx-dots-vertical-rounded'></i>");
			sbHtml.append("</button>");
			sbHtml.append("<ul class='dropdown-menu dropdown-menu-right'");
			sbHtml.append("style='position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(0px, -40.8px, 0px);'");
			sbHtml.append("data-popper-placement='top-start'>");
			sbHtml.append("<li><a class='dropdown-item'");
			sbHtml.append("href='javascript:void(0);' data-bs-toggle='modal'");
			sbHtml.append("data-bs-target='#modalCenter1' onclick='modifyData(" + dto.getAl_seq() + ", \"" + dto.getAl_subject()+ "\")'>수정</a></li>");
			sbHtml.append("<li><a class='dropdown-item'");
			sbHtml.append("href='javascript:void(0);' data-bs-toggle='modal'");
			sbHtml.append("data-bs-target='#modalCenter2' onclick='deleteData(" + dto.getAl_seq() + ")'>삭제</a></li>");
			sbHtml.append("</ul>");
			sbHtml.append("</div>");
			
			sbHtml.append("</div>");
			sbHtml.append("<br /><br />");

			sbHtml.append("<div id='textInfo'>");
			sbHtml.append("<h6 style='text-align: right;'>" + dto.getUser_name() + "</h6>");
			sbHtml.append("<h6 style='text-align: right;'>" + dto.getAl_wdate() + "</h6>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
		}
		
		return sbHtml.toString();
	}
}
