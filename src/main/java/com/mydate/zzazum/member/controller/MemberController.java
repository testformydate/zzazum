package com.mydate.zzazum.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mydate.zzazum.member.service.MailService;
import com.mydate.zzazum.member.service.MemberService;
import com.mydate.zzazum.member.vo.MemberInfo;
import com.mydate.zzazum.member.vo.MemberVo;


@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@Autowired
	private MailService mailService;
	
	//회원가입 뷰로 이동하는 컨트롤러
	@RequestMapping("memberinsview")
	public String MemberInsView(){
		
		return "member/member_ins";
	}
	
	//회원가입 프로세스 진행하는 컨트롤러
	@RequestMapping(value = "memberins", method=RequestMethod.POST)
	public void MemberIns(MemberVo memberVo, HttpServletResponse response) throws IOException{
		
		try{
			memberVo.setMem_auth(mailService.createHash(memberVo.getMem_pw(), memberVo.getMem_id()));
		}catch (Exception e){
			System.out.println("메일 전송 및 해쉬코드 생성 오류 " + e);
		}
		
		memberService.memberIns(memberVo);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<script>alert('이제부터는 저희가 짜줌!');"
	      		+ "location.href='/mydate/home';</script>");
		out.println("</body></html>");
		out.close();
	}
	
	//로그인 뷰로 이동하는 컨트롤러
	@RequestMapping("memberlogview")
	public String memberLogView(){
		
		return "member/member_log";
	}
	
	//로그인 프로세스 진행하는 컨트롤러
	@RequestMapping(value = "memberlog", method=RequestMethod.POST)
	public void memberLog(MemberVo memberVo, HttpSession session, HttpServletResponse response) throws IOException{
		MemberInfo memberInfo = new MemberInfo();
		MemberVo member = memberService.memberLog(memberVo);
		memberInfo.setMem_id(member.getMem_id());
		memberInfo.setMem_nick(member.getMem_nick());
		
		session.setAttribute("mem_info", memberInfo);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<script>alert('내가 짜줌!!');"
	      		+ "location.href='/mydate/home';</script>");
		out.println("</body></html>");
		out.close();
	}
	
	//로그아웃 (세션 초기화하는 컨트롤러)
	@RequestMapping("memberlogout")
	public void memberLogout(HttpSession session, HttpServletResponse response) throws IOException{
		session.removeAttribute("mem_id");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<script>alert('다음에 또 짜줌');"
	      		+ "location.href='/mydate/home';</script>");
		out.println("</body></html>");
		out.close();
		/*return "redirect:/home";*/
	}
	
	//마이페이지로 이동하기 위한 컨트롤러
	@RequestMapping("membermypage")
	public String memberMyPage(){
		
		return"member/member_mypage";
	}
	
	//회원 정보 수정뷰로 이동하기 위한 컨트롤러
	@RequestMapping("memberupview")
	public String memberUpView(){
		
		return "member/member_up";
	}
	
	//회원 정보 수정을 위한 컨트롤러
	@RequestMapping(value = "memberup", method = RequestMethod.POST)
	public void memberUp(MemberVo memberVo, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		memberService.memberUp(memberVo);
		PrintWriter out = response.getWriter();
	      out.println("<html><body>");
	      out.println("<script>alert('수정되었습니다');"
	      		+ "location.href='membermypage';</script>");
	      
	      out.println("</body></html>");
	      
	      out.close();
	}
	
	
	//회원 탈퇴를 위한 컨트롤러
	@RequestMapping("memberdel")
	public void memberDel(HttpSession session, HttpServletResponse response) throws IOException{
		
		memberService.memberDel((String)session.getAttribute("mem_id"));
		session.removeAttribute("mem_id");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<script>alert('다음에 꼭 다시 만나요 ㅠ_ㅠ 행복하세요');"
	      		+ "location.href='/mydate/home';</script>");
		out.println("</body></html>");
		out.close();
		
	}
	
	@RequestMapping(value="loginAuthentication", method=RequestMethod.GET)
	public ModelAndView loginAuthentication(@RequestParam("mem_auth") String mem_hash){
		ModelAndView model = new ModelAndView();
		boolean b = memberService.loginAuthentication(mem_hash);
		
		if(b){
			model.setViewName("redirect:/home");
		}else{
			model.setViewName("authFail");
		}
		
		return model;
	}
	
}
