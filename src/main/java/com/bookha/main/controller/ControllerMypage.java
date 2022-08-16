package com.bookha.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.model.ModelLogoHtml;
import com.bookha.model.ModelProfileHtml;

@RestController
public class ControllerMypage {
	
	private String title = "마이 페이지";
	
	@RequestMapping(value = "/mypage.do")
	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		mv.addObject("profile", profile.getProfile().toString());
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("mypage/my_attendance");
		return mv;
	}
	
	@RequestMapping(value = "/my_achievements.do")
	public ModelAndView my_achievements(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		mv.addObject("profile", profile.getProfile().toString());
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("mypage/my_achievements");
		return mv;
	}
	
	@RequestMapping(value = "/user_account_setting.do")
	public ModelAndView user_account_setting(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		mv.addObject("profile", profile.getProfile().toString());
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("mypage/user_account_setting");
		return mv;
	}

	@RequestMapping(value = "/al_list.do")
	public ModelAndView al_list(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		mv.addObject("profile", profile.getProfile().toString());
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("mypage/my_album_list");
		return mv;
	}
	
	@RequestMapping(value = "/re_list.do")
	public ModelAndView re_list(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		mv.addObject("profile", profile.getProfile().toString());
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("mypage/my_review_list");
		return mv;
	}
	
	@RequestMapping(value = "/re_view.do")
	public ModelAndView re_view(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		mv.addObject("profile", profile.getProfile().toString());
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("mypage/my_review_view");
		return mv;
	}
	
	@RequestMapping(value = "/sh_list.do")
	public ModelAndView sh_list(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		mv.addObject("profile", profile.getProfile().toString());
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("mypage/my_share_list");
		return mv;
	}
	
	@RequestMapping(value = "/sh_view.do")
	public ModelAndView sh_view(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		mv.addObject("profile", profile.getProfile().toString());
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("mypage/my_share_view");
		return mv;
	}

}
