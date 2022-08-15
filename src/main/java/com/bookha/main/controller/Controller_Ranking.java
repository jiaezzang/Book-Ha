package com.bookha.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAO_Album_Board;
import com.bookha.main.dao.DAO_Ranking;
import com.bookha.main.dto.DTO_Album_Board;
import com.bookha.main.dto.DTO_Attendance;
import com.bookha.main.dto.DTO_Review_Board;
import com.bookha.main.dto.DTO_Share_Board;
import com.bookha.main.dto.DTO_User;
import com.bookha.model.Model_AlbumList;
import com.bookha.model.Model_LogoHtml;
import com.bookha.model.Model_ProfileHtml;
import com.bookha.model.Model_Ranking;

@RestController
public class Controller_Ranking {
	
	private String title = "업적과 순위";
	private String user_role = "user";
	
	@Autowired
	private DAO_Ranking dao;

	@RequestMapping(value = "/ranking.do")
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
		
		//dao.check_attendance(request.getUser_num);
		//dao.add_attendance(request.getUser_num);
		ArrayList<DTO_Attendance> atLists = new ArrayList<DTO_Attendance>();
		ArrayList<DTO_Review_Board> reviewLists = new ArrayList<DTO_Review_Board>();
		ArrayList<DTO_Album_Board> albumLists = new ArrayList<DTO_Album_Board>();
		ArrayList<DTO_Share_Board> shareLists = new ArrayList<DTO_Share_Board>();

		atLists = dao.count_attendance();
		reviewLists = dao.review_ranking();
		albumLists = dao.album_ranking();
		shareLists = dao.share_ranking();
		
		//attendance ranking 1-3 순위 리스트
		ArrayList<DTO_User> userLists1 = new ArrayList<DTO_User>();
		for( DTO_Attendance list : atLists ) {
			//System.out.println(list.getUser_num());
			userLists1.add(dao.get_profile(list.getAt_num()));
		}
		
		//review ranking 1-3 순위 리스트
		ArrayList<DTO_User> userLists2 = new ArrayList<DTO_User>();
		for( DTO_Review_Board list : reviewLists ) {
			//System.out.println(list.getUser_num());
			userLists2.add(dao.get_profile(list.getUser_num()));
		}
		
		//album ranking 1-3 순위 리스트
		ArrayList<DTO_User> userLists3 = new ArrayList<DTO_User>();
		for( DTO_Album_Board list : albumLists ) {
			//System.out.println(list.getAl_user_num());
			userLists3.add(dao.get_profile(list.getAl_user_num()));
		}
		
		//share ranking 1-3 순위 리스트
		ArrayList<DTO_User> userLists4 = new ArrayList<DTO_User>();
		for( DTO_Share_Board list : shareLists ) {
			//System.out.println(list.getUser_num());
			userLists4.add(dao.get_profile(list.getUser_num()));
		}
		
		//System.out.println("유저리스트 : " + userLists1.toString());
		
		Model_Ranking model = new Model_Ranking();
		String atList = model.getRankingList("부카의 출석왕", userLists1);
		String reviewList = model.getRankingList("이 주의 리뷰왕", userLists2);
		String albumList = model.getRankingList("이 주의 인증왕", userLists3);
		String shareList = model.getRankingList("이 주의 공유왕", userLists4);
		
		mv.addObject("atList", atList);
		mv.addObject("reviewList", reviewList);
		mv.addObject("albumList", albumList);
		mv.addObject("shareList", shareList);
		
		
		mv.setViewName("ranking/ranking");
		return mv;
	}
}