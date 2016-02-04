package com.mydate.zzazum.location.repository;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.location.vo.LocationVo;

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
	public ArrayList<LocationVo> selectSearchData(LocationVo location) throws DataAccessException {
		return locationUpdateDao.selectSearchData(location);
	}
}
