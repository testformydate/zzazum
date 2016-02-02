package com.mydate.zzazum.member.repository;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.member.vo.MemberVo;

@Repository
public interface MemberDao {


	@Insert("insert into md_member(mem_id, mem_nick, mem_pw, mem_tel, mem_bhday) values(#{mem_id}, #{mem_nick}, #{mem_pw}, #{mem_tel}, #{mem_bhday})")
	public void memberJoin(MemberVo memberVo);
	
}
