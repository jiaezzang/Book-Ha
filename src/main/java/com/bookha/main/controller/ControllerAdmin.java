package com.bookha.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAOAdminBoard;
import com.bookha.main.dao.DAOUser;
import com.bookha.main.dto.DTOAdminBoard;
import com.bookha.main.dto.DTOAdminTotal;
import com.bookha.main.dto.DTOUser;
import com.bookha.model.ModelAdminList;
import com.bookha.model.ModelAdminPageNavigation;
import com.bookha.model.ModelLogoHtml;
import com.bookha.model.ModelNavBar;
import com.bookha.model.ModelProfileHtml;

@RestController
public class ControllerAdmin {
	
	private String title = "관리자 페이지";
	private String user_role = "admin";
	
	@Autowired
	private DAOAdminBoard dao;
	
	@Autowired
	private DAOUser daoUser;

	@RequestMapping(value = "/list.do")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		// 타이틀
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
		
		// 페이지
		DTOAdminTotal dto = new DTOAdminTotal();
		int skip, cpage, blockPerPage, totalPage, totalRecord, startBlock, endBlock;
		
		// 현재 페이지
		cpage = dto.getCpage();
		if( request.getParameter("cpage") != null ) {
			cpage = Integer.parseInt(request.getParameter("cpage"));
			dto.setCpage(cpage);
		}
			
		// 게시글 시작 번호
		skip = (cpage - 1) * dto.getRecordPerPage();
		dto.setSkip(skip);
				
		// 총 게시글 수
		dto.setTotalRecord(dao.countBoard());
		totalRecord = dto.getTotalRecord();
				
		// 전체 페이지 수
		totalPage = ( (totalRecord - 1) / dto.getRecordPerPage() ) + 1;
		dto.setTotalPage(totalPage);
				
		// 보여질 블록 수 5개
		blockPerPage = dto.getBlockPerPage();
				
		// 블록 시작,끝
		startBlock = ( ( (cpage - 1) / blockPerPage ) * blockPerPage ) + 1;
		dto.setStartBlock(startBlock);
		endBlock = ( ( (cpage - 1) / blockPerPage ) * blockPerPage ) + blockPerPage;
		if(endBlock >= totalPage) {
			endBlock = totalPage;
		}
		dto.setEndBlock(endBlock);
		
		// list
		ArrayList<DTOAdminBoard> lists = new ArrayList<DTOAdminBoard>();
		lists = dao.list(dto);
		
		ModelAdminList ad = new ModelAdminList();
		String AdminList = ad.AdminList(lists);
		mv.addObject("AdminList", AdminList);
		
		// 페이지
		ModelAdminPageNavigation pageModel = new ModelAdminPageNavigation();
		String paging = pageModel.getPageNav(dto);
		mv.addObject("paging", paging);
		
		//Navbar Model
		DTOUser userSetting = new DTOUser();
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		userSetting = daoUser.userSetting(session_user_num);
		ModelNavBar navModel = new ModelNavBar();
		String navBar = navModel.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		mv.setViewName("admin_board/board_list");
		return mv;
	}
	
	@RequestMapping(value = "/main.do")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		// 프로필
		ModelProfileHtml profile = new ModelProfileHtml();
		if(this.user_role.equals("user")) {
			mv.addObject("profile", profile.getProfile().toString());
		} else if(this.user_role.equals("admin")) {
			mv.addObject("profile", profile.getAdminProfile().toString());
		}
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		//Navbar Model
		DTOUser userSetting = new DTOUser();
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		userSetting = daoUser.userSetting(session_user_num);
		ModelNavBar navModel = new ModelNavBar();
		String navBar = navModel.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		mv.setViewName("admin_board/board_main");
		return mv;
	}
		
	@RequestMapping(value = "/write.do")
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		// 프로필
		ModelProfileHtml profile = new ModelProfileHtml();
		if(this.user_role.equals("user")) {
			mv.addObject("profile", profile.getProfile().toString());
		} else if(this.user_role.equals("admin")) {
			mv.addObject("profile", profile.getAdminProfile().toString());
		}

		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		mv.addObject("session_user_num", session_user_num);
		
		//Navbar Model
		DTOUser userSetting = new DTOUser();
		userSetting = daoUser.userSetting(session_user_num);
		ModelNavBar navModel = new ModelNavBar();
		String navBar = navModel.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		mv.setViewName("admin_board/board_write");
		return mv;
	}
	
	@RequestMapping(value = "/write_ok.do")
	public ModelAndView writeOk(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		String subject = request.getParameter("subject");
		int user_num = Integer.parseInt(request.getParameter("user_num"));
		String content = request.getParameter("content");
		
		DTOAdminBoard to = new DTOAdminBoard();
		to.setSeq(0);
		to.setSubject(subject);
		to.setUser_num(user_num);
		to.setContent(content);
		
		int flag = dao.writeOk(to);
		mv.addObject("flag", flag);
		
		mv.setViewName("admin_board/board_update_ok");
		return mv;
	}
	
	@RequestMapping(value = "/view.do")
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		// 프로필
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
		
		DTOAdminBoard to = dao.view(seq);
		int rowno = to.getRowno();
		mv.addObject("to", to);
		
		// 이전글
		DTOAdminBoard to1 = dao.viewBefore(rowno);
		mv.addObject("to1", to1);
		
		// 다음글
		DTOAdminBoard to2 = dao.viewAfter(rowno);
		mv.addObject("to2", to2);
		
		//Navbar Model
		DTOUser userSetting = new DTOUser();
		userSetting = daoUser.userSetting(session_user_num);
		ModelNavBar navModel = new ModelNavBar();
		String navBar = navModel.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		mv.setViewName("admin_board/board_view");
		return mv;
	}
	
	@RequestMapping(value = "/modify.do")
	public ModelAndView modify(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		// 프로필
		ModelProfileHtml profile = new ModelProfileHtml();
		if(this.user_role.equals("user")) {
			mv.addObject("profile", profile.getProfile().toString());
		} else if(this.user_role.equals("admin")) {
			mv.addObject("profile", profile.getAdminProfile().toString());
		}
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());

		int seq = Integer.parseInt( request.getParameter( "seq" ) );
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		mv.addObject("session_user_num", session_user_num);
		
		DTOAdminBoard to = dao.modify(seq);
		to.setUser_num(session_user_num);
		mv.addObject("to", to);
		
		//Navbar Model
		DTOUser userSetting = new DTOUser();
		userSetting = daoUser.userSetting(session_user_num);
		ModelNavBar navModel = new ModelNavBar();
		String navBar = navModel.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		mv.setViewName("admin_board/board_modify");
		return mv;
	}
	
	@RequestMapping(value = "/modify_ok.do")
	public ModelAndView modifyOk(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		String subject = request.getParameter("subject");
		int seq = Integer.parseInt( request.getParameter( "seq" ) );
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num"))); 
		String content = request.getParameter("content");
		
		DTOAdminBoard to = new DTOAdminBoard();
		
		to.setSeq(seq);
		to.setSubject(subject);
		to.setUser_num(session_user_num);
		to.setContent(content);
		
		int flag = dao.modifyOk(to);
		mv.addObject("flag", flag);
		
		mv.setViewName("admin_board/board_modify_ok");
		return mv;
	}
	
	@RequestMapping(value = "/delete_ok.do")
	public ModelAndView deleteOk(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		String url = "success";
		
		DTOAdminBoard to = new DTOAdminBoard();
		int seq = Integer.parseInt( request.getParameter( "seq" ) );
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		to.setSeq(seq);
		to.setUser_num(session_user_num);
		
		int flag = dao.deleteOk(to);
		mv.addObject("flag", flag);
		
		mv.setViewName("admin_board/board_update_ok");
		return mv;
	}
	
	@RequestMapping(value = "/notice.do")
	public ModelAndView notice(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
		
		//Navbar Model
		DTOUser userSetting = new DTOUser();
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		userSetting = daoUser.userSetting(session_user_num);
		ModelNavBar navModel = new ModelNavBar();
		String navBar = navModel.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		// view
		int seq = Integer.parseInt(request.getParameter("seq"));
		//int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		mv.addObject("session_user_num", session_user_num);
		
		DTOAdminBoard to = dao.view(seq);
		int rowno = to.getRowno();
		mv.addObject("to", to);
		
		// 이전글
		DTOAdminBoard to1 = dao.viewBefore(rowno);
		mv.addObject("to1", to1);
		
		// 다음글
		DTOAdminBoard to2 = dao.viewAfter(rowno);
		mv.addObject("to2", to2);
		
		mv.setViewName("admin_board/board_notice");
		return mv;
	}
	
}