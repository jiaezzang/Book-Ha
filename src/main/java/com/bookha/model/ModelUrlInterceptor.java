package com.bookha.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class ModelUrlInterceptor implements HandlerInterceptor {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	    logger.info("[preHandle]");
	    
	    HttpSession session = request.getSession();
	    Boolean login = false;
	    if(session.getAttribute("login") != null) {
	    	login = (Boolean)session.getAttribute("login");
	    }
//	    System.out.println("login : " + login);
	    if(login == false) {
			response.sendRedirect("/login");
		}
	    return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	    logger.info("[postHandle]");
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception ex) throws Exception {
	    logger.info("[afterCompletion]");
	}
}