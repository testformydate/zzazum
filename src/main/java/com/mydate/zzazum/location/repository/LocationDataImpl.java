package com.mydate.zzazum.location.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.location.vo.LocationVo;

@Repository
public class LocationDataImpl implements LocationDataInter{
	
	@Autowired
	private LocationUpdateDao locationUpdateDao;
	
	@Override
	public boolean insertApiData(LocationVo location) throws DataAccessException {
		boolean b = locationUpdateDao.insertApiData(location);
		return b;
	}
	
	@Override
	public List<LocationVo> selectAllData() throws DataAccessException {
		List<LocationVo> list = locationUpdateDao.selectAllData();
		return list;
	}
	
	@Override
	public String selectMaxNo() throws DataAccessException {
		String maxNo = locationUpdateDao.selectMaxNo();
		return null;
	}
	
	@Override
	public List<LocationVo> selectSearchData(LocationVo location) throws DataAccessException {
		List<LocationVo> list = locationUpdateDao.selectSearchData(location);
		return null;
	}
}
