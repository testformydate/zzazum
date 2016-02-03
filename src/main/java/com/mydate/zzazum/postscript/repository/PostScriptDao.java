package com.mydate.zzazum.postscript.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.member.vo.MemberVo;
import com.mydate.zzazum.postscript.vo.PostScriptList;

@Repository
public interface PostScriptDao {
	

	@Select("select * from vmd_pslistall limit 0,7")
	public ArrayList<PostScriptList> psListAll();
	
	@Select("select count(*) from md_postscript")
	public String psListCnt();
	

	@Select("select * from vmd_pslistpart limit #{track_Num},#{track_Count}")
	public ArrayList<PostScriptList> psListPart(PostScriptList bean);
	

	@Select("select * from vmd_psbestplanner")
	public ArrayList<MemberVo> psBestPlanner();
	
	
	@Select("select * from vmd_psbest")
	public ArrayList<PostScriptList> psBest();
	
}
