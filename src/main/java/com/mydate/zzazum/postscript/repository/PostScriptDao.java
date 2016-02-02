package com.mydate.zzazum.postscript.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.member.vo.MemberVo;
import com.mydate.zzazum.postscript.vo.PostScriptList;

@Repository
public interface PostScriptDao {
	
	@Select("select ps.*,  mem_primg  from md_postscript as ps inner join md_member on mem_id = ps_email order by ps_date desc, ps_no desc limit 0,7")
	public ArrayList<PostScriptList> psListAll();
	
	@Select("select count(*) from md_postscript")
	public String psListCnt();
	
	@Select("select ps.*,  mem_primg  from md_postscript as ps inner join md_member on mem_id = ps_email order by ps_date desc, ps_no desc limit #{track_Num},#{track_Count}")
	public ArrayList<PostScriptList> psListPart(PostScriptList bean);
	
	@Select("select distinct mem_primg from md_postscript inner join md_member on mem_id = ps_email order by ps_hits desc limit 0,4")
	public ArrayList<MemberVo> psBestPlanner();
	
	@Select("select ps.*, mem_primg from md_postscript as ps inner join md_member on mem_id = ps_email where ps_like in(select max(ps_like) from md_postscript group by ps_location) order by ps_location asc;")
	public ArrayList<PostScriptList> psBest();
	
}
