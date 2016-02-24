package com.mydate.zzazum.location.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.mydate.zzazum.location.repository.LocationDao;
import com.mydate.zzazum.location.vo.CategoryVo;
import com.mydate.zzazum.location.vo.ClikeVo;
import com.mydate.zzazum.location.vo.ClipVo;
import com.mydate.zzazum.location.vo.LocationCategory;
import com.mydate.zzazum.location.vo.LocationVo;
import com.mydate.zzazum.location.vo.NaverSearchResultVo;
import com.mydate.zzazum.location.vo.SearchKeywordVo;
import com.mydate.zzazum.postscript.vo.PostScriptList;

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
	
	public ArrayList<LocationVo> selectSearchData(String name) throws DataAccessException {
		return locationDao.selectSearchData(name);
	}
	
	public ArrayList<NaverSearchResultVo> selectNaverSearch(String query) throws IOException{
		ArrayList<NaverSearchResultVo> list = new ArrayList<NaverSearchResultVo>();
		StringBuilder urlBuilder = new StringBuilder("https://openapi.naver.com/v1/search/blog.xml"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("key","UTF-8") + "=rBc4plRbAKtGSwOvEN_U"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("query","UTF-8") + "=" + URLEncoder.encode(query, "UTF-8")); /*�� ������ ��� ��*/
        urlBuilder.append("&" + URLEncoder.encode("target","UTF-8") + "=" + URLEncoder.encode("blog", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("display","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*������ ��ȣ*/
        urlBuilder.append("&" + URLEncoder.encode("sort","UTF-8") + "=" + URLEncoder.encode("date", "UTF-8")); /*���ļ���*/
        
        URL url = new URL(urlBuilder.toString());
        
//        System.out.println(url);
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        LOGGER.info("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));	//�ѱ��� ���ڵ��� �� �־��ٰ�!!!
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        System.out.println(sb);
        rd.close();
        conn.disconnect();
		return list;
	}
	
	public boolean insertSearchKeyword(SearchKeywordVo keywordVo){
		return locationDao.insertSearchKeyword(keywordVo);
	}
	
	public ArrayList<LocationVo> selection(String keyword){
		return locationDao.selection(keyword);
	}
	//like
	public boolean insertLikeData(ClikeVo like){
		return locationDao.insertLikeData(like);
	}
	
	public boolean minusLike(String ps_no){
		return locationDao.minusLike(ps_no);
	}
	
	public boolean plusLike(String ps_no){
		return locationDao.plusLike(ps_no);
	}
	
	public boolean deleteLikeData(ClikeVo like){
		return locationDao.deleteLikeData(like);
	}
	
	public ArrayList<PostScriptList> selectSearchResult(SearchKeywordVo keyword){
		return locationDao.selectSearchResult(keyword);
	}

	public ArrayList<String> selectLikedNo(String mem_id){
		return locationDao.selectLikedNo(mem_id);
	}
	
	public ArrayList<LocationCategory> selectLoCate() {
		return locationDao.selectLoCate();
	}
	
	public ArrayList<CategoryVo> selectCategoryAllData(){
		return locationDao.selectCategoryAllData();
	}
	
	//clip
	public boolean insertClipData(ClipVo clip){
		return locationDao.insertClipData(clip);
	}
	
	public boolean minusClip(String ps_no){
		return locationDao.minusClip(ps_no);
	}
	
	public boolean plusClip(String ps_no){
		return locationDao.plusClip(ps_no);
	}
	
	public boolean deleteClipData(ClipVo clip){
		return locationDao.deleteClipData(clip);
	}
	
	public ArrayList<String> selectClipedNo(String mem_id){
		return locationDao.selectClipedNo(mem_id);
	}
}
