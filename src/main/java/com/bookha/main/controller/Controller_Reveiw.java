package com.bookha.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAO_Review_Board;
import com.bookha.main.dto.DTO_Review_Board;
import com.bookha.model.Model_LogoHtml;
import com.bookha.model.Model_ProfileHtml;

@RestController
public class Controller_Reveiw {
	
	private String title = "독후감 나누기";
	private String user_role = "user";
	
	@Autowired
	private DAO_Review_Board dao;

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
	
	@RequestMapping(value = "/review_write_ok.do")
	public ModelAndView write_ok(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");

		String b_title = request.getParameter("b_title");
		int user_num = Integer.parseInt(request.getParameter("user_num"));
		String content = request.getParameter("content");
		String hash_tag = request.getParameter("hash_tag");
		String book_img_url = request.getParameter("book_img_url");
		String book_info_url = request.getParameter("book_info_url");
		String book_title = request.getParameter("book_title");
		String book_author = request.getParameter("book_author");
		String book_publisher = request.getParameter("book_publisher");
		String book_summary = request.getParameter("book_summary");
		
		DTO_Review_Board to = new DTO_Review_Board();
		to.setSeq(0);
		to.setTitle(b_title);
		to.setUser_num(user_num);
		to.setContent(content);
		to.setHash_tag(hash_tag);
		to.setBook_img_url(book_img_url);
		to.setBook_info_url(book_info_url);
		to.setBook_title(book_title);
		to.setBook_author(book_author);
		to.setBook_publisher(book_publisher);
		to.setBook_summary(book_summary);

		int flag = dao.write_ok(to);
		
		mv.addObject("flag", flag);
		
		mv.setViewName("review_board/board_write_ok");
		return mv;
	}
}