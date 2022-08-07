package com.bookha.main.config;

import lombok.RequiredArgsConstructor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import com.bookha.main.service.UserService;

@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final UserService userService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.cors().and().csrf().disable();
        http.authorizeRequests()
                .antMatchers("/").permitAll() // 로그인 권한은 누구나, resources파일도 모든권한
//                .antMatchers("/", "/login", "/singUp", "/accessDenied", "/resources/**").permitAll() // 로그인 권한은 누구나, resources파일도 모든권한
                .antMatchers("/user").hasRole("USER") // USER 접근 허용
                .antMatchers("/admin").hasRole("ADMIN") // ADMIN 접근 허용
//                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/login_proc")
                .defaultSuccessUrl("/mainpage") // 로그인 성공시 URL
                .failureUrl("/accessDenied") // 인증 실패시 URL, 로그인 form으로 파라미터값 error=true로 보낸다.
                .permitAll()
                .and()
                .logout() // 로그아웃
                .permitAll() 
                .logoutUrl("/logout")
                .logoutSuccessUrl("/") // 로그아웃 성공시 URL
                .deleteCookies("JSESSIONID","remember-me") // 로그아웃 후 세션쿠키 삭제
                .addLogoutHandler(new LogoutHandler() {
					
					@Override
					public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
						System.out.println("Logout 처리 핸들러");
						HttpSession session = request.getSession();
						session.invalidate();
					}
				})
                .logoutSuccessHandler(new LogoutSuccessHandler() {
					
					@Override
					public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
							throws IOException, ServletException {
						System.out.println("로그아웃 이후 이동");
						response.sendRedirect("/index");
					}
				})
                .and()
                .exceptionHandling()
                .accessDeniedPage("/accessDenied_page"); // 권한이 없는 대상이 접속을시도했을 때
    }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(new BCryptPasswordEncoder());
    }
}

