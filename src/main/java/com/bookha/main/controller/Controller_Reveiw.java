package com.bookha.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.model.Model_LogoHtml;
import com.bookha.model.Model_ProfileHtml;

@RestController
public class Controller_Reveiw {
	
	private String title = "독후감 나누기";
	private String user_role = "user";

	@RequestMapping(value = "/review_list.do")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		Model_ProfileHtml profile = new Model_ProfileHtml();
		if(this.user_role.equals("user")) {
			mv.addObject("profile", profile.getProfile().toString());
		} else if(this.user_role.equals("admin")) {
			mv.addObject("profile", profile.getAdminProfile().toString());
		}
		
		Model_LogoHtml logo = new Model_LogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("review_board/board_list");
		return mv;
	}
	
	@RequestMapping(value = "/review_write.do")
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		Model_ProfileHtml profile = new Model_ProfileHtml();
		if(this.user_role.equals("user")) {
			mv.addObject("profile", profile.getProfile().toString());
		} else if(this.user_role.equals("admin")) {
			mv.addObject("profile", profile.getAdminProfile().toString());
		}
		
		Model_LogoHtml logo = new Model_LogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		
		mv.setViewName("review_board/board_write");
		return mv;
	}
	
	@RequestMapping(value = "/review_view.do")
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		Model_ProfileHtml profile = new Model_ProfileHtml();
		if(this.user_role.equals("user")) {
			mv.addObject("profile", profile.getProfile().toString());
		} else if(this.user_role.equals("admin")) {
			mv.addObject("profile", profile.getAdminProfile().toString());
		}
		
		Model_LogoHtml logo = new Model_LogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		
		mv.setViewName("review_board/board_view");
		return mv;
	}
}