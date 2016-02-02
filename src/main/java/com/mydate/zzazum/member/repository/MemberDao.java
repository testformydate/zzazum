package com.mydate.zzazum.member.repository;

import org.apache.ibatis.annotations.Insert;

import com.mydate.zzazum.member.vo.MemberVo;

public interface MemberDao {

	@Insert("insert into md_member(mem_id, mem_nick, mem_pw, mem_tel, mem_bhday, mem_primg) values(#{mem_id}, #{mem_nick}, #{mem_pw}, #{mem_tel}, #{mem_bhday}, #{mem_primg}")
	public void MemberJoin(MemberVo memberVo);
	
}
