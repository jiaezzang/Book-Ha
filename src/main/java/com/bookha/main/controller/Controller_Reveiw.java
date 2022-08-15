package com.bookha.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAO_Review_Board;
import com.bookha.main.dto.DTO_Review_Board;
import com.bookha.main.dto.DTO_Review_Comment;
import com.bookha.main.dto.DTO_Review_Total;
import com.bookha.model.Model_LogoHtml;
import com.bookha.model.Model_ProfileHtml;
import com.bookha.model.Model_ReviewCommentList;
import com.bookha.model.Model_ReviewList;

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
		
		String hashTag = "";
		if(request.getParameter("hash_tag") != null) {
			hashTag = request.getParameter("hash_tag");
		}
		
		ArrayList<DTO_Review_Board> lists = new ArrayList<DTO_Review_Board>();
		
		if(!hashTag.equals("") && !hashTag.equals("# 전체")) {
			lists = dao.listHashTag(hashTag);
		} else {
			lists = dao.listAll();
		}
		
		//System.out.println(lists.toString());
		
		Model_ReviewList rl = new Model_ReviewList();
		String reviewTable = rl.getReviewList(lists);
		mv.addObject("reviewTable", reviewTable);
		
		mv.setViewName("review_board/board_list");
		return mv;
	}
	
	@RequestMapping(value = "/review_list_hashTag.do", method = RequestMethod.POST)
	public String list_hashTag(@RequestBody DTO_Review_Board to) {
		ArrayList<DTO_Review_Board> lists = new ArrayList<DTO_Review_Board>();
		
		String hashTag = to.getHash_tag();
		
//		System.out.println("hashTag : " + hashTag);
		
		if(!hashTag.equals("") && !hashTag.equals("# 전체")) {
			lists = dao.listHashTag(hashTag);
		} else {
			lists = dao.listAll();
		}
		
//		System.out.println(lists.toString());
		
		Model_ReviewList rl = new Model_ReviewList();
		String reviewTable = rl.getReviewList(lists);
		
//		System.out.println(reviewTable);
		
		return reviewTable;
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
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		dao.view_hit(seq);
		DTO_Review_Board to = dao.view(seq);
		mv.addObject("to", to);
		
		ArrayList<DTO_Review_Comment> com_lists = dao.comment_list(seq);
		Model_ReviewCommentList comment = new Model_ReviewCommentList();
		String commentHtml = comment.getCommentList(com_lists);
		//System.out.println(commentHtml);
		mv.addObject("comment", commentHtml);
		
		mv.setViewName("review_board/board_view");
		return mv;
	}
	
	@RequestMapping(value = "/review_modify.do")
	public ModelAndView modify(HttpServletRequest request, HttpServletResponse response) {
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
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		DTO_Review_Board to = dao.view(seq);
		mv.addObject("to", to);
		
		mv.setViewName("review_board/board_modify");
		return mv;
	}
	
	@RequestMapping(value = "/review_modify_ok.do")
	public ModelAndView modify_ok(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");

		String subject = request.getParameter("subject");
		int seq = Integer.parseInt(request.getParameter("seq"));
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
		
		to.setSeq(seq);
		to.setSubject(subject);
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

		String subject = request.getParameter("subject");
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
		to.setSubject(subject);
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
	
	@RequestMapping(value = "/review_delete.do")
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		String url = "success";
		
		DTO_Review_Board to = new DTO_Review_Board();
		int seq = Integer.parseInt(request.getParameter("seq"));
		int user_num = Integer.parseInt(request.getParameter("user_num"));
		to.setSeq(seq);
		to.setUser_num(user_num);
		
//		System.out.println("seq : " + seq);
//		System.out.println("user_num : " + user_num);
		
		int flag = dao.delete_ok(to);
		
		mv.addObject("flag", flag);
		
		mv.setViewName("review_board/board_delete_ok");
		return mv;
	}
	
	@RequestMapping(value = "/review_comment_list.do", method = RequestMethod.POST)
	public String comment_list(@RequestBody DTO_Review_Comment to) {
		ArrayList<DTO_Review_Comment> com_lists = dao.comment_list(to.getBoard_seq());
		Model_ReviewCommentList comment = new Model_ReviewCommentList();
		String commentHtml = comment.getCommentList(com_lists);
		return commentHtml;
	}
	
	@RequestMapping(value = "/review_comment_write.do", method = RequestMethod.POST)
	public String comment_write(@RequestBody DTO_Review_Comment to) {
//		System.out.println(to.getContent());
//		System.out.println("user_num : " + to.getUser_num());
//		System.out.println("content : " + to.getContent());
//		System.out.println("board_seq : " + to.getBoard_seq());
		int flag = dao.comment_write(to);
//		System.out.println("flag : " + flag);
		return "write success : " + flag;
	}
	
	@RequestMapping(value = "/review_comment_delete.do", method = RequestMethod.POST)
	public String comment_delete(@RequestBody DTO_Review_Comment to) {
//		System.out.println(to.getSeq());
		dao.comment_delete(to.getSeq());
		return "delete success";
	}
}