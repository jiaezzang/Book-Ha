package com.bookha.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAOAdminBoard;
import com.bookha.main.dao.DAOMyPage;
import com.bookha.main.dao.DAOShareBoard;
import com.bookha.main.dao.DAOUser;
import com.bookha.main.dto.DTOAdminBoard;
import com.bookha.main.dto.DTOAlbumBoard;
import com.bookha.main.dto.DTOAlbumTotal;
import com.bookha.main.dto.DTOShareBoard;
import com.bookha.main.dto.DTOShareTotal;
import com.bookha.main.dto.DTOUser;
import com.bookha.model.ModelAlbumList;
import com.bookha.model.ModelCalendar;
import com.bookha.model.ModelChangeProfile;
import com.bookha.model.ModelLogoHtml;
import com.bookha.model.ModelMyAchievements;
import com.bookha.model.ModelMyPageProfile;
import com.bookha.model.ModelNavBar;
import com.bookha.model.ModelNoticeList;
import com.bookha.model.ModelProfileHtml;
import com.bookha.model.ModelShareList;
import com.bookha.model.ModelSharePageNavigation;

@RestController
public class ControllerMyboard {
	
	private String title = "마이 페이지";
	
	@Autowired
	private DAOUser daoUser;

	@Autowired
	private DAOShareBoard daoShare;

	
	
	
	@RequestMapping(value = "/myalbum.do")
	public ModelAndView myalbum(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		mv.addObject("profile", profile.getProfile().toString());
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("myboard/my_album_list");
		return mv;
	}
	
	@RequestMapping(value = "/myreview_list.do")
	public ModelAndView myreviewList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		mv.addObject("profile", profile.getProfile().toString());
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("myboard/my_review_list");
		return mv;
	}
	
	@RequestMapping(value = "/myshare_list.do")
	public ModelAndView myshareList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		mv.addObject("profile", profile.getProfile().toString());
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("myboard/my_share_list");
		return mv;
	}
	
}