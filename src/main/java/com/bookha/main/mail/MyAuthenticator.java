package com.bookha.main.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator {
	private String fromMail;
	private String fromPassword;
	
	public MyAuthenticator(String fromMail, String fromPassword) {
		// TODO Auto-generated constructor stub
		this.fromMail = fromMail;
		this.fromPassword = fromPassword;
	}
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		// TODO Auto-generated method stub
		return new PasswordAuthentication(fromMail, fromPassword);
	}
}