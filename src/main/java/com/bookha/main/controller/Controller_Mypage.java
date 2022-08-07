package com.bookha.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.model.Model_ProfileHtml;

@RestController
public class Controller_Mypage {
	
	private String title = "마이 페이지";
	
	@RequestMapping(value = "/mypage.do")
	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		Model_ProfileHtml profile = new Model_ProfileHtml();
		mv.addObject("profile", profile.getProfile().toString());
		
		mv.setViewName("mypage/my_achievements");
		return mv;
	}
}
