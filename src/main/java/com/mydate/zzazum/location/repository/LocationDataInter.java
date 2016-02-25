package com.mydate.zzazum.location.repository;



import java.util.ArrayList;

import org.springframework.dao.DataAccessException;

import com.mydate.zzazum.location.vo.CategoryVo;
import com.mydate.zzazum.location.vo.ClikeVo;
import com.mydate.zzazum.location.vo.ClipVo;
import com.mydate.zzazum.location.vo.LocationCategory;
import com.mydate.zzazum.location.vo.LocationVo;
import com.mydate.zzazum.location.vo.SearchKeywordVo;
import com.mydate.zzazum.postscript.vo.PostScriptList;

public interface LocationDataInter {
	public String psListCnt();
	public ArrayList<LocationVo> selectAllData() throws DataAccessException;
	public ArrayList<LocationVo> selectSearchData(String p_addr) throws DataAccessException;
	public String selectMaxNo() throws DataAccessException;
	public boolean insertApiData(LocationVo location) throws DataAccessException;
	public boolean insertSearchKeyword(SearchKeywordVo keyword);
	public ArrayList<LocationVo> selection(String keyword);
	public boolean insertLikeData(ClikeVo like);
	public boolean minusLike(String ps_no);
	public boolean plusLike(String ps_no);
	public boolean deleteLikeData(ClikeVo like);
	public ArrayList<PostScriptList> selectSearchResult(SearchKeywordVo keyword);
	public ArrayList<String> selectLikedNo(String mem_id);
	public ArrayList<LocationCategory> selectLoCate();
	public ArrayList<CategoryVo> selectCategoryAllData();
	public boolean insertClipData(ClipVo clip);
	public boolean minusClip(String ps_no);
	public boolean plusClip(String ps_no);
	public boolean deleteClipData(ClipVo clip);
	public ArrayList<String> selectClipedNo(String mem_id);
	public ArrayList<PostScriptList> selectMyListAll(String mem_id);
}
