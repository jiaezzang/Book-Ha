package com.bookha.model;

import com.bookha.main.dto.DTOShareTotal;

public class ModelSharePageNavigation {
	public ModelSharePageNavigation() {
		// TODO Auto-generated constructor stub
	}
	
	public String getPageNav(DTOShareTotal dto) {
		String model = "";
		String hashTag = dto.getHash_tag().replaceAll("#", "%23");
		String searchSubject = dto.getSearchSubject();
		
		// 시작태그
		model += "<nav aria-label='Page navigation'>";
		model += "<ul class='pagination'>";
		
		// 이전페이지
		// 네비게이션 이전페이지 화살표
		model += "<li class='page-item first'>";
		model += "<a class='page-link' href='/share_list.do?cpage=1";
		model += "&hashtag=" + hashTag;
		model += "&searchSubject=" + searchSubject;
		model += "'>";
		model += "<i class='tf-icon bx bx-chevrons-left'></i></a></li>";
		model += "<li class='page-item prev'>";
		if(dto.getStartBlock() != 1) {
			model += "<a class='page-link' href='/share_list.do";
			model += "?cpage=" + (dto.getStartBlock() - 5);
			model += "&hashtag=" + hashTag;
			model += "&searchSubject=" + searchSubject;
			model += "'>";
		} else {
			model += "<a class='page-link' href='javascript:void(0);";
			model += "'>";
		}
		model += "<i class='tf-icon bx bx-chevron-left'></i></a></li>";
		
		// 페이지 번호
		for(int i=dto.getStartBlock(); i<=dto.getEndBlock(); i++) {
			model += "<li class='page-item ";
			if(dto.getCpage() == i) {
				model += "active";
			}
			model += "'>";
			model += "<a class='page-link' href='/share_list.do";
			model += "?cpage=" + i;
			model += "&hashtag=" + hashTag;
			model += "&searchSubject=" + searchSubject;
			model += "'>" + i + "</a></li>";
		}
		
		// 다음페이지
		model += "<li class='page-item next'>";
		if(dto.getTotalPage() != dto.getEndBlock()) {
			model += "<a class='page-link' href='/share_list.do";
			model += "?cpage=" + (dto.getEndBlock() + 1);
			model += "&hashtag=" + hashTag;
			model += "&searchSubject=" + searchSubject;
			model += "'>";
		} else {
			model += "<a class='page-link' href='javascript:void(0);";
			model += "'>";
		}
		model += "<i class='tf-icon bx bx-chevron-right'></i></a></li>";
		model += "<li class='page-item last'>";
		model += "<a class='page-link' href='/share_list.do";
		model += "?cpage=" + dto.getTotalPage();
		model += "&hashtag=" + hashTag;
		model += "&searchSubject=" + searchSubject;
		model += "'>";
		model += "<i class='tf-icon bx bx-chevrons-right'></i></a></li>";
		
		// 종료
		model += "</ul>";
		model += "</nav>";
		
		return model;
	}
	
	public String myPageNav(DTOShareTotal dto) {
		String model = "";
		String hashTag = dto.getHash_tag().replaceAll("#", "%23");
		String searchSubject = dto.getSearchSubject();
		
		// 시작태그
		model += "<nav aria-label='Page navigation'>";
		model += "<ul class='pagination'>";
		
		// 이전페이지
		// 네비게이션 이전페이지 화살표
		model += "<li class='page-item first'>";
		model += "<a class='page-link' href='/myshare_list.do?cpage=1";
		model += "&hashtag=" + hashTag;
		model += "'>";
		model += "<i class='tf-icon bx bx-chevrons-left'></i></a></li>";
		model += "<li class='page-item prev'>";
		if(dto.getStartBlock() != 1) {
			model += "<a class='page-link' href='/myshare_list.do";
			model += "?cpage=" + (dto.getStartBlock() - 5);
			model += "&hashtag=" + hashTag;
			model += "'>";
		} else {
			model += "<a class='page-link' href='javascript:void(0);";
			model += "'>";
		}
		model += "<i class='tf-icon bx bx-chevron-left'></i></a></li>";
		
		// 페이지 번호
		for(int i=dto.getStartBlock(); i<=dto.getEndBlock(); i++) {
			model += "<li class='page-item ";
			if(dto.getCpage() == i) {
				model += "active";
			}
			model += "'>";
			model += "<a class='page-link' href='/myshare_list.do";
			model += "?cpage=" + i;
			model += "&hashtag=" + hashTag;
			model += "&searchSubject=" + searchSubject;
			model += "'>" + i + "</a></li>";
		}
		
		// 다음페이지
		model += "<li class='page-item next'>";
		if(dto.getTotalPage() != dto.getEndBlock()) {
			model += "<a class='page-link' href='/myshare_list.do";
			model += "?cpage=" + (dto.getEndBlock() + 1);
			model += "&hashtag=" + hashTag;
			model += "'>";
		} else {
			model += "<a class='page-link' href='javascript:void(0);";
			model += "'>";
		}
		model += "<i class='tf-icon bx bx-chevron-right'></i></a></li>";
		model += "<li class='page-item last'>";
		model += "<a class='page-link' href='/myshare_list.do";
		model += "?cpage=" + dto.getTotalPage();
		model += "&hashtag=" + hashTag;
		model += "'>";
		model += "<i class='tf-icon bx bx-chevrons-right'></i></a></li>";
		
		// 종료
		model += "</ul>";
		model += "</nav>";
		
		return model;
	}
}
