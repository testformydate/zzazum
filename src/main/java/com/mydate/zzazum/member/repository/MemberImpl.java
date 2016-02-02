package com.mydate.zzazum.member.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.member.vo.MemberVo;

@Repository
public class MemberImpl implements MemberInter{
	
	@Autowired
	private MemberDao memberDao;
		
	@Override
	public void memberJoin(MemberVo memberVo) {
		memberDao.memberJoin(memberVo);
		
	}
}
