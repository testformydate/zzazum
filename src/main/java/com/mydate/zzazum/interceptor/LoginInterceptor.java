package com.mydate.zzazum.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mydate.zzazum.member.service.MemberService;

@Controller
public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	private MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String mem_id = (String)request.getSession().getAttribute("mem_id");
		
		if(mem_id == null){
			System.out.println("no");
			response.sendRedirect("member/memberlogview"); 
            return false;
		}else{
			if(!memberService.memberInfo(mem_id).getMem_auth().equals("auth")){
				response.sendRedirect("home");
				return false;
			}
		}
		
		return true;
	}
}
