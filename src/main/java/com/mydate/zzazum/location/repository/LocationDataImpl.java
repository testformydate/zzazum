package com.mydate.zzazum.location.repository;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.location.vo.LocationVo;
import com.mydate.zzazum.location.vo.SearchKeywordVo;

@Repository
public class LocationDataImpl implements LocationDataInter{
	
	@Autowired
	private LocationDao locationUpdateDao;
	
	@Override
	public boolean insertApiData(LocationVo location) throws DataAccessException {
		return locationUpdateDao.insertApiData(location);
	}
	
	@Override
	public ArrayList<LocationVo> selectAllData() throws DataAccessException {
		return locationUpdateDao.selectAllData();
	}
	
	@Override
	public String selectMaxNo() throws DataAccessException {
		return locationUpdateDao.selectMaxNo();
	}
	
	@Override
	public ArrayList<LocationVo> selectSearchData(String p_addr) throws DataAccessException {
		return locationUpdateDao.selectSearchData(p_addr);
	}
	
	@Override
	public boolean insertSearchKeyword(SearchKeywordVo keyword) {
		return locationUpdateDao.insertSearchKeyword(keyword);
	}
}
