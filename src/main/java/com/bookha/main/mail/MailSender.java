package com.bookha.main.mail;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

public class MailSender {
	private String fromMail;
	private String fromPassword;
	
	public MailSender() {
		// TODO Auto-generated constructor stub
		this.fromMail = "smtp.mail.server.test1@gmail.com";	// 구글 이메일 주소
		this.fromPassword = "tcxusbloxibgdzxn";	// 구글 이메일 비밀번호(앱 비밀번호)
	}
	
	public void sendMail(String toEmail, String toName, String subject, String content) {
		// HashMap => 환경설정
		try {
			Properties props = new Properties();
			
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
			//props.put("mail.smtp.port", "465");
			props.put("mail.smtp.auth", "true");
			
			props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			props.put("mail.smtp.ssl.protocols", "TLSv1.2");
			
			props.put("mail.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			
			props.put("mail.transport.protocol", "true");
			
			MyAuthenticator authenticator = new MyAuthenticator(fromMail, fromPassword);
			
			// 두개 인자를 가지고 세션을 생성해 줘
			Session session = Session.getInstance(props, authenticator);
			
			// 메시지 내용 처리
			MimeMessage msg = new MimeMessage(session);
			// 헤더
			msg.setHeader("Content-Type", "text/plain;charset=UTF-8");
			// 보낼 사람 : to, cc(참조), bcc(숨은 참조)
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail, toName, "UTF-8"));
			// 제목
			msg.setSubject(subject);
			// 내용 : HTML을 사용할거야~
			msg.setContent(content, "text/html;charset=UTF-8");
			
			// 시간
			msg.setSentDate(new java.util.Date());
			
			// 전송
			Transport.send(msg);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			System.out.println("[UnsupportedEncodingException] " + e.getMessage());
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			System.out.println("[MessagingException] " + e.getMessage());
		}
	}
}