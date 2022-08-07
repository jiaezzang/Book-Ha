package com.bookha.model;

public class Model_ProfileHtml {
	public Model_ProfileHtml() {
		// TODO Auto-generated constructor stub
	}
	
	public StringBuilder getProfile() {
		StringBuilder sbHtml = new StringBuilder();
		sbHtml.append("<li class='nav-item navbar-dropdown dropdown-user dropdown'>");
			sbHtml.append("<a class='nav-link dropdown-toggle hide-arrow' href='javascript:void(0);' data-bs-toggle='dropdown'>");
			sbHtml.append("<div class='avatar'>");
			sbHtml.append("<img src='../assets/img/avatars/1.png' class='w-px-40 h-auto rounded-circle' />");
			sbHtml.append("</div>");
			sbHtml.append("</a>");
			sbHtml.append("<ul class='dropdown-menu dropdown-menu-end'>");
			sbHtml.append("<li>");
			sbHtml.append("<a class='dropdown-item' href='#'>");
			sbHtml.append("<div class='d-flex'>");
			sbHtml.append("<div class='flex-shrink-0 me-3'>");
			sbHtml.append("<div class='avatar'>");
			sbHtml.append("<img src='../assets/img/avatars/1.png' class='w-px-40 h-auto rounded-circle' />");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
			sbHtml.append("<div class='flex-grow-1'>");
			sbHtml.append("<span class='fw-semibold d-block'>닉네임</span>");
			sbHtml.append("<small class='text-muted'>User</small>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
			sbHtml.append("</a>");
			sbHtml.append("</li>");
			sbHtml.append("<li>");
			sbHtml.append("<div class='dropdown-divider'></div>");
			sbHtml.append("</li>");
			sbHtml.append("<li>");
			sbHtml.append("<a class='dropdown-item' href='/user_account_setting'>");
			sbHtml.append("<i class='bx bx-user me-2'></i>");
			sbHtml.append("<span class='align-middle'>마이 페이지</span>");
			sbHtml.append("</a>");
			sbHtml.append("</li>");
			sbHtml.append("<li>");
			sbHtml.append("<div class='dropdown-divider'></div>");
			sbHtml.append("</li>");
			sbHtml.append("<li>");
			sbHtml.append("<a class='dropdown-item' href='/logout'>");
			sbHtml.append("<i class='bx bx-power-off me-2'></i>");
			sbHtml.append("<span class='align-middle'>로그아웃</span>");
			sbHtml.append("</a>");
			sbHtml.append("</li>");
			sbHtml.append("</ul>");
		sbHtml.append("</li>");
		return sbHtml;
	}
	
	public StringBuilder getAdminProfile() {
		StringBuilder sbHtml = new StringBuilder();
		sbHtml.append("<li class='nav-item navbar-dropdown dropdown-user dropdown'>");
			sbHtml.append("<a class='nav-link dropdown-toggle hide-arrow' href='javascript:void(0);' data-bs-toggle='dropdown'>");
			sbHtml.append("<div class='avatar'>");
			sbHtml.append("<img src='../assets/img/avatars/1.png' class='w-px-40 h-auto rounded-circle' />");
			sbHtml.append("</div>");
			sbHtml.append("</a>");
			sbHtml.append("<ul class='dropdown-menu dropdown-menu-end'>");
			sbHtml.append("<li>");
			sbHtml.append("<a class='dropdown-item' href='#'>");
			sbHtml.append("<div class='d-flex'>");
			sbHtml.append("<div class='flex-shrink-0 me-3'>");
			sbHtml.append("<div class='avatar'>");
			sbHtml.append("<img src='../assets/img/avatars/1.png' class='w-px-40 h-auto rounded-circle' />");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
			sbHtml.append("<div class='flex-grow-1'>");
			sbHtml.append("<span class='fw-semibold d-block'>닉네임</span>");
			sbHtml.append("<small class='text-muted'>Admin</small>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
			sbHtml.append("</a>");
			sbHtml.append("</li>");
			sbHtml.append("<li>");
			sbHtml.append("<div class='dropdown-divider'></div>");
			sbHtml.append("</li>");
			sbHtml.append("<li>");
			sbHtml.append("<a class='dropdown-item' href='/main.do'>");
			sbHtml.append("<i class='bx bx-user me-2'></i>");
			sbHtml.append("<span class='align-middle'>관리자 페이지</span>");
			sbHtml.append("</a>");
			sbHtml.append("</li>");
			sbHtml.append("<li>");
			sbHtml.append("<div class='dropdown-divider'></div>");
			sbHtml.append("</li>");
			sbHtml.append("<li>");
			sbHtml.append("<a class='dropdown-item' href='/logout'>");
			sbHtml.append("<i class='bx bx-power-off me-2'></i>");
			sbHtml.append("<span class='align-middle'>로그아웃</span>");
			sbHtml.append("</a>");
			sbHtml.append("</li>");
			sbHtml.append("</ul>");
		sbHtml.append("</li>");
		return sbHtml;
	}
}