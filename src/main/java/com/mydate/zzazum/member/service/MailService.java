package com.mydate.zzazum.member.service;

import java.security.MessageDigest;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


@Service
public class MailService {
	 
	@Resource(name = "mailSender")
    private JavaMailSender mailSender;
	

    public void sendMail(String email, String hashcode) throws Exception{
    	MimeMessage mimeMessage = mailSender.createMimeMessage();
    	MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
    	
        helper.setTo(email);
        helper.setSubject("짜줌 인증 Email");
        mimeMessage.setContent("안녕하세요 짜줌입니다.<br/>다음 아래의 링크를 누르시면 회원인증이 됩니다. <br/><br/> <a target='_blank' href='http://localhost:8080/mydate/member/loginAuthentication?mem_auth="+hashcode + "'>"
        		+ hashcode + "</a> <br/><br/> 언제나 데이트는 짜줌과 함께!", "text/html; charset=utf-8");
        mailSender.send(mimeMessage);
    }
    
    public String createHash(String password, String email) throws Exception{
		MessageDigest md = MessageDigest.getInstance("MD5");
		String re = password + email;
		String generatedPassword = null;
		
		md.update(re.getBytes("UTF-8"));
        byte[] bytes = md.digest();
        //This bytes[] has bytes in decimal format;
        //Convert it to hexadecimal format
        StringBuilder sb = new StringBuilder();
        for(int i=0; i< bytes.length ;i++)
        {	
            sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
        }
        //Get complete hashed password in hex format
        generatedPassword = sb.toString();
		
        sendMail(email, generatedPassword);

	    return generatedPassword;
	 }

}
