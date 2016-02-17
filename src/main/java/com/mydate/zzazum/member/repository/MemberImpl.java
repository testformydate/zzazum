package com.mydate.zzazum.member.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.member.vo.MemberVo;

@Repository
public class MemberImpl implements MemberInter{
	
	@Autowired
	private MemberDao memberDao;
		
	@Override
	public boolean memberIns(MemberVo memberVo) {
		boolean b = false;
		b = memberDao.memberIns(memberVo);
		System.out.println(b);
		return b;
	}
	
	@Override
	public MemberVo memberLog(MemberVo memberVo) {
		
		return memberDao.memberLog(memberVo);
	}
	
	@Override
	public int memberUp(MemberVo memberVo) {
		
		return memberDao.memberUp(memberVo);
	}
	
	@Override
	public int memberDel(String mem_id) {
		
		return memberDao.memberDel(mem_id);
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
	public int loginAuthentication(String mem_hash) {
		return memberDao.loginAuthentication(mem_hash);
	}
	
	/*@Override
	public boolean memberDel(String mem_id) {
		boolean b = false;
		b = memberDao.memberDel(mem_id);
		return b;
	}*/
}
