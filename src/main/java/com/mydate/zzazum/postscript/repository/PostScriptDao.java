package com.mydate.zzazum.postscript.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.member.vo.MemberVo;
import com.mydate.zzazum.postscript.vo.PostScriptComment;
import com.mydate.zzazum.postscript.vo.PostScriptDetail;
import com.mydate.zzazum.postscript.vo.PostScriptLike;
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
	
	@Select("select * from md_comment inner join md_member on co_email = mem_id where co_psno=#{co_psno}")
	public ArrayList<PostScriptComment> psListComment(int co_psno);
	
	@Select("select * from vmd_pslistall where ps_no=#{ps_no}")
	public PostScriptList psDetailMain(int ps_no);
	
	@Insert("insert into md_pslike(mem_id, ps_no) values(#{mem_id}, #{ps_no})")
	public int psInsertLike(PostScriptLike like);
	
	@Delete("delete from md_pslike where mem_id=#{mem_id} and ps_no=#{ps_no}")
	public int psDeleteLike(PostScriptLike like);
	
	@Update("update md_postscript set ps_like = ps_like + #{likeVal} where ps_no = #{ps_no}")
	public int psUpdateLike(PostScriptLike like);
	
	@Select("select * from md_pslike where mem_id=#{ps_email} and ps_no=#{ps_no}")
	public PostScriptLike psLikeMain(PostScriptList list);
	
	@Insert("insert into md_pdlike(mem_id, ps_no, pd_no) values(#{mem_id}, #{ps_no}, #{pd_no})")
	public int pdInsertLike(PostScriptLike like);
	
	@Delete("delete from md_pdlike where mem_id=#{mem_id} and pd_no=#{pd_no}")
	public int pdDeleteLike(PostScriptLike like);
	
	@Update("update md_psdetail set pd_like = pd_like + #{likeVal} where pd_no=#{pd_no}")
	public int pdUpdateLike(PostScriptLike like);
	
	@Select("select * from md_pdlike where mem_id=#{ps_email} and ps_no=#{ps_no}")
	public ArrayList<PostScriptLike> psLike(PostScriptList list);
	
	@Update("update md_postscript set ps_hits = ps_hits+1 where ps_no=#{ps_no}")
	public void psHits(String ps_no);
	
	@Insert("insert into md_comment(co_psno, co_pdno, co_email, co_context) values(#{co_psno}, #{co_pdno}, #{co_email}, #{co_context})")
	public int pdCommentInsert(PostScriptComment comment);
}
