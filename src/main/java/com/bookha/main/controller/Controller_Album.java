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

import com.bookha.main.dao.DAO_Album_Board;
import com.bookha.main.dto.DTO_Album_Board;
import com.bookha.main.dto.DTO_Album_Total;
import com.bookha.model.Model_AlbumList;
import com.bookha.model.Model_ProfileHtml;
import com.oreilly.servlet.MultipartRequest;

@RestController
public class Controller_Album {

	private String title = "찔끔 챌린지";
	private String user_role = "user";

	@Autowired
	private DAO_Album_Board dao;

	@RequestMapping(value = "/album_list.do")
	public ModelAndView challenge(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		//mv.addObject("msg", "get");
		
		mv.addObject("title", title);
		
		Model_ProfileHtml profile = new Model_ProfileHtml();
		if(this.user_role.equals("user")) {
			mv.addObject("profile", profile.getProfile().toString());
		} else if(this.user_role.equals("admin")) {
			mv.addObject("profile", profile.getAdminProfile().toString());
		}
		
		ArrayList<DTO_Album_Board> lists = dao.album_list();
		
		DTO_Album_Total totalLists = new DTO_Album_Total();
		
		
		totalLists.setTotalRecord(lists.size());
		totalLists.setTotalPage(((totalLists.getTotalRecord()-1)/totalLists.getRecordPerPage())+1);
		
		//skip은 페이지 시작번호 
		int skip = ( totalLists.getCpage() -1 ) * totalLists.getRecordPerPage();
		//if( skip != 0 ) rs.absolute(skip);
		
		for( int i=0; i<totalLists.getRecordPerPage()/* && rs.next()*/; i++ ) {
			DTO_Album_Board dto = new DTO_Album_Board();
			
			totalLists.setBoard(lists);
		}
		
		totalLists.setBoard( totalLists.getBoard() );
		totalLists.setStartBlock( ( (totalLists.getCpage() -1 ) / totalLists.getBlockPerPage() ) * totalLists.getBlockPerPage() + 1 );
		totalLists.setEndBlock( ( ( totalLists.getCpage()-1 ) / totalLists.getBlockPerPage() ) * totalLists.getBlockPerPage() + totalLists.getBlockPerPage());
		if( totalLists.getEndBlock() >= totalLists.getTotalPage() ) {
			totalLists.setEndBlock( totalLists.getTotalPage() );
		}
		
		mv.addObject("totalLists", totalLists);
		
		Model_AlbumList model = new Model_AlbumList();
		String albumlist = model.getAlbumList(dao.album_list());
		
		mv.addObject("albumlist", albumlist);
		
		mv.setViewName("challenge_album/challenge");
		return mv;
	}
	

	@RequestMapping(value = "/album_delete.do", method = RequestMethod.POST)
	public String deleteData(@RequestBody DTO_Album_Board dto) {
		//System.out.println(dto.getAl_seq());
		dao.album_delete(dto.getAl_seq());
		
		return "";
	}
	
	@RequestMapping(value = "/album_write.do", method = RequestMethod.POST)
	public String writeData(@RequestBody DTO_Album_Board dto) {
		
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
		dao.album_write(dto);
		
		return "";
	}
	
	@RequestMapping(value = "/album_modify.do", method = RequestMethod.POST)
	public String modifyData(@RequestBody DTO_Album_Board dto) {
		
		String uploadPath = "C:/imageSaveStorage/";
		int maxFileSize = 20 * 1024 * 1024;
		String encType = "utf-8";
		
		System.out.println("dto : " + dto);
		dao.album_modify(dto);
		
		return "";
	}
	
	@RequestMapping(value ="/album_reload.do")
	public String reloadData() {
		Model_AlbumList model = new Model_AlbumList();
		String albumlist = model.getAlbumList(dao.album_list());
		
		return albumlist;
	}
}