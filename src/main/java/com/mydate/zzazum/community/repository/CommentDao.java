package com.mydate.zzazum.community.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.community.vo.CommentVo;

@Repository
public interface CommentDao {

	@Insert("insert into md_comt(comt_part, comt_bono, comt_id, comt_nick, comt_content, comt_wdate, comt_fdate) values(#{comt_part}, #{comt_bono}, #{comt_id}, #{comt_nick}, #{comt_content}, sysdate(), sysdate())")
	public boolean commentWrite(CommentVo commentVo);
	
}
