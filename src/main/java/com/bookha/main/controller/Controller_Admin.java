package com.bookha.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.model.Model_LogoHtml;
import com.bookha.model.Model_ProfileHtml;

@RestController
public class Controller_Admin {
	
	private String title = "관리자 페이지";

	@RequestMapping(value = "/list.do")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		Model_ProfileHtml profile = new Model_ProfileHtml();
		mv.addObject("profile", profile.getAdminProfile().toString());
		
		Model_LogoHtml logo = new Model_LogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("admin_board/board_list");
		return mv;
	}
	
	@RequestMapping(value = "/main.do")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		Model_ProfileHtml profile = new Model_ProfileHtml();
		mv.addObject("profile", profile.getAdminProfile().toString());
		
		Model_LogoHtml logo = new Model_LogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("admin_board/board_main");
		return mv;
	}
	
	@RequestMapping(value = "/notice.do")
	public ModelAndView notice(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		Model_ProfileHtml profile = new Model_ProfileHtml();
		mv.addObject("profile", profile.getAdminProfile().toString());
		
		Model_LogoHtml logo = new Model_LogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("admin_board/board_notice");
		return mv;
	}
	
	@RequestMapping(value = "/view.do")
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		Model_ProfileHtml profile = new Model_ProfileHtml();
		mv.addObject("profile", profile.getAdminProfile().toString());
		
		Model_LogoHtml logo = new Model_LogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("admin_board/board_view");
		return mv;
	}
	
	@RequestMapping(value = "/write.do")
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		Model_ProfileHtml profile = new Model_ProfileHtml();
		mv.addObject("profile", profile.getAdminProfile().toString());
		
		Model_LogoHtml logo = new Model_LogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("admin_board/board_write");
		return mv;
	}
}