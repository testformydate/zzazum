package com.mydate.zzazum.community.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.community.vo.CommentVo;
import com.mydate.zzazum.community.vo.CommunityVo;

@Repository
public interface CommunityDao {

	@Insert("insert into md_cm(cm_id, cm_nick, cm_title, cm_content, cm_partno, cm_wdate) values(#{cm_id}, #{cm_nick}, #{cm_title}, #{cm_content}, #{cm_partno}, sysdate())")
	public boolean communityWrite(CommunityVo communityvo); 
	
	@Select("select * from md_cm")
	public ArrayList<CommunityVo> communityList();
	
	@Select("select * from md_cm where cm_partno = #{cm_partno}")
	public ArrayList<CommunityVo> communityPartList(String part_no);
	
	@Select("select * from md_cm where cm_no=#{cm_no}")
	public CommunityVo cm_UpView(String cm_no);
	
	@Select("select * from md_cm where cm_no=#{cm_no}")
	public CommunityVo cm_Detail(String cm_no);
	
	@Update("update md_cm set cm_title=#{cm_title}, cm_content=#{cm_content}, cm_fdate=sysdate() where cm_no=#{cm_no}")
	public int cm_Up(CommunityVo communityVo);
	
	@Delete("delete from md_cm where cm_no=#{cm_no}")
	public int cm_Del(String cm_no);

	@Update("update md_cm set cm_rcnt=cm_rcnt+1 where cm_no=#{cm_no}")
	public int cm_Rcnt(String cm_no);
	
	@Select("select * from md_comt where comt_bono=#{comt_bono}")
	public ArrayList<CommentVo> commentList(String comt_bono);
	
	@Select("select * from md_cm where cm_title like concat('%',#{cm_search},'%')")
	public ArrayList<CommunityVo> communitySearch(CommunityVo communityVo);
		
	
}
