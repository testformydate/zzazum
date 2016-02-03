package com.mydate.zzazum.member.repository;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.member.vo.MemberTestVo;

@Repository
public interface MemberTestDao {
	
	@Insert("insert into md_member(mem_id, mem_nick, mem_pw) values(#{mem_id}, #{mem_nick}, #{mem_pw})")
	boolean insertMember(MemberTestVo member);
	
}
