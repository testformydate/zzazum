package com.mydate.zzazum.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mydate.zzazum.member.service.MemberService;
import com.mydate.zzazum.member.vo.MemberVo;


@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@RequestMapping("memberinsview")
	public String MemberinsView(){
		
		return "member/member_ins";
	}
	
	@RequestMapping(value = "memberins", method=RequestMethod.POST)
	public String Memberins(MemberVo memberVo){
		
		memberService.memberIns(memberVo);
		
		return "redirect:/home";
	}
	
	@RequestMapping("memberlogview")
	public String memberlogView(){
		
		return "member/member_log";
	}
	
	@RequestMapping(value = "memberlog", method=RequestMethod.POST)
	public String memberlog(MemberVo memberVo, Model model){
		
		System.out.println(memberService.memberLog(memberVo).getMem_id() + memberService.memberLog(memberVo).getMem_pw());
		//memberService.memberLog(memberVo);
		model.addAttribute("mem_id", memberService.memberLog(memberVo).getMem_id());
		return "member/member_logpro";
	}
	
	@RequestMapping("memberlogout")
	public String memberlogout(){
		
		return "member/member_logout";
	}

	@RequestMapping("membermypage")
	public String membermypage(){
		
		return"member/member_mypage";
	}
	
}
