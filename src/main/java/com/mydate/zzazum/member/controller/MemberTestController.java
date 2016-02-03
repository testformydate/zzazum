package com.mydate.zzazum.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mydate.zzazum.member.service.MemberTestService;
import com.mydate.zzazum.member.vo.MemberTestVo;

@Controller
@RequestMapping("member")
public class MemberTestController {
	
	@Autowired
	private MemberTestService service;
	
	@RequestMapping("membertest")
	public String memberView(){
		
		
		
		return "member/membertest";
	}
	
	@RequestMapping("insert")
	public String memberInsert(MemberTestVo member){
		
		service.memberInsert(member);
		
		return "home";
	}
}
