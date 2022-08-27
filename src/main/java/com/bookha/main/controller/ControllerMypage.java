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
import com.bookha.model.ModelMenuBar;
import com.bookha.model.ModelMyAchievements;
import com.bookha.model.ModelMyPageProfile;
import com.bookha.model.ModelNavBar;
import com.bookha.model.ModelNoticeList;
import com.bookha.model.ModelProfileHtml;
import com.bookha.model.ModelShareList;
import com.bookha.model.ModelSharePageNavigation;

@RestController
public class ControllerMypage {

	@Autowired
	private DAOUser dao;

	@Autowired
	private DAOMyPage daoMypage;
	
	
	
	@RequestMapping(value = "/mypage.do")
	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		String title = "출석 체크";
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		mv.addObject("profile", profile.getProfile().toString());
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		//로그인 한 회원의 정보
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		DTOUser userSetting = new DTOUser();
		userSetting = dao.userSetting(session_user_num);
		mv.addObject("userSetting", userSetting);
		
		//Navbar Model
		ModelNavBar model = new ModelNavBar();
		String navBar = model.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		//출석 정보
		String checkAt = daoMypage.checkAttendance(session_user_num);
		String addStamp = daoMypage.addStamp();
		
		mv.addObject("checkAt", checkAt);
		mv.addObject("addStamp", addStamp);
		
		//출석 리스트 
		ModelCalendar modelAt = new ModelCalendar();
		String listAt = modelAt.ModelCheckAt(daoMypage.listAt(session_user_num));
		mv.addObject("listAt", listAt);
		
		//좌측 Menu Model
		ModelMenuBar menuModel = new ModelMenuBar();
		String menuBar = menuModel.userMenuBar("");
		mv.addObject("menuBar", menuBar);

		mv.setViewName("mypage/my_attendance");
		return mv;
	}
	
	@RequestMapping(value = "/add_attendance.do")
	public int addAttendance(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		//로그인 한 회원의 정보
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		
		return daoMypage.addAttendance(session_user_num);
	}
	
	
	@RequestMapping(value = "/my_achievements.do")
	public ModelAndView my_achievements(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		String title = "나의 업적 확인";
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		mv.addObject("profile", profile.getProfile().toString());
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		//로그인 한 회원의 정보
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		DTOUser userSetting = new DTOUser();
		userSetting = dao.userSetting(session_user_num);
		mv.addObject("userSetting", userSetting);
		
		//Navbar Model
		ModelNavBar model = new ModelNavBar();
		String navBar = model.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		//좌측 Menu Model
		ModelMenuBar menuModel = new ModelMenuBar();
		String menuBar = menuModel.userMenuBar("myAchv");
		mv.addObject("menuBar", menuBar);
		
		//출석 업적
		ModelMyAchievements modelAchieve = new ModelMyAchievements();
		int atCount = daoMypage.countAttendance(session_user_num);
		String atList = modelAchieve.getAchieveAttendance(atCount);
		mv.addObject("atList", atList);
		
		//리뷰게시판 업적
		int reCount = daoMypage.countReview(session_user_num);
		String reList = modelAchieve.getAchieveReview(reCount);
		mv.addObject("reList", reList);
		
		//앨범게시판 업적
		int alCount = daoMypage.countAlbum(session_user_num);
		String alList = modelAchieve.getAchieveAlbum(alCount);
		mv.addObject("alList", alList);
		
		//공유게시판 업적
		int shCount = daoMypage.countShare(session_user_num);
		String shList = modelAchieve.getAchieveShare(shCount);
		mv.addObject("shList", shList);
		
		mv.setViewName("mypage/my_achievements");
		return mv;
	}
	
	@RequestMapping(value = "/user_account_setting.do")
	public ModelAndView user_account_setting(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		String title = "개인 정보 수정";
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		mv.addObject("profile", profile.getProfile().toString());
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		//로그인 한 회원의 정보
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		DTOUser userSetting = new DTOUser();
		userSetting = dao.userSetting(session_user_num);
		mv.addObject("userSetting", userSetting);
		mv.addObject("session_user_num", session_user_num);
		
		//Navbar Model
		ModelNavBar model = new ModelNavBar();
		String navBar = model.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		//좌측 Menu Model
		ModelMenuBar menuModel = new ModelMenuBar();
		String menuBar = menuModel.userMenuBar("mySetting");
		mv.addObject("menuBar", menuBar);
		
		//프로필 변경 모델
		ModelChangeProfile modelChangePf = new ModelChangeProfile();
		
		//전체 div 틀
		String startProfile = modelChangePf.getAchieveStart();
		String endProfile = modelChangePf.getAchieveEnd();
		mv.addObject("startProfile", startProfile);
		mv.addObject("endProfile", endProfile);
		
		//출석 업적 프로필 
		int atCount = daoMypage.countAttendance(session_user_num);
		String atList = modelChangePf.getAchieveAttendance(atCount);
		mv.addObject("atList", atList);
		
		//리뷰 업적 프로필
		int reCount = daoMypage.countReview(session_user_num);
		String reList = modelChangePf.getAchieveReview(reCount);
		mv.addObject("reList", reList);
		
		//앨범 업적 프로필
		int alCount = daoMypage.countAlbum(session_user_num);
		String alList = modelChangePf.getAchieveAlbum(alCount);
		mv.addObject("alList", alList);
		
		//공유 업적 프로필
		int shCount = daoMypage.countShare(session_user_num);
		String shList = modelChangePf.getAchieveShare(shCount);
		mv.addObject("shList", shList);
		
		//kakao 회원가입 유저 판단
		String pathKakao = daoMypage.pathKakao(session_user_num);
		mv.addObject("pathKakao", pathKakao);

		mv.setViewName("mypage/user_account_setting");
		return mv;
	}
	
	@RequestMapping(value = "/check_pw.do")
	public int checkPw(@RequestBody DTOUser dto) {
		int flag = daoMypage.checkPw(dto);
		return flag;
	}
	
	@RequestMapping(value = "/change_pf.do", method = RequestMethod.POST)
	public int modifyData(@RequestBody DTOUser dto) {

		return daoMypage.changePf(dto);
	}
	
	@RequestMapping(value ="reload_profile.do")
	public String reloadProfile(HttpSession session) {
		ModelMyPageProfile model = new ModelMyPageProfile();
		
		//로그인 한 회원의 정보
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		
		//ajax를 통해 프로필 변경 후 다시 불러 올 마이 페이지의 프로필 영역
		String reloadPf = model.reloadPf(daoMypage.reloadPf(session_user_num));
		
		return reloadPf;
	}
	
	@RequestMapping(value ="reload_nav.do")
	public String reloadnav(HttpSession session) {
		
		//로그인 한 회원의 정보
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		DTOUser userSetting = new DTOUser();
		userSetting = dao.userSetting(session_user_num);
		
		//Navbar Model
		ModelNavBar model = new ModelNavBar();
		String reloadNav = model.navBar(userSetting);
		
		return reloadNav;
	}
	
	@RequestMapping(value = "/check_nickname.do", method = RequestMethod.POST)
	public String checkNickName(@RequestBody DTOUser to) {
		
		String result = String.valueOf(dao.checkNickname(to.getUser_nickname()));
		return result;
	}
	
	@RequestMapping(value = "/check_id.do", method = RequestMethod.POST)
	public String checkId(@RequestBody DTOUser to) {
		
		String result = String.valueOf(dao.checkId(to.getUser_mail()));
		return result;
	}
}