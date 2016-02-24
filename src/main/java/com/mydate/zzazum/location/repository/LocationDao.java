package com.mydate.zzazum.location.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mydate.zzazum.location.vo.CategoryVo;
import com.mydate.zzazum.location.vo.ClikeVo;
import com.mydate.zzazum.location.vo.ClipVo;
import com.mydate.zzazum.location.vo.LocationCategory;
import com.mydate.zzazum.location.vo.LocationVo;
import com.mydate.zzazum.location.vo.SearchKeywordVo;
import com.mydate.zzazum.location.vo.SearchResultVo;
import com.mydate.zzazum.postscript.vo.PostScriptList;

public interface LocationDao {
	
	@Select("select * from vmd_location")
	public ArrayList<LocationVo> selectAllData();
	
	@Select("select * from vmd_location where p_addr like concat('%',#{p_addr},'%') or p_name like concat('%',#{p_addr},'%')")
	public ArrayList<LocationVo>  selectSearchData(String p_addr);
	
	@Select("select max(p_no) from md_location")
	public String selectMaxNo();
	
	@Select("select * from md_category")
	public ArrayList<CategoryVo> selectCategoryAllData();
	
	@Insert("insert into md_location(p_id,p_name,p_addr,p_lat,p_lng,p_image) values(#{p_id},#{p_name},#{p_addr},#{p_lat},#{p_lng},#{p_image})")
	public boolean insertApiData(LocationVo location);
	
	@Select("select ps_no from md_pslike where mem_id=#{mem_id}")
	public ArrayList<String> selectLikedNo(String mem_id);
	
	//For search
	
	@Insert("insert into md_searchkeyword(k_mid, k_word, k_sdate) values(#{k_mid},#{k_word}, now())")
	public boolean insertSearchKeyword(SearchKeywordVo keyword);
	
	@Select("select * from vmd_pslistall where (ps_email like concat('%',#{keyword1},'%') or ps_title like concat('%',#{keyword1},'%') or ps_context like concat('%',#{keyword1},'%')) and (ps_email like concat('%',#{keyword2},'%') or ps_title like concat('%',#{keyword2},'%') or ps_context like concat('%',#{keyword2},'%'))")
	public ArrayList<PostScriptList> selectSearchResult(SearchKeywordVo keyword);
	
	//for selection box
	@Select("select * from vmd_location where p_category like #{keyword}")
	public ArrayList<LocationVo> selection(String keyword);
	
	//like
	@Insert("insert into md_pslike(mem_id,ps_no,li_date) values(#{mem_id},#{ps_no},now())")
	public boolean insertLikeData(ClikeVo like);
	
	@Update("update md_postscript set ps_like=ps_like-1 where ps_no=#{ps_no}")
	public boolean minusLike(String ps_no);
	
	@Update("update md_postscript set ps_like=ps_like+1 where ps_no=#{ps_no}")
	public boolean plusLike(String ps_no);
	
	@Delete("delete from md_pslike where ps_no=#{ps_no} and mem_id=#{mem_id}")
	public boolean deleteLikeData(ClikeVo like);
	
	@Select("select * from md_locategory")
	public ArrayList<LocationCategory> selectLoCate();
	
	@Insert("insert into md_clip(mem_id,ps_no,c_date) values(#{mem_id},#{ps_no},now())")
	public boolean insertClipData(ClipVo clip);
	
	@Update("update md_postscript set ps_clip=ps_clip-1 where ps_no=#{ps_no}")
	public boolean minusClip(String ps_no);
	
	@Update("update md_postscript set ps_clip=ps_clip+1 where ps_no=#{ps_no}")
	public boolean plusClip(String ps_no);
	
	@Delete("delete from md_clip where ps_no=#{ps_no} and mem_id=#{mem_id}")
	public boolean deleteClipData(ClipVo clip);
	
	@Select("select ps_no from md_clip where mem_id=#{mem_id}")
	public ArrayList<String> selectClipedNo(String mem_id);
}
