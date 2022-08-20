package com.bookha.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAOAlbumBoard;
import com.bookha.main.dao.DAOUser;
import com.bookha.main.dto.DTOAlbumBoard;
import com.bookha.main.dto.DTOAlbumTotal;
import com.bookha.main.dto.DTOUser;
import com.bookha.model.ModelAlbumList;
import com.bookha.model.ModelAlbumPageNavigation;
import com.bookha.model.ModelLogoHtml;
import com.bookha.model.ModelNavBar;
import com.bookha.model.ModelProfileHtml;
import com.bookha.model.ModelReviewPageNavigation;
import com.oreilly.servlet.MultipartRequest;

@RestController
public class ControllerAlbum {

	private String title = "찔끔 챌린지";
	private String user_role = "user";

	@Autowired
	private DAOAlbumBoard dao;
	
	@Autowired
	private DAOUser daoUser;

	@RequestMapping(value = "/album_list.do")
	public ModelAndView challenge(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		ModelProfileHtml profile = new ModelProfileHtml();
		if(this.user_role.equals("user")) {
			mv.addObject("profile", profile.getProfile().toString());
		} else if(this.user_role.equals("admin")) {
			mv.addObject("profile", profile.getAdminProfile().toString());
		}
		
		//paging
		// 페이징 처리
		DTOAlbumTotal dto = new DTOAlbumTotal();
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
		dto.setTotalRecord(dao.countBoard());
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
		
		// Page Navigation 버튼
		ModelAlbumPageNavigation pageModel = new ModelAlbumPageNavigation();
		String nav = pageModel.getPageNav(dto);
		mv.addObject("nav", nav);
		
		// 로고
		ModelLogoHtml logo = new ModelLogoHtml();
		mv.addObject("logo", logo.getLogo().toString());
			
		//로그인 한 회원의 정보
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		DTOUser userSetting = new DTOUser();
		userSetting = daoUser.userSetting(session_user_num);
		mv.addObject("userSetting", userSetting);
		
		mv.addObject("session_user_num", session_user_num);
		
		//앨범 게시글 list
		ModelAlbumList model = new ModelAlbumList();
		String albumlist = model.getAlbumList(dao.albumList(dto), session_user_num);
		mv.addObject("albumlist", albumlist);
		
		//Navbar Model
		ModelNavBar navModel = new ModelNavBar();
		String navBar = navModel.navBar(userSetting);
		mv.addObject("navBar", navBar);
		
		mv.setViewName("challenge_album/challenge");
		return mv;
	}
	

	@RequestMapping(value = "/album_delete.do", method = RequestMethod.POST)
	public String deleteData(@RequestBody DTOAlbumBoard dto, HttpSession session) {
		//System.out.println(dto.getAl_seq());
		dao.albumDelete(dto.getAl_seq());

		return "";
	}
	
	@RequestMapping(value = "/album_write.do", method = RequestMethod.POST)
	public String writeData(@RequestBody DTOAlbumBoard dto, HttpSession session) {
		
		String uploadPath = "C:/imageSaveStorage/";
		int maxFileSize = 20 * 1024 * 1024;
		String encType = "utf-8";
		
		System.out.println("dto : " + dto);
		
//		MultipartRequest multi = null;
//		
//		int al_user_Num = dto.getAl_user_num();
//		String al_subject = dto.getAl_subject();
//		String user_Name = dto.getUser_name();
//
//		String imgName = multi.getFilesystemName( dto.getAl_imgName() );
//		long imgSize = 0;
//		if( multi.getFile( dto.getAl_imgName() ) != null ){
//			imgSize = multi.getFile( dto.getAl_imgName() ).length();
//		}
//		//System.out.println(dto.getAl_seq());
		
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		
		dao.albumWrite(dto);
		
		return "";
	}
	
	@RequestMapping(value = "/album_modify.do", method = RequestMethod.POST)
	public String modifyData(@RequestBody DTOAlbumBoard dto, HttpSession session) {
		
		String uploadPath = "C:/imageSaveStorage/";
		int maxFileSize = 20 * 1024 * 1024;
		String encType = "utf-8";
		
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		
		System.out.println("dto : " + dto);
		dao.albumModify(dto);
		
		return "";
	}
	
	@RequestMapping(value ="/album_reload.do")
	public String reloadData(HttpSession session) {
		ModelAlbumList model = new ModelAlbumList();
		
		//로그인 한 회원의 정보
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		
		String albumlist = model.getAlbumList(dao.albumList(new DTOAlbumTotal()), session_user_num);
		
		return albumlist;
	}
}