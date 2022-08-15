package com.bookha.model;

public class Model_ReviewPageNavigation {
	public Model_ReviewPageNavigation() {
		// TODO Auto-generated constructor stub
	}
	
	public String getPageNav() {
		String model = "";
		
		// 네비게이션 시작태그
		model += "<nav aria-label='Page navigation'>";
		model += "<ul class='pagination'>";
		
		// 네비게이션 이전페이지 화살표
		model += "<li class='page-item first'>";
		model += "<a class='page-link' href='javascript:void(0);'>";
		model += "<i class='tf-icon bx bx-chevrons-left'></i></a></li>";
		model += "<li class='page-item prev'>";
		model += "<a class='page-link' href='javascript:void(0);'>";
		model += "<i class='tf-icon bx bx-chevron-left'></i></a></li>";
		
		// 네비게이션 번호
		model += "<li class='page-item'>";
		model += "<a class='page-link' href='javascript:void(0);'>1</a></li>";
		model += "<li class='page-item'>";
		model += "<a class='page-link' href='javascript:void(0);'>2</a></li>";
		model += "<li class='page-item'>";
		model += "<a class='page-link' href='javascript:void(0);'>3</a></li>";
		model += "<li class='page-item'>";
		model += "<a class='page-link' href='javascript:void(0);'>4</a></li>";
		model += "<li class='page-item'>";
		model += "<a class='page-link' href='javascript:void(0);'>5</a></li>";
		
		// 네비게이션 다음페이지 화살표
		model += "<li class='page-item next'>";
		model += "<a class='page-link' href='javascript:void(0);'>";
		model += "<i class='tf-icon bx bx-chevron-right'></i></a></li>";
		model += "<li class='page-item last'><a class='page-link' href='javascript:void(0);'>";
		model += "<i class='tf-icon bx bx-chevrons-right'></i></a></li>";
		
		// 네비게이션 종료태그
		model += "</ul>";
		model += "</nav>";
		
		return model;
	}
}