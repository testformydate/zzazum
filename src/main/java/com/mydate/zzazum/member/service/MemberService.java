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
	
	public int memberUp(MemberVo memberVo){
		
		return memberInter.memberUp(memberVo);
	}
	
	public int memberDel(String mem_id){
		
		return memberInter.memberDel(mem_id);
	}
	
	public MemberVo memberInfo(String mem_id) {
		MemberVo member = memberInter.memberInfo(mem_id);
		System.out.println("vv");
		System.out.println(member.getMem_auth());
		return member;
	}
	
	public boolean memberModify(MemberVo member) {
		boolean b = false;
		b =	memberInter.memberModify(member);
		return b;
	}
	
	public boolean loginAuthentication(String mem_hash){
		boolean b = false;
		
		if(memberInter.loginAuthentication(mem_hash)>0){
			b = true;
		}
		
		return b;
	}
	
	public String idChecker(String mem_id){
		return memberInter.idChecker(mem_id);
	}
	
	public String nameChecker(String mem_nick){
		return memberInter.nameChecker(mem_nick);
	}
	
	public String logChecker(MemberVo memberVo){
		return memberInter.logChecker(memberVo);
	}
	
	/*public boolean memberDel(String mem_id) {
		boolean b = false;
		b = memberInter.memberDel(mem_id);
		return b;
	}*/
}
