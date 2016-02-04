package com.mydate.zzazum.member.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.member.vo.MemberVo;

@Repository
public class MemberImpl implements MemberInter{
	
	@Autowired
	private MemberDao memberDao;
		
	@Override
	public boolean memberJoin(MemberVo memberVo) {
		boolean b = false;
		b = memberDao.memberJoin(memberVo);
		System.out.println(b);
		return b;
	}
	
	@Override
	public MemberVo memberInfo(String mem_id) {
		MemberVo member = memberDao.memberInfo(mem_id);
		return member;
	}
	
	@Override
	public boolean memberModify(MemberVo member) {
		boolean b = false;
		b =	memberDao.memberModify(member);
		return b;
	}
	
	@Override
	public boolean memberDel(String mem_id) {
		boolean b = false;
		b = memberDao.memberDel(mem_id);
		return b;
	}
}
