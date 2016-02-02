package com.mydate.zzazum.member.service;

import javax.annotation.Resource;

import org.jvnet.hk2.annotations.Service;

import com.mydate.zzazum.member.repository.MemberDao;
import com.mydate.zzazum.member.vo.MemberVo;

@Service
public class MemberService {

	@Resource
	private MemberDao memberDao;
	
	public void memberJoin(MemberVo memberVo){
		memberDao.MemberJoin(memberVo);
	}
}
