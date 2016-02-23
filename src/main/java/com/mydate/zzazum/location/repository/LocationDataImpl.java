package com.mydate.zzazum.location.repository;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.location.vo.CategoryVo;
import com.mydate.zzazum.location.vo.ClikeVo;
import com.mydate.zzazum.location.vo.ClipVo;
import com.mydate.zzazum.location.vo.LocationCategory;
import com.mydate.zzazum.location.vo.LocationVo;
import com.mydate.zzazum.location.vo.SearchKeywordVo;
import com.mydate.zzazum.postscript.vo.PostScriptList;

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
	
	@Override
	public ArrayList<LocationVo> selection(String keyword) {
		return locationUpdateDao.selection(keyword);
	}
	
	@Override
	public boolean insertLikeData(ClikeVo like) {
		return locationUpdateDao.insertLikeData(like);
	}
	
	@Override
	public boolean minusLike(ClikeVo like) {
		return locationUpdateDao.minusLike(like);
	}
	
	@Override
	public boolean plusLike(ClikeVo like) {
		return locationUpdateDao.plusLike(like);
	}
	
	@Override
	public boolean deleteLikeData(ClikeVo like) {
		return locationUpdateDao.deleteLikeData(like);
	}
	
	@Override
	public ArrayList<PostScriptList> selectSearchResult(SearchKeywordVo keyword) {
		return locationUpdateDao.selectSearchResult(keyword);
	}
	
	@Override
	public ArrayList<String> selectLikedNo(String mem_id) {
		return locationUpdateDao.selectLikedNo(mem_id);
	}
	
	@Override
	public ArrayList<LocationCategory> selectLoCate() {
		return locationUpdateDao.selectLoCate();
	}
	
	@Override
	public ArrayList<CategoryVo> selectCategoryAllData() {
		return locationUpdateDao.selectCategoryAllData();
	}
	
	@Override
	public boolean insertClipData(ClipVo clip) {
		return locationUpdateDao.insertClipData(clip);
	}
	
	@Override
	public boolean minusClip(ClipVo clip) {
		return locationUpdateDao.minusClip(clip);
	}
	
	@Override
	public boolean plusClip(ClipVo clip) {
		return locationUpdateDao.plusClip(clip);
	}
	
	@Override
	public boolean deleteClipData(ClipVo clip) {
		return locationUpdateDao.deleteClipData(clip);
	}
	
	@Override
	public ArrayList<String> selectClipedNo(String mem_id) {
		return locationUpdateDao.selectClipedNo(mem_id);
	}
}
