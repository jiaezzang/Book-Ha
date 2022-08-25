package com.bookha.main.dao;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.bookha.main.dto.DTOMail;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class DAOMailSender {
	
	@Autowired
	JavaMailSender mailSender;
		
	@Value("${spring.mail.username}")
	String sendFrom;

	public DAOMailSender() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean sendMail(DTOMail to) {
		String sendTo = to.getAddress();
		String mailTitle = to.getTitle();
		String mailContent = to.getContent();
			
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
				
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper message = new MimeMessageHelper(mimeMessage,true,"UTF-8");

				message.setTo(sendTo);
				message.setFrom(sendFrom);	//env.getProperty("spring.mail.username")
				message.setSubject(mailTitle);
				message.setText(mailContent, true); //ture : html 형식 사용
					
				//Mail에 img 삽입
//				ClassPathResource resource = new ClassPathResource("../assets/img/logo/logo2.png");
//				message.addInline("img", resource.getFile());
			}
		};
			
		try{
			mailSender.send(preparator);
		} catch (MailException e){
			return false;
		}
		return true;
	}
}