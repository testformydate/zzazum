package com.mydate.zzazum.member.repository;

import org.springframework.beans.factory.annotation.Autowired;

import com.mydate.zzazum.member.vo.MemberVo;

public class MemberImpl implements MemberInter{
	
	@Autowired
	private MemberDao memberDao;
		
	@Override
	public void MemberJoin(MemberVo memberVo) {
		memberDao.MemberJoin(memberVo);
		
	}
}
