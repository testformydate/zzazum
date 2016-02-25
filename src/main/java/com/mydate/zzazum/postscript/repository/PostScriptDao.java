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
import com.mydate.zzazum.postscript.vo.PostScriptFile;
import com.mydate.zzazum.postscript.vo.PostScriptLike;
import com.mydate.zzazum.postscript.vo.PostScriptList;

@Repository
public interface PostScriptDao {
	
	@Select("select count(*) from md_postscript")
	public String psListCnt();
	
	@Select("select * from vmd_pslistall limit 0,15")
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
	

	//검색을 위한 쿼리
	@Select("select * from vmd_pslistall where ps_location like concat('%',#{keyword},'%') or ps_title like concat('%',#{keyword},'%') or ps_context like concat('%',#{keyword},'%')")
	public ArrayList<PostScriptList> selectPsSearch(String keyword);

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
	
	@Delete("delete from md_comment where co_no=#{co_no}")
	public int pdCommentDelete(PostScriptComment comment);
	
	@Insert("insert into md_postscript(ps_email, ps_date, ps_image, ps_title, ps_context, ps_clip, ps_like, ps_hits, ps_location) values(#{ps_email}, now(), #{ps_image}, #{ps_title}, #{ps_context}, 0, 0, 0, #{ps_location})")
	public int psDataInssert(PostScriptList dto);
	
	@Select("select max(ps_no) from md_postscript where ps_email=#{ps_email}")
	public int psInsertNum(String ps_email);
	
	@Insert("insert into md_psdetail(ps_no, pl_id, pd_email, pd_context, pd_like, pd_date, pd_image) value(#{ps_no}, #{pl_id}, #{pd_email}, #{pd_context}, 0, now(), #{pd_image})")
	public int pdDataInsert(PostScriptDetail dto);
	
	@Insert("insert into md_psfile(pf_name, pf_email, pf_auth) values(#{pf_name}, #{pf_email}, 0)")
	public int tempFileUp(PostScriptFile dtoFile);
	
	@Update("update md_psfile set pf_auth = 1 where pf_email = #{pf_email}")
	public void tmepFileSet(PostScriptFile dtoFile);
	
	@Select("select * from md_psfile where pf_email = #{pf_email} and pf_auth=0")
	public ArrayList<PostScriptFile> tempFileSe(PostScriptFile dtoFile);
	
	@Select("select count(pf_name) from md_psfile where pf_email = #{pf_email}")
	public int tempFileMa(PostScriptFile dtoFile);
	
	@Delete("delete from md_psfile where pf_email = #{pf_email}")
	public int tmepFielDe(String pf_email);
}
