package com.bookha.main.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.main.dao.DAOUser;
import com.bookha.main.dto.DTOUser;
import com.bookha.main.mail.MailSender;
import com.bookha.model.ModelLogoHtml;


@RestController
public class ControllerLogin {
	
	@Autowired
	private DAOUser daoUser;
	
	@GetMapping("/")
	public ModelAndView index(ModelAndView mav) {
		
		mav.setViewName("login/index");
		
		return mav;
	}

	@GetMapping("/login")
	public ModelAndView login(HttpSession session, ModelAndView mav) {
		mav.addObject("logo", new ModelLogoHtml().getLogo().toString());
		mav.setViewName("login/login");
		
		return mav;
	}
	
	@GetMapping("/signUp")
	public ModelAndView signUp(ModelAndView mav) {
		mav.addObject("logo", new ModelLogoHtml().getLogo().toString());
		mav.setViewName("login/signUp");
		
		return mav;
	}
	
	@PostMapping("/signIn.do")
	public DTOUser signIn(HttpServletRequest request, HttpSession session, @RequestBody DTOUser user) {
		session = request.getSession();
		session.setAttribute("login", true);
		
		DTOUser to = daoUser.signIn(user);
		//System.out.println(to.getUser_num());
		session.setAttribute("user_num", to.getUser_num());
		
		// 세션 유지시간 무제한
		session.setMaxInactiveInterval(-1);
		
		return to;
	}
	
	@RequestMapping(value = "/login/mainpage")
	public ModelAndView mainpage(HttpSession session, ModelAndView mav) {

		//로그인 한 회원의 정보
		int session_user_num = Integer.parseInt(String.valueOf(session.getAttribute("user_num")));
		DTOUser userSetting = new DTOUser();
		userSetting = daoUser.userSetting(session_user_num);

		//관리자와 일반유저 구분
		String setting = "";
		if(userSetting.getUser_role().equals("user")) {
			setting = "/mypage.do";
		} else if(userSetting.getUser_role().equals("admin")) {
			setting = "/main.do";
		}
		
		mav.addObject("setting", setting);
		
		mav.setViewName("home/home");
		
		return mav;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
		session.setAttribute("login", false);
		
		session.setAttribute("user_num", 0);
		session.setMaxInactiveInterval(0);
//		session.invalidate();
		
		mav.setViewName("/login/index");
		return mav;
	}
	
	@GetMapping("/findUserId")
	public ModelAndView findUserId(ModelAndView mav) {
		mav.addObject("logo", new ModelLogoHtml().getLogo().toString());
		mav.setViewName("login/findUserId");
		
		return mav;
	}
	
	@PostMapping("/findUserId")
	public List<Map<String, String>> findUserId(@RequestBody DTOUser user) {
		
		return daoUser.findUserId(user);
	}
	
	@GetMapping("/findPw")
	public ModelAndView findPw(ModelAndView mav) {
		mav.addObject("logo", new ModelLogoHtml().getLogo().toString());
		mav.setViewName("login/findPw");
		
		return mav;
	}
	
	@PostMapping("/findPw")
	public String findPw(@RequestBody DTOUser user) {
		
		Map<String, String> map = daoUser.findPw(user);
		
		String toMail = map.get("user_mail");
		String toName = map.get("user_name");
		String subject = "Book-Ha 로그인";
		String content = ""
				+ "<h3>안녕하세요 Book-Ha 입니다.</h3>"
				+ "<p>" + toName + "님,저희 서비스를 이용해 주심에 감사드리며,</p>"
				+ "<p>요청하신 비밀번호를 가입 시 작성한 이메일을 통해 알려드립니다.</p>"
				+ "<p>만약 잘못 수신된 이메일이라면 저희 Book-Ha 운영진에게 연락 부탁 드립니다.</p>"
				+ "<p>감사합니다.</p>"
				+ "<hr />"
				+ "<p>" + toName + "님의 비밀번호는 [" + map.get("user_password") + "] 입니다.</p>";
		
		System.out.println("==============");
		System.out.println(toMail);
		System.out.println(toName);
		System.out.println(subject);
		System.out.println(content);
		System.out.println("==============");
		
		MailSender mailSender = new MailSender();
		mailSender.sendMail(toMail, toName, subject, content);
		
		return "1";
	}
}
