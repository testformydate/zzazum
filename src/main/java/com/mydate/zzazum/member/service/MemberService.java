package com.mydate.zzazum.member.service;

import org.jvnet.hk2.annotations.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.mydate.zzazum.member.repository.MemberDao;
import com.mydate.zzazum.member.vo.MemberVo;

@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;
	
	public void memberJoin(MemberVo memberVo){
		memberDao.MemberJoin(memberVo);
	}
}
