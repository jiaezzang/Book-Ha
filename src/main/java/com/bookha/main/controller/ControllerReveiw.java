package com.bookha.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAOReviewBoard;
import com.bookha.main.dao.DAOUser;
import com.bookha.main.dto.DTOReviewBoard;
import com.bookha.main.dto.DTOReviewComment;
import com.bookha.main.dto.DTOReviewTotal;
import com.bookha.main.dto.DTOUser;
import com.bookha.model.ModelLogoHtml;
import com.bookha.model.ModelProfileHtml;
import com.bookha.model.ModelReviewCommentList;
import com.bookha.model.ModelReviewList;
import com.bookha.model.ModelReviewPageNavigation;

@RestController
public class ControllerReveiw {
	
	private String title = "독후감 나누기";
	private String user_role = "user";
	
	@Autowired
	private DAOReviewBoard dao;
	
	@Autowired
	private DAOUser daoUser;

	@RequestMapping(value = "/review_list.do")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		// html 타이틀 태그
		mv.addObject("title", title);
		
		// 프로필
		ModelProfileHtml profile = new ModelProfileHtml();
		if(this.user_role.equals("user")) {
			mv.addObject("profile", profile.getProfile().toString());
		} else if(this.user_role.equals("admin")) {
			mv.addObject("profile", profile.getAdminProfile().toString());
		}
		
		// 로고
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		// 해시태그 검색 전, 검색단어 전처리
		String hashTag = "";
		if(request.getParameter("hashtag") != null) {
			hashTag = request.getParameter("hashtag");
		}
		
		if(hashTag.equals("") || hashTag.equals("# 전체")) {
			hashTag = "#";
		}
		
		// 페이징 처리
		DTOReviewTotal dto = new DTOReviewTotal();
		dto.setHash_tag(hashTag);
		int skip, cpage, blockPerPage, totalPage, totalRecord, startBlock, endBlock;
		
		// 1. 현재 페이지 수 가져오기
		cpage = dto.getCpage();
		if(request.getParameter("cpage") != null) {
			cpage = Integer.parseInt(request.getParameter("cpage"));
			dto.setCpage(cpage);
		}
		
		// 2. 게시글 시작 번호
		skip = (cpage - 1) * dto.getRecordPerPage();
		dto.setSkip(skip);
		
		// 3. 총 게시글 수 DB에서 가져오기
		dto.setTotalRecord(dao.countBoard(hashTag));
		totalRecord = dto.getTotalRecord();
		
		// 4. 전체 페이지 수
		totalPage = ((totalRecord - 1) / dto.getRecordPerPage()) + 1;
		dto.setTotalPage(totalPage);
		
		// 5. 보여질 블록 수 : max = 5
		blockPerPage = dto.getBlockPerPage();
		
		// 6. 시작, 종료 블록 지정
		startBlock = (((cpage - 1) / blockPerPage) * blockPerPage) + 1;
		dto.setStartBlock(startBlock);
		endBlock = (((cpage - 1) / blockPerPage) * blockPerPage) + blockPerPage;
		if(endBlock >= totalPage) {
			endBlock = totalPage;
		}
		dto.setEndBlock(endBlock);
		
		// 리스트 데이터 DB에서 가져오기
		ArrayList<DTOReviewBoard> lists = new ArrayList<DTOReviewBoard>();
		lists = dao.list(dto);
		
		// 가져온 데이터를 HTML 테이블화 시켜주기
		ModelReviewList rl = new ModelReviewList();
		String reviewTable = rl.getReviewList(lists);
		mv.addObject("reviewTable", reviewTable);
		
		// Page Navigation 버튼
		ModelReviewPageNavigation navModel = new ModelReviewPageNavigation();
		String nav = navModel.getPageNav(dto);
		mv.addObject("nav", nav);
		
		// 해시태그 넘겨주기
		if(hashTag.equals("#")) {
			hashTag = "# 전체";
		}
		mv.addObject("hashTag", hashTag);
		
		mv.setViewName("review_board/board_list");
		return mv;
	}
	
	@RequestMapping(value = "/review_list_hashTag.do", method = RequestMethod.POST)
	public String list_hashTag(@RequestBody DTOReviewBoard to, HttpServletRequest request) {
		ArrayList<DTOReviewBoard> lists = new ArrayList<DTOReviewBoard>();
		
		// 해시태그 검색 전, 검색단어 전처리
		String hashTag = to.getHash_tag();
		
		if(hashTag.equals("") || hashTag.equals("# 전체")) {
			hashTag = "#";
		}
		
		// 페이징 처리
		DTOReviewTotal dto = new DTOReviewTotal();
		dto.setHash_tag(hashTag);
		int skip, cpage;
		
		// 1. 현재 페이지 수 가져오기
		cpage = dto.getCpage();
		
		// 2. 게시글 시작 번호
		skip = (cpage - 1) * dto.getRecordPerPage();
		dto.setSkip(skip);
		
		// 리스트 데이터 DB에서 가져오기
		lists = dao.list(dto);
		
		ModelReviewList rl = new ModelReviewList();
		String reviewTable = rl.getReviewList(lists);
		
		return reviewTable;
	}
	
	@RequestMapping(value = "/review_list_pageNav.do", method = RequestMethod.POST)
	public String list_pageNav(@RequestBody DTOReviewBoard to, HttpServletRequest request) {
		ArrayList<DTOReviewBoard> lists = new ArrayList<DTOReviewBoard>();
		
		// 해시태그 검색 전, 검색단어 전처리
		String hashTag = to.getHash_tag();
		
		if(hashTag.equals("") || hashTag.equals("# 전체")) {
			hashTag = "#";
		}
		
		// 페이징 처리
		DTOReviewTotal dto = new DTOReviewTotal();
		dto.setHash_tag(hashTag);
		int skip, cpage, blockPerPage, totalPage, totalRecord, startBlock, endBlock;
		
		// 1. 현재 페이지 수 가져오기
		cpage = dto.getCpage();
		System.out.println("cpage : " + cpage);
		
		// 2. 게시글 시작 번호
		skip = (cpage - 1) * dto.getRecordPerPage();
		dto.setSkip(skip);
		
		// 3. 총 게시글 수 DB에서 가져오기
		dto.setTotalRecord(dao.countBoard(hashTag));
		totalRecord = dto.getTotalRecord();
		
		// 4. 전체 페이지 수
		totalPage = ((totalRecord - 1) / dto.getRecordPerPage()) + 1;
		dto.setTotalPage(totalPage);
		
		// 5. 보여질 블록 수 : max = 5
		blockPerPage = dto.getBlockPerPage();
		
		// 6. 시작, 종료 블록 지정
		startBlock = (((cpage - 1) / blockPerPage) * blockPerPage) + 1;
		dto.setStartBlock(startBlock);
		endBlock = (((cpage - 1) / blockPerPage) * blockPerPage) + blockPerPage;
		if(endBlock >= totalPage) {
			endBlock = totalPage;
		}
		dto.setEndBlock(endBlock);
		
		// 리스트 데이터 DB에서 가져오기
		lists = dao.list(dto);
		
		ModelReviewPageNavigation navModel = new ModelReviewPageNavigation();
		String nav = navModel.getPageNav(dto);
		
		return nav;
	}
	
	@RequestMapping(value = "/review_view.do")
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
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
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		mv.addObject("session_user_num", session_user_num);
		
		dao.viewHit(seq);
		DTOReviewBoard to = dao.view(seq);
		mv.addObject("to", to);
		
		DTOUser userSetting = new DTOUser();
		userSetting = daoUser.userSetting(session_user_num);
		mv.addObject("user", userSetting);
		
		ArrayList<DTOReviewComment> com_lists = dao.commentList(seq);
		ModelReviewCommentList comment = new ModelReviewCommentList();
		String commentHtml = comment.getCommentList(com_lists, session_user_num);
		//System.out.println(commentHtml);
		mv.addObject("comment", commentHtml);
		
		mv.setViewName("review_board/board_view");
		return mv;
	}
	
	@RequestMapping(value = "/review_modify.do")
	public ModelAndView modify(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
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
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		mv.addObject("session_user_num", session_user_num);
		
		DTOReviewBoard to = dao.view(seq);
		to.setUser_num(session_user_num);
		mv.addObject("to", to);
		
		mv.setViewName("review_board/board_modify");
		return mv;
	}
	
	@RequestMapping(value = "/review_modify_ok.do")
	public ModelAndView modify_ok(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");

		String subject = request.getParameter("subject");
		int seq = Integer.parseInt(request.getParameter("seq"));
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		String content = request.getParameter("content");
		String hash_tag = request.getParameter("hash_tag");
		String book_img_url = request.getParameter("book_img_url");
		String book_info_url = request.getParameter("book_info_url");
		String book_title = request.getParameter("book_title");
		String book_author = request.getParameter("book_author");
		String book_publisher = request.getParameter("book_publisher");
		String book_summary = request.getParameter("book_summary");
		
		DTOReviewBoard to = new DTOReviewBoard();
		
		to.setSeq(seq);
		to.setSubject(subject);
		to.setUser_num(session_user_num);
		to.setContent(content);
		to.setHash_tag(hash_tag);
		to.setBook_img_url(book_img_url);
		to.setBook_info_url(book_info_url);
		to.setBook_title(book_title);
		to.setBook_author(book_author);
		to.setBook_publisher(book_publisher);
		to.setBook_summary(book_summary);

		int flag = dao.modifyOk(to);
		
		mv.addObject("flag", flag);
		
		mv.setViewName("review_board/board_process_ok");
		return mv;
	}
	
	@RequestMapping(value = "/review_write.do")
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		if(this.user_role.equals("user")) {
			mv.addObject("profile", profile.getProfile().toString());
		} else if(this.user_role.equals("admin")) {
			mv.addObject("profile", profile.getAdminProfile().toString());
		}
		
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		mv.addObject("session_user_num", session_user_num);
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		mv.setViewName("review_board/board_write");
		return mv;
	}
	
	@RequestMapping(value = "/review_write_ok.do")
	public ModelAndView write_ok(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
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
		
		DTOReviewBoard to = new DTOReviewBoard();
		
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

		int flag = dao.writeOk(to);
		
		mv.addObject("flag", flag);
		
		mv.setViewName("review_board/board_process_ok");
		return mv;
	}
	
	@RequestMapping(value = "/review_delete.do")
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		String url = "success";
		
		DTOReviewBoard to = new DTOReviewBoard();
		int seq = Integer.parseInt(request.getParameter("seq"));
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		to.setSeq(seq);
		to.setUser_num(session_user_num);
		
		int flag = dao.deleteOk(to);
		
		mv.addObject("flag", flag);
		
		mv.setViewName("review_board/board_process_ok");
		return mv;
	}
	
	@RequestMapping(value = "/review_comment_list.do", method = RequestMethod.POST)
	public String comment_list(@RequestBody DTOReviewComment to, HttpSession session) {
		ArrayList<DTOReviewComment> com_lists = dao.commentList(to.getBoard_seq());
		ModelReviewCommentList comment = new ModelReviewCommentList();
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		String commentHtml = comment.getCommentList(com_lists, session_user_num);
		return commentHtml;
	}
	
	@RequestMapping(value = "/review_comment_write.do", method = RequestMethod.POST)
	public String comment_write(@RequestBody DTOReviewComment to) {

		int flag = dao.commentWrite(to);

		return "write success : " + flag;
	}
	
	@RequestMapping(value = "/review_comment_delete.do", method = RequestMethod.POST)
	public String comment_delete(@RequestBody DTOReviewComment to) {

		dao.commentDelete(to.getSeq());
		return "delete success";
	}
}