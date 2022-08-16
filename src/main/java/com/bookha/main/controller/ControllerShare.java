package com.bookha.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAOShareBoard;
import com.bookha.main.dto.DTOShareBoard;
import com.bookha.main.dto.DTOShareComment;
import com.bookha.model.ModelLogoHtml;
import com.bookha.model.ModelProfileHtml;
import com.bookha.model.ModelShareCmt;
import com.bookha.model.ModelShareList;

@RestController
public class ControllerShare {
	
	private String title = "나눔과 공유하기";
	private String user_role = "user";
	
	@Autowired
	private DAOShareBoard dao;

	@RequestMapping(value = "/share_list.do")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) {
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
		if(request.getParameter("hash_tag") != null) {
			hashTag = request.getParameter("hash_tag");
		}
		
		ArrayList<DTOShareBoard> lists = new ArrayList<DTOShareBoard>();
		
		if(!hashTag.equals("") && !hashTag.equals("# 전체")) {
			lists = dao.listHashTag(hashTag);
		} else {
			lists = dao.listAll();
		}
		
		ModelShareList sh = new ModelShareList();
		String listTable = sh.ShareList(lists);
		mv.addObject("listTable", listTable);
		
		mv.setViewName("share_board/board_list");
		return mv;
	}
	
	@RequestMapping(value= "/share_list_hashTag.do", method = RequestMethod.POST)
	public String listHashTag(@RequestBody DTOShareBoard to) {
		
		ArrayList<DTOShareBoard> lists = new ArrayList<DTOShareBoard>();
		
		String hashTag = to.getHash_tag();
		if(!hashTag.equals("") && !hashTag.equals("# 전체")) {
			lists = dao.listHashTag(hashTag);
		} else {
			lists = dao.listAll();
		}
		
		ModelShareList sh = new ModelShareList();
		String listTable = sh.ShareList(lists);
		
		return listTable;
	}
	
	@RequestMapping(value = "/share_write.do")
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response) {
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
		
		//user_num
		
		mv.setViewName("share_board/board_write");
		return mv;
	}
	
	@RequestMapping(value = "/share_write_ok.do")
	public ModelAndView writeOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");

		String subject = request.getParameter("subject");
		//int user_num = 
		String content = request.getParameter("content");
		String hash_tag = request.getParameter("hash_tag");
				
		DTOShareBoard to = new DTOShareBoard();
		
		to.setSeq(0);
		to.setSubject(subject);
		//to.setUser_num(user_num);
		to.setContent(content);
		to.setHash_tag(hash_tag);

		int flag = dao.writeOk(to);
		mv.addObject("flag", flag);
		
		mv.setViewName("share_board/board_write_ok");
		return mv;
	}
	
	@RequestMapping(value = "/share_view.do")
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response) {
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
		//user_num
		
		dao.viewHit(seq);
		DTOShareBoard to = dao.view(seq);
		mv.addObject("to", to);
		
		// 댓글
		ArrayList<DTOShareComment> comment_lists = dao.commentList(seq);
		ModelShareCmt sh_cmt = new ModelShareCmt();
		String cmtTable = sh_cmt.cmtList(comment_lists);
		mv.addObject("cmtTable", cmtTable);
		
		mv.setViewName("share_board/board_view");
		return mv;
	}
	
	@RequestMapping(value = "/share_modify.do")
	public ModelAndView modify(HttpServletRequest request, HttpServletResponse response) {
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
		
		int seq = Integer.parseInt( request.getParameter( "seq" ) );
		//user_num
		
		DTOShareBoard to = dao.view(seq);
		//to.setUser_num(user_num);
		mv.addObject("to", to);	
		
		mv.setViewName("share_board/board_modify");
		return mv;
	}
	
	@RequestMapping(value = "/share_modify_ok.do")
	public ModelAndView modifyOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");

		String subject = request.getParameter("subject");
		int seq = Integer.parseInt( request.getParameter( "seq" ) );
		//int user_num = 
		String content = request.getParameter("content");
		String hash_tag = request.getParameter("hash_tag");
				
		DTOShareBoard to = new DTOShareBoard();
		
		to.setSeq(seq);
		to.setSubject(subject);
		//to.setUser_num(user_num);
		to.setContent(content);
		to.setHash_tag(hash_tag);

		int flag = dao.modifyOk(to);
		mv.addObject("flag", flag);
		
		mv.setViewName("share_board/board_modify_ok");
		return mv;
	}
	
	@RequestMapping(value = "/share_delete_ok.do")
	public ModelAndView deleteOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");

		int seq = Integer.parseInt( request.getParameter( "seq" ) );
		//int user_num = 
		
		DTOShareBoard to = new DTOShareBoard();
		to.setSeq(seq);
		//to.setUser_num(user_num);

		int flag = dao.deleteOk(to);
		mv.addObject("flag", flag);
		
		mv.setViewName("share_board/board_delete_ok");
		return mv;
	}
	
	@RequestMapping(value = "/share_cmt_list.do", method = RequestMethod.POST )
	public String commentList(@RequestBody DTOShareComment to) {
		
		ArrayList<DTOShareComment> cmt_lists = dao.commentList(to.getBoard_seq());
		ModelShareCmt cmt_sh = new ModelShareCmt();
		//user_num
		String cmtTable = cmt_sh.cmtList(cmt_lists);
		return cmtTable;
	}
	
	@RequestMapping(value = "/share_cmt_write.do", method = RequestMethod.POST )
	public String commentWriteOk(@RequestBody DTOShareComment to) {
		
		int flag = dao.commentWriteOk(to);
		return "flag";
	}
	
	@RequestMapping(value = "/share_cmt_delete.do", method = RequestMethod.POST )
	public String commentDeleteOk(@RequestBody DTOShareComment to) {
		
		dao.commentDeleteOk(to.getSeq());
		return "";
	}
}