package com.bookha.model;

public class ModelMenuBar {
	public String menuBar(String page) {
		StringBuilder sbHtml = new StringBuilder();
		
		sbHtml.append("<ul class='menu-inner py-1'>");

		sbHtml.append("<!-- Forms & Tables -->");
		sbHtml.append("<li class='menu-header small text-uppercase'>");
		sbHtml.append("<span class='menu-header-text'>당신의 순위는 어디일까요?</span></li>");
		sbHtml.append("<!-- Tables -->");
		sbHtml.append("<li class='menu-item");
		if (page.equals("ranking")) {
			sbHtml.append(" active");
		}
		sbHtml.append("'><a href='/ranking.do' class='menu-link'> <i class='menu-icon bx bx-crown");
		if (page.equals("ranking")) {
			sbHtml.append(" bx-tada");
		}
		sbHtml.append("' style='color: #646363'></i>");
		sbHtml.append("<div data-i18n='Tables'>업적과 순위</div>");
		sbHtml.append("</a></li>");
		
		sbHtml.append("<!-- Forms & Tables -->");
		sbHtml.append("<li class='menu-header small text-uppercase'>");
		sbHtml.append("	<span class='menu-header-text'>책을 읽고 느낀점을 나눠봐요!</span>");
		sbHtml.append("</li>");
		sbHtml.append("<!-- Tables -->");
		sbHtml.append("<li class='menu-item");
		if (page.equals("review")) {
			sbHtml.append(" active");
		}
		sbHtml.append("'><a href='/review_list.do' class='menu-link'>");
		sbHtml.append("<i class='menu-icon bx bx-book-open");
		if (page.equals("review")) {
			sbHtml.append(" bx-tada");
		}
		sbHtml.append("' style='color: #646363'></i> ");
		sbHtml.append("<div data-i18n='Tables'>독후감 나누기</div>");
		sbHtml.append("</a></li>");

		sbHtml.append("<!-- Forms & Tables -->");
		sbHtml.append("<li class='menu-header small text-uppercase'><spanclass='menu-header-text'>하루하루 책을 읽어봐요!</span></li>");
		sbHtml.append("<!-- Tables -->");
		sbHtml.append("<li class='menu-item");
		if (page.equals("challenge")) {
			sbHtml.append(" active");
		} 
		sbHtml.append("'><a href='/album_list.do' class='menu-link'>");
		sbHtml.append("<i class='menu-icon bx bx-photo-album");
		if (page.equals("challenge")) {
			sbHtml.append(" bx-tada");
		}
		sbHtml.append("' style='color: #646363'></i>");
		sbHtml.append("<div data-i18n='Tables'>찔끔 챌린지</div>");
		sbHtml.append("</a></li>");

		sbHtml.append("<!-- Forms & Tables -->");
		sbHtml.append("<li class='menu-header small text-uppercase'><span class='menu-header-text'>다른 사람들과 책을 나눠봐요!</span></li>");
		sbHtml.append("<!-- Tables -->");
		sbHtml.append("<li class='menu-item");
		if (page.equals("share")) {
			sbHtml.append(" active");
		}
		sbHtml.append("'><a href='/share_list.do' class='menu-link'>");
		sbHtml.append("<i class='menu-icon bx bx-gift");
		if (page.equals("share")) {
			sbHtml.append(" bx-tada");
		}
		sbHtml.append("' style='color: #646363'></i>");
		sbHtml.append("<div data-i18n='Tables'>나눔과 공유하기</div>");
		sbHtml.append("</a></li>");
		
		sbHtml.append("</ul>");
		
		return sbHtml.toString();
	}
	
	public String userMenuBar(String page) {
		StringBuilder sbHtml = new StringBuilder();

		sbHtml.append("<ul class='menu-inner py-1'>");

		sbHtml.append("<!-- Forms & Tables -->");
		sbHtml.append("<li class='menu-header small text-uppercase'><span class='menu-header-text'>목표를 얼마나 달성하셨나요?</span></li>");
		sbHtml.append("<!-- Tables -->");
		sbHtml.append("<li class='menu-item");
		if (page.equals("myAchv")) {
			sbHtml.append(" active");
		}
		sbHtml.append("'><a href='/my_achievements.do' class='menu-link'>");
		sbHtml.append("<i class='menu-icon bx bx-book-open");
		if (page.equals("myAchv")) {
			sbHtml.append(" bx-tada");
		}
		sbHtml.append("' style='color: #646363'></i>");
		sbHtml.append("<div data-i18n='Tables'>나의 업적 확인</div>");
		sbHtml.append("</a></li>");

		sbHtml.append("<!-- Forms & Tables -->");
		sbHtml.append("<li class='menu-header small text-uppercase'><spanclass='menu-header-text'>작성글을 확인해 봅시다.</span></li>");
		sbHtml.append("<!-- Tables -->");
		sbHtml.append("<li class='menu-item");
		if (page.equals("myPost")) {
			sbHtml.append(" active");
		}
		sbHtml.append("' style=''><a href='javascript:void(0)' class='menu-link menu-toggle'>");
		sbHtml.append("<i class='menu-icon tf-icons bx bx-box");
		if (page.equals("myPost")) {
			sbHtml.append(" bx-tada");
		}
		sbHtml.append("'></i>");
		sbHtml.append("<div data-i18n='User interface'>내 글 모아보기</div>");
		sbHtml.append("</a>");
		sbHtml.append("	<ul class='menu-sub'>");
		sbHtml.append("<li class='menu-item'><a href='myreview_list.do' class='menu-link'>");
		sbHtml.append("<div data-i18n='Accordion'>독후감 나누기</div>");
		sbHtml.append("</a></li>");
		sbHtml.append("<li class='menu-item'><a href='/myalbum.do' class='menu-link'>");
		sbHtml.append("<div data-i18n='Badges'>찔끔 챌린지</div>");
		sbHtml.append("</a></li>");
		sbHtml.append("<li class='menu-item'><a href='/myshare_list.do' class='menu-link'>");
		sbHtml.append("<div data-i18n='Buttons'>나눔과 공유하기</div>");
		sbHtml.append("</a></li>");
		sbHtml.append("</ul></li>");
		
		sbHtml.append("<!-- Forms & Tables -->");
		sbHtml.append("<li class='menu-header small text-uppercase'><span class='menu-header-text'></span></li>");
		sbHtml.append("<!-- Tables -->");
		sbHtml.append("<li class='menu-item");
		if (page.equals("mySetting")) {
			sbHtml.append(" active");
		}
		sbHtml.append("'><a href='/user_account_setting.do' class='menu-link'>");
		sbHtml.append("<i class='menu-icon bx bx-book-open");
		if (page.equals("mySetting")) {
			sbHtml.append(" bx-tada");
		}
		sbHtml.append("' style='color: #646363'></i>");
		sbHtml.append("	<div data-i18n='Tables'>개인 정보 수정</div>");
		sbHtml.append("</a></li>");

		sbHtml.append("</ul>");
		
		return sbHtml.toString();
	}
	
	public String adminMenuBar(String page) {
		StringBuilder sbHtml = new StringBuilder();

		sbHtml.append("<ul class='menu-inner py-1'>");

		sbHtml.append("<!-- Forms & Tables -->");
		sbHtml.append("<li class='menu-header small text-uppercase'><spanclass='menu-header-text'></span></li>");
		sbHtml.append("<!-- Tables -->");
		sbHtml.append("<li class='menu-item");
		if (page.equals("adminPost")) {
			sbHtml.append(" active");
		}
		sbHtml.append("'><a href='/list.do' class='menu-link'>");
		sbHtml.append("<i class='menu-icon bx bx-book-open");
		if (page.equals("adminPost")) {
			sbHtml.append(" bx-tada");
		}
		sbHtml.append("' style='color: #646363'></i> ");
		sbHtml.append("<div data-i18n='Tables'>공지글 관리하기</div>");
		sbHtml.append("</a></li>");

		sbHtml.append("<!-- Forms & Tables -->");
		sbHtml.append("<li class='menu-header small text-uppercase'><spanclass='menu-header-text'></span></li>");
		sbHtml.append("<!-- Tables -->");
		sbHtml.append("<li class='menu-item");
		if (page.equals("adminBoard")) {
			sbHtml.append(" active");
		}
		sbHtml.append("' style=''><a href='javascript:void(0)' class='menu-link menu-toggle'>");
		sbHtml.append("<i class='menu-icon tf-icons bx bx-box");
		if (page.equals("adminBoard")) {
			sbHtml.append(" bx-tada");
		}
		sbHtml.append("'></i>");
		sbHtml.append("<div data-i18n='User interface'>게시판 이동하기</div>");
		sbHtml.append("</a>");
		sbHtml.append("	<ul class='menu-sub'>");
		sbHtml.append("<li class='menu-item'><a href='/ranking.do' class='menu-link'>");
		sbHtml.append("<div data-i18n='Alerts'>업적과 순위</div>");
		sbHtml.append("</a></li>");
		sbHtml.append("<li class='menu-item'><a href='/review_list.do' class='menu-link'>");
		sbHtml.append("	<div data-i18n='Accordion'>독후감 나누기</div>");
		sbHtml.append("</a></li>");
		sbHtml.append("<li class='menu-item'><a href='/album_list.do' class='menu-link'>");
		sbHtml.append("<div data-i18n='Badges'>찔끔 챌린지</div>");
		sbHtml.append("</a></li>");
		sbHtml.append("<li class='menu-item'><a href='/share_list.do' class='menu-link'>");
		sbHtml.append("<div data-i18n='Buttons'>나눔과 공유하기</div>");
		sbHtml.append("	</a></li>");
		sbHtml.append("</ul></li>");

		sbHtml.append("</ul>");
		
		return sbHtml.toString();
	}
	

}
