package com.mydate.zzazum.location.repository;



import java.util.ArrayList;

import org.springframework.dao.DataAccessException;

import com.mydate.zzazum.location.vo.LocationVo;
import com.mydate.zzazum.location.vo.SearchKeywordVo;

public interface LocationDataInter {
	public ArrayList<LocationVo> selectAllData() throws DataAccessException;
	public ArrayList<LocationVo> selectSearchData(String p_addr) throws DataAccessException;
	public String selectMaxNo() throws DataAccessException;
	public boolean insertApiData(LocationVo location) throws DataAccessException;
	public boolean insertSearchKeyword(SearchKeywordVo keyword);
}
