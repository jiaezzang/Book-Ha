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

import com.bookha.main.dao.DAOMyBoard;
import com.bookha.main.dao.DAOUser;
import com.bookha.main.dto.DTOAlbumTotal;
import com.bookha.main.dto.DTOReviewBoard;
import com.bookha.main.dto.DTOReviewTotal;
import com.bookha.main.dto.DTOShareBoard;
import com.bookha.main.dto.DTOShareTotal;
import com.bookha.main.dto.DTOUser;
import com.bookha.model.ModelAlbumList;
import com.bookha.model.ModelAlbumPageNavigation;
import com.bookha.model.ModelLogoHtml;
import com.bookha.model.ModelMenuBar;
import com.bookha.model.ModelNavBar;
import com.bookha.model.ModelProfileHtml;
import com.bookha.model.ModelReviewList;
import com.bookha.model.ModelReviewPageNavigation;
import com.bookha.model.ModelShareList;
import com.bookha.model.ModelSharePageNavigation;

@RestController
public class ControllerMyboard {
	
	private String title = "마이 페이지";
	private String user_role = "user";
	
	@Autowired
	private DAOUser daoUser;

	@Autowired
	private DAOMyBoard dao;

	@RequestMapping(value = "/myalbum.do")
	public ModelAndView myalbum(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);

		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());

		// 페이징 처리
		DTOAlbumTotal ato = new DTOAlbumTotal();
		int skip, cpage, blockPerPage, totalPage, totalRecord, startBlock, endBlock;
		
		cpage = ato.getCpage();
		if(request.getParameter("cpage") != null) {
			cpage = Integer.parseInt(request.getParameter("cpage"));
			ato.setCpage(cpage);
		}
		
		skip = (cpage - 1) * ato.getRecordPerPage();
		ato.setSkip(skip);
		
		ato.setTotalRecord(dao.countMyalbum());
		totalRecord = ato.getTotalRecord();
		
		totalPage = ((totalRecord - 1) / ato.getRecordPerPage()) + 1;
		ato.setTotalPage(totalPage);
		
		blockPerPage = ato.getBlockPerPage();
		
		startBlock = (((cpage - 1) / blockPerPage) * blockPerPage) + 1;
		ato.setStartBlock(startBlock);
		endBlock = (((cpage - 1) / blockPerPage) * blockPerPage) + blockPerPage;
		if(endBlock >= totalPage) {
			endBlock = totalPage;
		}
		ato.setEndBlock(endBlock);
		
		ModelAlbumPageNavigation pageModel = new ModelAlbumPageNavigation();
		String nav = pageModel.myPageNav(ato);
		mv.addObject("nav", nav);
		
		//로그인 한 회원의 정보
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		DTOUser userSetting = new DTOUser();
		userSetting = daoUser.userSetting(session_user_num);
		mv.addObject("userSetting", userSetting);
		
		mv.addObject("session_user_num", session_user_num);
		
		//앨범 게시글 list
		ModelAlbumList model = new ModelAlbumList();
		String albumlist = model.myAlbumList(dao.myalbumList(ato));
		mv.addObject("albumlist", albumlist);
		
		//Navbar Model
		ModelNavBar navModel = new ModelNavBar();
		String navBar = navModel.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		//좌측 Menu Model
		ModelMenuBar menuModel = new ModelMenuBar();
		String menuBar = menuModel.userMenuBar("myPost");
		mv.addObject("menuBar", menuBar);
		
		mv.setViewName("myboard/my_album_list");
		return mv;
	}
	
	@RequestMapping(value ="/myalbum_reload.do")
	public String reloadData(HttpSession session) {
		ModelAlbumList model = new ModelAlbumList();
		
		//로그인 한 회원의 정보
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		DTOUser userSetting = new DTOUser();
		userSetting = daoUser.userSetting(session_user_num);
		
		//ajax를 통해 수정, 삭제 후 다시 불러 올 앨범의 list 페이지
		String albumlist = model.myAlbumList(dao.myalbumList(new DTOAlbumTotal()));
		
		return albumlist;
	}
	
	@RequestMapping(value = "/myreview_list.do")
	public ModelAndView myreviewList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
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
		
		String hashTag = "";
		if(request.getParameter("hashtag") != null) {
			hashTag = request.getParameter("hashtag");
		}
		
		if(hashTag.equals("") || hashTag.equals("# 전체")) {
			hashTag = "#";
		}
		
		DTOReviewTotal rto = new DTOReviewTotal();
		rto.setHash_tag(hashTag);
		int skip, cpage, blockPerPage, totalPage, totalRecord, startBlock, endBlock;
		
		cpage = rto.getCpage();
		if(request.getParameter("cpage") != null) {
			cpage = Integer.parseInt(request.getParameter("cpage"));
			rto.setCpage(cpage);
		}
		
		skip = (cpage - 1) * rto.getRecordPerPage();
		rto.setSkip(skip);
		
		rto.setTotalRecord(dao.countMyreview(hashTag));
		totalRecord = rto.getTotalRecord();
		
		totalPage = ((totalRecord - 1) / rto.getRecordPerPage()) + 1;
		rto.setTotalPage(totalPage);
		
		blockPerPage = rto.getBlockPerPage();
		
		startBlock = (((cpage - 1) / blockPerPage) * blockPerPage) + 1;
		rto.setStartBlock(startBlock);
		endBlock = (((cpage - 1) / blockPerPage) * blockPerPage) + blockPerPage;
		if(endBlock >= totalPage) {
			endBlock = totalPage;
		}
		rto.setEndBlock(endBlock);
		
		ArrayList<DTOReviewBoard> myreviewLists = new ArrayList<DTOReviewBoard>();
		myreviewLists = dao.myreviewList(rto);
		
		// list
		ModelReviewList rl = new ModelReviewList();
		String reviewTable = rl.myReviewList(myreviewLists);
		mv.addObject("reviewTable", reviewTable);
		
		// paging model
		ModelReviewPageNavigation pageModel = new ModelReviewPageNavigation();
		String nav = pageModel.myPageNav(rto);
		mv.addObject("nav", nav);
		
		if(hashTag.equals("#")) {
			hashTag = "# 전체";
		}
		mv.addObject("hashTag", hashTag);
		
		//상단 Navbar Model
		DTOUser userSetting = new DTOUser();
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		userSetting = daoUser.userSetting(session_user_num);
		ModelNavBar navModel = new ModelNavBar();
		String navBar = navModel.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		//좌측 Menu Model
		ModelMenuBar menuModel = new ModelMenuBar();
		String menuBar = menuModel.userMenuBar("myPost");
		mv.addObject("menuBar", menuBar);
		
		mv.setViewName("myboard/my_review_list");
		return mv;
	}
	
	@RequestMapping(value = "/myreview_list_search.do", method = RequestMethod.POST)
	public String list_search(@RequestBody DTOReviewTotal to, HttpServletRequest request) {
		ArrayList<DTOReviewBoard> myreviewLists = new ArrayList<DTOReviewBoard>();
		
		// 해시태그 검색 전, 검색단어 전처리
		String hashTag = to.getHash_tag();
		
		if(hashTag.equals("") || hashTag.equals("# 전체")) {
			hashTag = "#";
		}
		
		// 페이징 처리
		DTOReviewTotal rto = new DTOReviewTotal();
		rto.setHash_tag(hashTag);
		int skip, cpage;
		
		cpage = rto.getCpage();
		
		skip = (cpage - 1) * rto.getRecordPerPage();
		rto.setSkip(skip);
		
		myreviewLists = dao.myreviewList(rto);
		
		ModelReviewList rl = new ModelReviewList();
		String reviewTable = rl.myReviewList(myreviewLists);
		
		return reviewTable;
	}
	
	@RequestMapping(value = "/myreview_list_pageNav.do", method = RequestMethod.POST)
	public String list_pageNav(@RequestBody DTOReviewTotal to, HttpServletRequest request) {
		
		String hashTag = to.getHash_tag();
		
		if(hashTag.equals("") || hashTag.equals("# 전체")) {
			hashTag = "#";
		}
		
		DTOReviewTotal rto = new DTOReviewTotal();
		rto.setHash_tag(hashTag);
		int skip, cpage, blockPerPage, totalPage, totalRecord, startBlock, endBlock;
		
		cpage = rto.getCpage();
		
		skip = (cpage - 1) * rto.getRecordPerPage();
		rto.setSkip(skip);
		
		rto.setTotalRecord(dao.countMyreview(hashTag));
		totalRecord = rto.getTotalRecord();
		
		totalPage = ((totalRecord - 1) / rto.getRecordPerPage()) + 1;
		rto.setTotalPage(totalPage);
		
		blockPerPage = rto.getBlockPerPage();
		
		startBlock = (((cpage - 1) / blockPerPage) * blockPerPage) + 1;
		rto.setStartBlock(startBlock);
		endBlock = (((cpage - 1) / blockPerPage) * blockPerPage) + blockPerPage;
		if(endBlock >= totalPage) {
			endBlock = totalPage;
		}
		rto.setEndBlock(endBlock);
		
		ModelReviewPageNavigation navModel = new ModelReviewPageNavigation();
		String nav = navModel.myPageNav(rto);
		
		return nav;
	}
	
	@RequestMapping(value = "/myshare_list.do")
	public ModelAndView myshareList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
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
		
		// page
		String hashTag = "";
		if(request.getParameter("hash_tag") != null) {
			hashTag = request.getParameter("hash_tag");
		}
		
		if( hashTag.equals("") || hashTag.equals("# 전체")) {
			hashTag = "#";
		}
		
		DTOShareTotal sto = new DTOShareTotal();
		sto.setHash_tag(hashTag);
		int skip, cpage, blockPerPage, totalPage, totalRecord, startBlock, endBlock;
		
		cpage = sto.getCpage();
		if( request.getParameter("cpage") != null ) {
			cpage = Integer.parseInt(request.getParameter("cpage"));
			sto.setCpage(cpage);
		}
		
		skip = (cpage - 1) * sto.getRecordPerPage();
		sto.setSkip(skip);
		
		sto.setTotalRecord(dao.countMyshare(hashTag));
		totalRecord = sto.getTotalRecord();
		
		totalPage = ( (totalRecord - 1) / sto.getRecordPerPage() ) + 1;
		sto.setTotalPage(totalPage);
		
		blockPerPage = sto.getBlockPerPage();
		
		startBlock = ( ( (cpage - 1) / blockPerPage ) * blockPerPage ) + 1;
		sto.setStartBlock(startBlock);
		endBlock = ( ( (cpage - 1) / blockPerPage ) * blockPerPage ) + blockPerPage;
		if(endBlock >= totalPage) {
			endBlock = totalPage;
		}
		sto.setEndBlock(endBlock);
		
		// list
		ArrayList<DTOShareBoard> myshareLists = new ArrayList<DTOShareBoard>();
		myshareLists = dao.myshareList(sto);
		
		ModelShareList sh = new ModelShareList();
		String listTable = sh.myShareList(myshareLists);
		mv.addObject("listTable", listTable);
		
		ModelSharePageNavigation pageModel = new ModelSharePageNavigation();
		String paging = pageModel.myPageNav(sto);
		mv.addObject("paging", paging);
		
		if(hashTag.equals("#")) {
			hashTag = "# 전체";
		}
		mv.addObject("hashTag", hashTag);
		
		//상단 Navbar Model
		DTOUser userSetting = new DTOUser();
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		userSetting = daoUser.userSetting(session_user_num);
		ModelNavBar navModel = new ModelNavBar();
		String navBar = navModel.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		//좌측 Menu Model
		ModelMenuBar menuModel = new ModelMenuBar();
		String menuBar = menuModel.userMenuBar("myPost");
		mv.addObject("menuBar", menuBar);
		
		mv.setViewName("myboard/my_share_list");
		return mv;
	}
	
	@RequestMapping(value = "/myshare_list_search.do", method = RequestMethod.POST)
	public String listSearch(@RequestBody DTOShareTotal to, HttpServletRequest request) {
		ArrayList<DTOShareBoard> myshareLists = new ArrayList<DTOShareBoard>();
		
		String hashTag = to.getHash_tag();
		
		if( hashTag.equals("") || hashTag.equals("# 전체")) {
			hashTag = "#";
		}
		
		DTOShareTotal sto = new DTOShareTotal();
		sto.setHash_tag(hashTag);
		int skip, cpage;
		
		cpage = sto.getCpage();
		skip = (cpage - 1) * sto.getRecordPerPage();
		sto.setSkip(skip);
		
		myshareLists = dao.myshareList(sto);
		
		ModelShareList sh = new ModelShareList();
		String listTable = sh.myShareList(myshareLists);
		
		return listTable;
	}
	
	@RequestMapping(value= "myshare_list_pageNav.do", method = RequestMethod.POST)
	public String listpageNav(@RequestBody DTOShareTotal to, HttpServletRequest request) {
		
		String hashTag = to.getHash_tag();
		
		if(hashTag.equals("") || hashTag.equals("# 전체")) {
			hashTag = "#";
		}
		
		DTOShareTotal sto = new DTOShareTotal();
		sto.setHash_tag(hashTag);
		int skip, cpage, blockPerPage, totalPage, totalRecord, startBlock, endBlock;
		
		cpage = sto.getCpage();
		skip = (cpage - 1) * sto.getRecordPerPage();
		sto.setSkip(skip);
		
		sto.setTotalRecord(dao.countMyshare(hashTag));
		totalRecord = sto.getTotalRecord();
		
		totalPage = ( (totalRecord - 1) / sto.getRecordPerPage() ) + 1;
		sto.setTotalPage(totalPage);
		
		blockPerPage = sto.getBlockPerPage();
		
		startBlock = (( (cpage - 1) / blockPerPage ) * blockPerPage) + 1;
		sto.setStartBlock(startBlock);
		endBlock = (( (cpage - 1) / blockPerPage ) * blockPerPage) + blockPerPage;
		if(endBlock >= totalPage) {
			endBlock = totalPage;
		}
		sto.setEndBlock(endBlock);
		
		ModelSharePageNavigation pageModel = new ModelSharePageNavigation();
		String paging = pageModel.myPageNav(sto);
		
		return paging;
	}
	
}