package com.bookha.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.model.Model_ProfileHtml;

@RestController
public class Controller_Album {
	
	private String title = "찔끔 챌린지";
	private String user_role = "user";

	@RequestMapping(value = "/album_list.do")
	public ModelAndView challenge(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		Model_ProfileHtml profile = new Model_ProfileHtml();
		if(this.user_role.equals("user")) {
			mv.addObject("profile", profile.getProfile().toString());
		} else if(this.user_role.equals("admin")) {
			mv.addObject("profile", profile.getAdminProfile().toString());
		}
		
		mv.setViewName("challenge_album/challenge");
		return mv;
	}
}