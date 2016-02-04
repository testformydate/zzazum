package com.mydate.zzazum.member.service;

import org.jvnet.hk2.annotations.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mydate.zzazum.member.repository.MemberInter;
import com.mydate.zzazum.member.vo.MemberVo;

@Service
@Component("memberService")
public class MemberService {

	@Autowired
	private MemberInter memberInter;
	
	public boolean memberIns(MemberVo memberVo){
		boolean b = false;
		b = memberInter.memberIns(memberVo);
		return b;
	}
	
	public MemberVo memberLog(MemberVo memberVo){
		
		return memberInter.memberLog(memberVo);
	}
	
	public MemberVo memberInfo(String mem_id) {
		MemberVo member = memberInter.memberInfo(mem_id);
		return member;
	}
	
	public boolean memberModify(MemberVo member) {
		boolean b = false;
		b =	memberInter.memberModify(member);
		return b;
	}
	
	public boolean memberDel(String mem_id) {
		boolean b = false;
		b = memberInter.memberDel(mem_id);
		return b;
	}
}
