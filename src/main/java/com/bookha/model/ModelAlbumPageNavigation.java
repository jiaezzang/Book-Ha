package com.bookha.model;

import com.bookha.main.dto.DTOAlbumTotal;

public class ModelAlbumPageNavigation {
	public ModelAlbumPageNavigation() {
		// TODO Auto-generated constructor stub
	}
	
	public String getPageNav(DTOAlbumTotal dto) {
		String model = "";
		
		// 네비게이션 시작태그
		model += "<nav aria-label='Page navigation'>";
		model += "<ul class='pagination'>";
		
		// 네비게이션 이전페이지 화살표
		model += "<li class='page-item first'>";
		model += "<a class='page-link' href='/album_list.do?cpage=1";
		model += "'>";
		model += "<i class='tf-icon bx bx-chevrons-left'></i></a></li>";
		model += "<li class='page-item prev'>";
		if(dto.getStartBlock() != 1) {
			model += "<a class='page-link' href='/album_list.do";
			model += "?cpage=" + (dto.getStartBlock() - 5);
			model += "'>";
		} else {
			model += "<a class='page-link' href='javascript:void(0);";
			model += "'>";
		}
		model += "<i class='tf-icon bx bx-chevron-left'></i></a></li>";
		
		// 네비게이션 번호
		for(int i=dto.getStartBlock(); i<=dto.getEndBlock(); i++) {
			model += "<li class='page-item ";
			if(dto.getCpage() == i) {
				model += "active";
			}
			model += "'>";
			model += "<a class='page-link' href='/album_list.do";
			model += "?cpage=" + i;
			model += "'>" + i + "</a></li>";
		}
		
		// 네비게이션 다음페이지 화살표
		model += "<li class='page-item next'>";
		if(dto.getTotalPage() != dto.getEndBlock()) {
			model += "<a class='page-link' href='/album_list.do";
			model += "?cpage=" + (dto.getEndBlock() + 1);
			model += "'>";
		} else {
			model += "<a class='page-link' href='javascript:void(0);";
			model += "'>";
		}
		model += "<i class='tf-icon bx bx-chevron-right'></i></a></li>";
		model += "<li class='page-item last'>";
		model += "<a class='page-link' href='/album_list.do";
		model += "?cpage=" + dto.getTotalPage();
		model += "'>";
		model += "<i class='tf-icon bx bx-chevrons-right'></i></a></li>";
		
		// 네비게이션 종료태그
		model += "</ul>";
		model += "</nav>";
		
		return model;
	}
	
	public String myPageNav(DTOAlbumTotal dto) {
		String model = "";
		
		// 네비게이션 시작태그
		model += "<nav aria-label='Page navigation'>";
		model += "<ul class='pagination'>";
		
		// 네비게이션 이전페이지 화살표
		model += "<li class='page-item first'>";
		model += "<a class='page-link' href='/myalbum_list.do?cpage=1";
		model += "'>";
		model += "<i class='tf-icon bx bx-chevrons-left'></i></a></li>";
		model += "<li class='page-item prev'>";
		if(dto.getStartBlock() != 1) {
			model += "<a class='page-link' href='/myalbum_list.do";
			model += "?cpage=" + (dto.getStartBlock() - 5);
			model += "'>";
		} else {
			model += "<a class='page-link' href='javascript:void(0);";
			model += "'>";
		}
		model += "<i class='tf-icon bx bx-chevron-left'></i></a></li>";
		
		// 네비게이션 번호
		for(int i=dto.getStartBlock(); i<=dto.getEndBlock(); i++) {
			model += "<li class='page-item ";
			if(dto.getCpage() == i) {
				model += "active";
			}
			model += "'>";
			model += "<a class='page-link' href='/myalbum_list.do";
			model += "?cpage=" + i;
			model += "'>" + i + "</a></li>";
		}
		
		// 네비게이션 다음페이지 화살표
		model += "<li class='page-item next'>";
		if(dto.getTotalPage() != dto.getEndBlock()) {
			model += "<a class='page-link' href='/myalbum_list.do";
			model += "?cpage=" + (dto.getEndBlock() + 1);
			model += "'>";
		} else {
			model += "<a class='page-link' href='javascript:void(0);";
			model += "'>";
		}
		model += "<i class='tf-icon bx bx-chevron-right'></i></a></li>";
		model += "<li class='page-item last'>";
		model += "<a class='page-link' href='/myalbum_list.do";
		model += "?cpage=" + dto.getTotalPage();
		model += "'>";
		model += "<i class='tf-icon bx bx-chevrons-right'></i></a></li>";
		
		// 네비게이션 종료태그
		model += "</ul>";
		model += "</nav>";
		
		return model;
	}
}