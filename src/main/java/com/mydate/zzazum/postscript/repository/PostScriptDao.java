package com.mydate.zzazum.postscript.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.member.vo.MemberVo;
import com.mydate.zzazum.postscript.vo.PostScriptDetail;
import com.mydate.zzazum.postscript.vo.PostScriptList;

@Repository
public interface PostScriptDao {
	
	@Select("select count(*) from md_postscript")
	public String psListCnt();
	
	@Select("select * from vmd_pslistall limit 0,7")
	public ArrayList<PostScriptList> psListAll();
	
	@Select("select count(*) from md_postscript where ps_email=#{ps_data}")
	public String psSortEmailCnt(String ps_data);
	
	@Select("select * from vmd_pslistall where ps_email=#{ps_data} limit 0,7")
	public ArrayList<PostScriptList> psSortEmail(String ps_data);
	
	@Select("select count(*) from md_postscript where ps_location=#{ps_data}")
	public String psSortLocationCnt(String ps_data);
	
	@Select("select * from vmd_pslistall where ps_location=#{ps_data} limit 0,7")
	public ArrayList<PostScriptList> psSortLocation(String ps_data);

	@Select("select * from vmd_pslistall limit #{track_Num},#{track_Count}")
	public ArrayList<PostScriptList> psListPart(PostScriptList bean);
	
	@Select("select * from vmd_pslistall limit where ps_email=#{ps_email} #{track_Num},#{track_Count}")
	public ArrayList<PostScriptList> psListSortPart(PostScriptList bean);
	
	@Select("select * from vmd_psbestplanner")
	public ArrayList<MemberVo> psBestPlanner();
	
	@Select("select * from vmd_psbest")
	public ArrayList<PostScriptList> psBest();
	
	@Select("select psd.*, mem_primg, mem_nick from md_psdetail as psd inner join md_member on mem_id=pd_email where ps_no=#{ps_no}")
	public ArrayList<PostScriptDetail> psDetail(int ps_no);
	
	@Select("select * from md_postscript where ps_no=#{ps_no}")
	public PostScriptList psDetailMain(int ps_no);
	
	//검색을 위한 쿼리
	@Select("select * from vmd_pslistall where ps_location like concat('%',#{keyword},'%') or ps_title like concat('%',#{keyword},'%') or ps_context like concat('%',#{keyword},'%')")
	public ArrayList<PostScriptList> selectPsSearch(String keyword);
}
