package com.bookha.main.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
public class DTOMail {
	
	private String address;
	private String title;
	private String content;
	
	public DTOMail(String name, String password) {
		// TODO Auto-generated constructor stub
		this.title = "Book-Ha 로그인";
		this.content = "<html><head><meta charset='UTF-8' /></head><body>"
				+ "<h2>안녕하세요 Book-Ha 입니다.</h2>"
				+ "<p>" + name + "님, 저희 서비스를 이용해 주셔서 감사의 말씀을 드립니다.</p>"
				+ "<p>요청하신 비밀번호를 가입 시 작성한 이메일을 통해 알려드립니다.</p>"
				+ "<br />"
				+ "<p>만약 잘못 수신된 이메일이라면 저희 Book-Ha 운영진에게 연락 부탁 드립니다.</p>"
				+ "<p>감사합니다.</p>"
				+ "<hr />"
				+ "<p>" + name + "님의 비밀번호는 [ <font size='4em' color='#696CFF'><strong>" + password + "</strong></font> ] 입니다.</p>"
				+ "</body></html>";
		this.content = name + "님의 비밀번호는 [" + password + "] 입니다.";
	}
}