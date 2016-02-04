package com.mydate.zzazum.member.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.member.vo.MemberVo;

@Repository
public interface MemberDao {

	@Insert("insert into md_member(mem_id, mem_nick, mem_pw, mem_tel, mem_bhday) values(#{mem_id}, #{mem_nick}, #{mem_pw}, #{mem_tel}, #{mem_bhday})")
	public boolean memberIns(MemberVo memberVo);
	
	@Select("select * from md_member where mem_id=#{mem_id} and mem_pw=#{mem_pw}")
	public MemberVo memberLog(MemberVo memberVo);
	
	@Select("select mem_id, mem_nick, mem_pw, mem_tel, mem_bhday from md_member where md_id=#{mem_id}")
	public MemberVo memberInfo(String mem_id);
	
	@Update("update md_member set mem_nick=#{mem_nick}, mem_pw=#{mem_pw}, mem_tel=#{mem_tel}, mem_bhday=#{mem_bhday} where mem_id=#{mem_id}")
	public boolean memberModify(MemberVo member);
	
	@Delete("delete from md_member where mem_id=#{mem_id}")
	public boolean memberDel(String mem_id);
}
