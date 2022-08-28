package com.bookha.model;

import com.bookha.main.dto.DTOReviewTotal;

public class ModelReviewPageNavigation {
	public ModelReviewPageNavigation() {
		// TODO Auto-generated constructor stub
	}
	
	public String getPageNav(DTOReviewTotal dto) {
		String model = "";
		String hashTag = dto.getHash_tag().replaceAll("#", "%23");
		String searchSubject = dto.getSearchSubject();
		
		// 네비게이션 시작태그
		model += "<nav aria-label='Page navigation'>";
		model += "<ul class='pagination'>";
		
		// 네비게이션 이전페이지 화살표
		model += "<li class='page-item first'>";
		model += "<a class='page-link' href='/review_list.do?cpage=1";
		model += "&hashtag=" + hashTag;
		model += "&searchSubject=" + searchSubject;
		model += "'>";
		model += "<i class='tf-icon bx bx-chevrons-left'></i></a></li>";
		model += "<li class='page-item prev'>";
		if(dto.getStartBlock() != 1) {
			model += "<a class='page-link' href='/review_list.do";
			model += "?cpage=" + (dto.getStartBlock() - 5);
			model += "&hashtag=" + hashTag;
			model += "&searchSubject=" + searchSubject;
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
			model += "<a class='page-link' href='/review_list.do";
			model += "?cpage=" + i;
			model += "&hashtag=" + hashTag;
			model += "&searchSubject=" + searchSubject;
			model += "'>" + i + "</a></li>";
		}
		
		// 네비게이션 다음페이지 화살표
		model += "<li class='page-item next'>";
		if(dto.getTotalPage() != dto.getEndBlock()) {
			model += "<a class='page-link' href='/review_list.do";
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
		model += "<a class='page-link' href='/review_list.do";
		model += "?cpage=" + dto.getTotalPage();
		model += "&hashtag=" + hashTag;
		model += "&searchSubject=" + searchSubject;
		model += "'>";
		model += "<i class='tf-icon bx bx-chevrons-right'></i></a></li>";
		
		// 네비게이션 종료태그
		model += "</ul>";
		model += "</nav>";
		
		return model;
	}
	
	public String myPageNav(DTOReviewTotal dto) {
		String model = "";
		String hashTag = dto.getHash_tag().replaceAll("#", "%23");
		String searchSubject = dto.getSearchSubject();
		
		// 네비게이션 시작태그
		model += "<nav aria-label='Page navigation'>";
		model += "<ul class='pagination'>";
		
		// 네비게이션 이전페이지 화살표
		model += "<li class='page-item first'>";
		model += "<a class='page-link' href='/myreview_list.do?cpage=1";
		model += "&hashtag=" + hashTag;
		model += "'>";
		model += "<i class='tf-icon bx bx-chevrons-left'></i></a></li>";
		model += "<li class='page-item prev'>";
		if(dto.getStartBlock() != 1) {
			model += "<a class='page-link' href='/myreview_list.do";
			model += "?cpage=" + (dto.getStartBlock() - 5);
			model += "&hashtag=" + hashTag;
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
			model += "<a class='page-link' href='/myreview_list.do";
			model += "?cpage=" + i;
			model += "&hashtag=" + hashTag;
			model += "'>" + i + "</a></li>";
		}
		
		// 네비게이션 다음페이지 화살표
		model += "<li class='page-item next'>";
		if(dto.getTotalPage() != dto.getEndBlock()) {
			model += "<a class='page-link' href='/myreview_list.do";
			model += "?cpage=" + (dto.getEndBlock() + 1);
			model += "&hashtag=" + hashTag;
			model += "'>";
		} else {
			model += "<a class='page-link' href='javascript:void(0);";
			model += "'>";
		}
		model += "<i class='tf-icon bx bx-chevron-right'></i></a></li>";
		model += "<li class='page-item last'>";
		model += "<a class='page-link' href='/myreview_list.do";
		model += "?cpage=" + dto.getTotalPage();
		model += "&hashtag=" + hashTag;
		model += "&searchSubject=" + searchSubject;
		model += "'>";
		model += "<i class='tf-icon bx bx-chevrons-right'></i></a></li>";
		
		// 네비게이션 종료태그
		model += "</ul>";
		model += "</nav>";
		
		return model;
	}
}