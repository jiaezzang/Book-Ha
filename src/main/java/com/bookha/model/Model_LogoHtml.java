package com.bookha.model;

public class Model_LogoHtml {
	public Model_LogoHtml() {
		// TODO Auto-generated constructor stub
	}
	
	public StringBuilder getLogo() {
		StringBuilder sbHtml = new StringBuilder();
		sbHtml.append("<a href='/mainpage' class='app-brand-link'>");
		sbHtml.append("<img class='logo-demo' src='../assets/img/logo/logo2.png'>");
		sbHtml.append("</a>");
		sbHtml.append("<a href='javascript:void(0);' class='layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none'>");
		sbHtml.append("<i class='bx bx-chevron-left bx-sm align-middle'>");
		sbHtml.append("</i>");
		sbHtml.append("</a>");
		return sbHtml;
	}
}
