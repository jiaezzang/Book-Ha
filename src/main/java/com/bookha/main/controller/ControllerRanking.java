package com.bookha.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAOAlbumBoard;
import com.bookha.main.dao.DAORanking;
import com.bookha.main.dao.DAOUser;
import com.bookha.main.dto.DTOAlbumBoard;
import com.bookha.main.dto.DTOAttendance;
import com.bookha.main.dto.DTOReviewBoard;
import com.bookha.main.dto.DTOShareBoard;
import com.bookha.main.dto.DTOUser;
import com.bookha.model.ModelAlbumList;
import com.bookha.model.ModelLogoHtml;
import com.bookha.model.ModelMenuBar;
import com.bookha.model.ModelNavBar;
import com.bookha.model.ModelProfileHtml;
import com.bookha.model.ModelRanking;

@RestController
public class ControllerRanking {
	
	private String title = "업적과 순위";
	private String user_role = "user";
	
	@Autowired
	private DAORanking dao;
	
	@Autowired
	private DAOUser daoUser;

	@RequestMapping(value = "/ranking.do")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		if(this.user_role.equals("user")) {
			mv.addObject("profile", profile.getProfile().toString());
		} else if(this.user_role.equals("admin")) {
			mv.addObject("profile", profile.getAdminProfile().toString());
		}
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		//dao.check_attendance(request.getUser_num);
		//dao.add_attendance(request.getUser_num);
		ArrayList<DTOAttendance> atLists = new ArrayList<DTOAttendance>();
		ArrayList<DTOReviewBoard> reviewLists = new ArrayList<DTOReviewBoard>();
		ArrayList<DTOAlbumBoard> albumLists = new ArrayList<DTOAlbumBoard>();
		ArrayList<DTOShareBoard> shareLists = new ArrayList<DTOShareBoard>();
		
		atLists = dao.countAttendance();
		reviewLists = dao.reviewRanking();
		albumLists = dao.albumRanking();
		shareLists = dao.shareRanking();
		
		//attendance ranking 1-3 순위 리스트
		ArrayList<DTOUser> userLists1 = new ArrayList<DTOUser>();
		for( DTOAttendance list : atLists ) {
			//System.out.println(list.getUser_num());
			userLists1.add(dao.getProfile(list.getAt_num()));
		}
		//review ranking 1-3 순위 리스트
		ArrayList<DTOUser> userLists2 = new ArrayList<DTOUser>();
		for( DTOReviewBoard list : reviewLists ) {
			//System.out.println(list.getUser_num());
			userLists2.add(dao.getProfile(list.getUser_num()));
		}
		
		//album ranking 1-3 순위 리스트
		ArrayList<DTOUser> userLists3 = new ArrayList<DTOUser>();
		for( DTOAlbumBoard list : albumLists ) {
			//System.out.println(list.getAl_user_num());
			userLists3.add(dao.getProfile(list.getAl_user_num()));
		}
		
		//share ranking 1-3 순위 리스트
		ArrayList<DTOUser> userLists4 = new ArrayList<DTOUser>();
		for( DTOShareBoard list : shareLists ) {
			//System.out.println(list.getUser_num());
			userLists4.add(dao.getProfile(list.getUser_num()));
		}
		
		//System.out.println("유저리스트 : " + userLists1.toString());
		
		ModelRanking model = new ModelRanking();
		String atList = model.getRankingList("부카의 출석왕", userLists1);
		String reviewList = model.getRankingList("부카의 리뷰왕", userLists2);
		String albumList = model.getRankingList("부카의 인증왕", userLists3);
		String shareList = model.getRankingList("부카의 공유왕", userLists4);
		
		mv.addObject("atList", atList);
		mv.addObject("reviewList", reviewList);
		mv.addObject("albumList", albumList);
		mv.addObject("shareList", shareList);
		
		
		//로그인 한 회원의 정보
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		DTOUser userSetting = new DTOUser();
		userSetting = daoUser.userSetting(session_user_num);
		mv.addObject("userSetting", userSetting);
		
		mv.addObject("session_user_num", session_user_num);
		
		//Navbar Model
		ModelNavBar navModel = new ModelNavBar();
		String navBar = navModel.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		//좌측 Menu Model
		ModelMenuBar menuModel = new ModelMenuBar();
		String menuBar = menuModel.menuBar("ranking");
		mv.addObject("menuBar", menuBar);
		
		
		mv.setViewName("ranking/ranking");
		return mv;
	}
}