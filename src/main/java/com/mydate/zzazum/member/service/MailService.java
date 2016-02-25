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
        helper.setSubject("MyDate 인증 메일");
        mimeMessage.setContent("<p>안녕하세요! MyDate입니다.</p><p>다음의 링크를 누르시면 회원인증이 됩니다.</p>"
        		+ "<a target='_blank' href='http://localhost:8080/mydate/member/loginAuthentication?mem_auth="+hashcode + "'>"
        		+ hashcode + "</a></p><p>Enjoy your hangout with MyDate!</p>", "text/html; charset=utf-8");
        mailSender.send(mimeMessage);
    }
    
    public void sendLoverMail(String email, String nick) throws Exception{
    	MimeMessage mime = mailSender.createMimeMessage();
    	MimeMessageHelper helper = new MimeMessageHelper(mime, false, "utf-8");
    	
    	helper.setTo(email);
    	helper.setSubject(nick + "님이 MyDate에 초대하셨습니다!");
    	mime.setContent("<h3>안녕하세요, 데이트 동반자 MyDate입니다!</h3>"
    			+ "<p>" + nick + "님과 함께 아름다운 추억을 만들어 보세요!</p>"
    			+ "<p><a href='http://localhost:8080/mydate/member/memberinsview'>MyDate</a>는 당신을 기다리고 있습니다.</p>"
    			+ "<p>Enjoy your hangout with MyDate!</p>", "text/html; charset=utf-8");
    	mailSender.send(mime);
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
