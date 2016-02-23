package com.mydate.zzazum.location.repository;



import java.util.ArrayList;

import org.springframework.dao.DataAccessException;

import com.mydate.zzazum.location.vo.ClikeVo;
import com.mydate.zzazum.location.vo.LocationCategory;
import com.mydate.zzazum.location.vo.LocationVo;
import com.mydate.zzazum.location.vo.SearchKeywordVo;
import com.mydate.zzazum.postscript.vo.PostScriptList;

public interface LocationDataInter {
	public ArrayList<LocationVo> selectAllData() throws DataAccessException;
	public ArrayList<LocationVo> selectSearchData(String p_addr) throws DataAccessException;
	public String selectMaxNo() throws DataAccessException;
	public boolean insertApiData(LocationVo location) throws DataAccessException;
	public boolean insertSearchKeyword(SearchKeywordVo keyword);
	public ArrayList<LocationVo> selection(String keyword);
	public boolean insertLikeData(ClikeVo like);
	public boolean minusLike(String ps_no);
	public boolean plusLike(String ps_no);
	public boolean deleteLikeData(String ps_no);
	public ArrayList<PostScriptList> selectSearchResult(SearchKeywordVo keyword);
	public ArrayList<String> selectLikedNo(String mem_id);
	public ArrayList<LocationCategory> selectLoCate();
}
