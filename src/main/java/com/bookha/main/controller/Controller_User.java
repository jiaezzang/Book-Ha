package com.bookha.main.controller;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bookha.main.service.UserService;
import com.bookha.main.vo.UserVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class Controller_User {
    private final UserService userService;

    @GetMapping("/")
    public String root() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login(){
        return "login/login";
    }
    
    @GetMapping("/logout")
    public String logout(){
        return "login/logout";
    }
    
    @GetMapping("/index")
    public String index(){
        return "login/index";
    }

    @GetMapping("/signUp")
    public String signUpForm() {
        return "login/signUp";
    }

    @PostMapping("/signUp")
    public String signUp(UserVo userVo) {
        userService.joinUser(userVo);
        return "redirect:/login";
    }

    @GetMapping("/accessDenied")
    public String accessDenied() {
        return "login/accessDenied";
    }
    
    @GetMapping("/mainpage")
    public String mainpage() {
    	//return "login/mainpage";
    	return "home/home";
    }
    
    @GetMapping("/user_account_setting")
    public String user_setting() {
    	return "error/error";
    }
   
}
