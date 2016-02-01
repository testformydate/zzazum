package com.mydate.zzazum.model.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;

import com.mydate.zzazum.model.mapper.LocationUpadateDaoInter;
import com.mydate.zzazum.model.mapper.LocationDataInter;
import com.mydate.zzazum.model.vo.LocationVo;


public class LocationDataDao implements LocationDataInter{
	
	@Autowired
	private LocationUpadateDaoInter apiUpdateDaoInter;
	
	@Override
	public boolean insertApiData(LocationVo location) throws DataAccessException {
		return apiUpdateDaoInter.insertApiData(location);
	}
	
	@Override
	public List<LocationVo> selectAllData() throws DataAccessException {
		return apiUpdateDaoInter.selectAllData();
	}
	
	@Override
	public String selectMaxNo() throws DataAccessException {
		return apiUpdateDaoInter.selectMaxNo();
	}
	
	@Override
	public List<LocationVo> selectSearchData(LocationVo location) throws DataAccessException {
		return apiUpdateDaoInter.selectSearchData(location);
	}
}
