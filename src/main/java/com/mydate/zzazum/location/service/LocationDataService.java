package com.mydate.zzazum.location.service;

import java.io.IOException;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.mydate.zzazum.location.repository.LocationDao;
import com.mydate.zzazum.location.vo.LocationVo;

@Service
public class LocationDataService{
	
	private static final Logger LOGGER = LoggerFactory.getLogger(LocationDataService.class);
	
	@Autowired
	private LocationDao locationDao;
	
	public boolean insertApiData(LocationVo location) throws DataAccessException,IOException {
			
		return locationDao.insertApiData(location);
	}
	
	public ArrayList<LocationVo> selectAllData() throws DataAccessException {
		return locationDao.selectAllData();
	}
	
	public String selectMaxNo() throws DataAccessException {
		return locationDao.selectMaxNo();
	}
	
	public ArrayList<LocationVo> selectSearchData(LocationVo location) throws DataAccessException {
		return locationDao.selectSearchData(location);
	}
}
