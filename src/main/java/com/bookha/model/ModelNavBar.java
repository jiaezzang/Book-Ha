package com.bookha.model;

import com.bookha.main.dto.DTOUser;

public class ModelNavBar {
	public String navBar(DTOUser dto) {
		StringBuilder sbHtml = new StringBuilder();

		sbHtml.append("<nav class='layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme' id='layout-navbar'>");
		sbHtml.append("<div class='layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none'>");
		sbHtml.append("<a class='nav-item nav-link px-0 me-xl-4' href='javascript:void(0)'>");
		sbHtml.append("<i class='bx bx-menu bx-sm'></i>");
		sbHtml.append("</a>");
		sbHtml.append("</div>");
		sbHtml.append("<div class='navbar-nav-right d-flex align-items-center' id='navbar-collapse'>");
		sbHtml.append("<ul class='navbar-nav flex-row align-items-center ms-auto'>");
		sbHtml.append("<!-- User -->");
		sbHtml.append("<li class='nav-item navbar-dropdown dropdown-user dropdown'>");
		sbHtml.append("<a class='nav-link dropdown-toggle hide-arrow' href='javascript:void(0);' data-bs-toggle='dropdown'>");
		sbHtml.append("<div class='avatar'>");
		sbHtml.append("<img src='../assets/img/achievements/" + dto.getUser_profile() + "' class='w-px-40 h-auto rounded-circle' style='border: 2px solid #696cff;'>");
		sbHtml.append("</div>");
		sbHtml.append("</a>");
		sbHtml.append("<ul class='dropdown-menu dropdown-menu-end'>");
		sbHtml.append("<li>");
		sbHtml.append("<a class='dropdown-item' href='#'>");
		sbHtml.append("<div class='d-flex'>");
		sbHtml.append("<div class='flex-shrink-0 me-3'>");
		sbHtml.append("<div class='avatar'>");
		sbHtml.append("<img src='../assets/img/achievements/" + dto.getUser_profile() + "' class='w-px-40 h-auto rounded-circle' style='border: 2px solid #696cff;'>");
		sbHtml.append("</div>");
		sbHtml.append("</div>");
		sbHtml.append("<div class='flex-grow-1'>");
		sbHtml.append("<span class='fw-semibold d-block'>" + dto.getUser_nickname() + "</span>");
		sbHtml.append("<small class='text-muted'>" + dto.getUser_role() + "</small>");
		sbHtml.append("</div>");
		sbHtml.append("</div>");
		sbHtml.append("</a>");
		sbHtml.append("</li>");
		sbHtml.append("<li>");
		sbHtml.append("<div class='dropdown-divider'></div>");
		sbHtml.append("</li>");
		sbHtml.append("<li>");
		if(dto.getUser_role().equals("admin")) {
			sbHtml.append("<a class='dropdown-item' href='/main.do'>");
			sbHtml.append("<i class='bx bx-user me-2'></i>");
			sbHtml.append("<span class='align-middle'>관리자 페이지</span>");
		} else {
			sbHtml.append("<a class='dropdown-item' href='/mypage.do'>");
			sbHtml.append("<i class='bx bx-user me-2'></i>");
			sbHtml.append("<span class='align-middle'>마이 페이지</span>");
		}

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
		sbHtml.append("<!--/ User -->");
		sbHtml.append("</ul>");
		sbHtml.append("</div>");
		sbHtml.append("</nav>");
		
		return sbHtml.toString();
	}
	
	public String navBarSearch(DTOUser dto) {
		StringBuilder sbHtml = new StringBuilder();

		sbHtml.append("<nav class='layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme' id='layout-navbar'>");
		sbHtml.append("<div class='layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none'>");
		sbHtml.append("<a class='nav-item nav-link px-0 me-xl-4' href='javascript:void(0)'>");
		sbHtml.append("<i class='bx bx-menu bx-sm'></i>");
		sbHtml.append("</a>");
		sbHtml.append("</div>");
		sbHtml.append("<div class='navbar-nav-right d-flex align-items-center' id='navbar-collapse'>");
		sbHtml.append("<!-- Search -->");
		sbHtml.append("<div class='navbar-nav align-items-center'>");
		sbHtml.append("<div class='nav-item d-flex align-items-center'>");
		sbHtml.append("<i class='bx bx-search fs-4 lh-0'></i> <input type='text'");
		sbHtml.append("class='form-control border-0 shadow-none'");
		sbHtml.append("placeholder='Search...' aria-label='Search...' />");
		sbHtml.append("</div>");
		sbHtml.append("</div>");
		sbHtml.append("<!--/ Search -->");
		sbHtml.append("<ul class='navbar-nav flex-row align-items-center ms-auto'>");
		sbHtml.append("<!-- User -->");
		sbHtml.append("<li class='nav-item navbar-dropdown dropdown-user dropdown'>");
		sbHtml.append("<a class='nav-link dropdown-toggle hide-arrow' href='javascript:void(0);' data-bs-toggle='dropdown'>");
		sbHtml.append("<div class='avatar'>");
		sbHtml.append("<img src='../assets/img/achievements/" + dto.getUser_profile() + "' class='w-px-40 h-auto rounded-circle' style='border: 2px solid #696cff;'>");
		sbHtml.append("</div>");
		sbHtml.append("</a>");
		sbHtml.append("<ul class='dropdown-menu dropdown-menu-end'>");
		sbHtml.append("<li>");
		sbHtml.append("<a class='dropdown-item' href='#'>");
		sbHtml.append("<div class='d-flex'>");
		sbHtml.append("<div class='flex-shrink-0 me-3'>");
		sbHtml.append("<div class='avatar'>");
		sbHtml.append("<img src='../assets/img/achievements/" + dto.getUser_profile() + "' class='w-px-40 h-auto rounded-circle' style='border: 2px solid #696cff;'>");
		sbHtml.append("</div>");
		sbHtml.append("</div>");
		sbHtml.append("<div class='flex-grow-1'>");
		sbHtml.append("<span class='fw-semibold d-block'>" + dto.getUser_nickname() + "</span>");
		sbHtml.append("<small class='text-muted'>" + dto.getUser_role() + "</small>");
		sbHtml.append("</div>");
		sbHtml.append("</div>");
		sbHtml.append("</a>");
		sbHtml.append("</li>");
		sbHtml.append("<li>");
		sbHtml.append("<div class='dropdown-divider'></div>");
		sbHtml.append("</li>");
		sbHtml.append("<li>");
		if(dto.getUser_role().equals("admin")) {
			sbHtml.append("<a class='dropdown-item' href='/main.do'>");
			sbHtml.append("<i class='bx bx-user me-2'></i>");
			sbHtml.append("<span class='align-middle'>관리자 페이지</span>");
		} else {
			sbHtml.append("<a class='dropdown-item' href='/mypage.do'>");
			sbHtml.append("<i class='bx bx-user me-2'></i>");
			sbHtml.append("<span class='align-middle'>마이 페이지</span>");
		}
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
		sbHtml.append("<!--/ User -->");
		sbHtml.append("</ul>");
		sbHtml.append("</div>");
		sbHtml.append("</nav>");
		
		return sbHtml.toString();
	}

}
