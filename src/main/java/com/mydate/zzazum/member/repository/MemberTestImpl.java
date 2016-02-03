package com.mydate.zzazum.member.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.member.vo.MemberTestVo;

@Repository
public class MemberTestImpl implements MembertestInter {
	
	@Autowired
	MemberTestDao dao;
	
	@Override
	public boolean memberInsert(MemberTestVo member) {
		boolean b = false;
		b = dao.insertMember(member);
		System.out.println(b);
		return b;
	}
}
