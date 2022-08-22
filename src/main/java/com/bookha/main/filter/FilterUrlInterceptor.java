package com.bookha.main.filter;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class FilterUrlInterceptor implements HandlerInterceptor {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private Boolean login = false;
	private int session_user_num = 0;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//	    logger.info("[preHandle]");
	    
	    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
	    response.addHeader("Cache-Control", "post-check=0, pre-check=0");
	    response.setHeader("Pragma", "no-cache");
	    
	    HttpSession session = request.getSession(false);
	    
	    if(session != null) {
		    if(session.getAttribute("login") != null) {
		    	this.login = (Boolean)session.getAttribute("login");
		    }
		    if(session.getAttribute("user_num") != null) {
		    	this.session_user_num = (int)session.getAttribute("user_num");
		    }
	    }
	    
//	    logger.info("[preHandle] [value] login : " + this.login);
//	    logger.info("[preHandle] [value] user_num : " + this.session_user_num);
	    if(this.login == false) {
			response.sendRedirect("/login");
			return false;
		}
	    return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//	    logger.info("[postHandle]");
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception ex) throws Exception {
//	    logger.info("[afterCompletion]");
	}
}