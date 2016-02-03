package com.mydate.zzazum.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mydate.zzazum.member.repository.MembertestInter;
import com.mydate.zzazum.member.vo.MemberTestVo;

@Service
public class MemberTestService {
	
	@Autowired
	private MembertestInter inter;
	
	
	public void memberInsert(MemberTestVo member){
		inter.memberInsert(member);
	}
	
}
