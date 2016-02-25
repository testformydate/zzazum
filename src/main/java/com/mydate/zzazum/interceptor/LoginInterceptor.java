package com.mydate.zzazum.interceptor;

import java.io.PrintWriter;

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
			response.sendRedirect("member/memberlogview"); 
            return false;
		}else{
			if(!memberService.memberInfo(mem_id).getMem_auth().equals("auth")){
				/*response.sendRedirect("home");*/
				PrintWriter out = response.getWriter();
				out.println("<html><body>");
				out.println("<script>alert('이메일 인증이 필요합니다.');"
			      		+ "location.href='/mydate/home';</script>");
				out.println("</body></html>");
				out.close();
				return false;
			}
		}
		
		return true;
	}
}
