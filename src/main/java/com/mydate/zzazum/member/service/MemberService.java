package com.mydate.zzazum.member.service;

import org.jvnet.hk2.annotations.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mydate.zzazum.member.repository.MemberDao;
import com.mydate.zzazum.member.repository.MemberInter;
import com.mydate.zzazum.member.vo.MemberVo;

@Service
@Component("memberService")
public class MemberService {

	@Autowired
	private MemberInter memberInter;
	
	public void memberJoin(MemberVo memberVo){
		memberInter.memberJoin(memberVo);
	}
}
