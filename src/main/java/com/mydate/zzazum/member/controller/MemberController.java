package com.mydate.zzazum.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mydate.zzazum.member.service.MemberService;
import com.mydate.zzazum.member.vo.MemberVo;


@Controller
public class MemberController {

	private MemberService memberService;
	
	@RequestMapping("member/memberinsview")
	public String MemberinsView(){
		
		return "/member/member_view";
	}
	
	@RequestMapping("member/memberins")
	public String Memberins(MemberVo memberVo){
		
		
		return "home";
	}
	
}
