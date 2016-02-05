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
import com.mydate.zzazum.location.vo.LocationVo;
import com.mydate.zzazum.location.vo.SearchResultVo;

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
	
	public ArrayList<SearchResultVo> selectNaverSearch(String query) throws IOException{
		ArrayList<SearchResultVo> list = new ArrayList<SearchResultVo>();
		StringBuilder urlBuilder = new StringBuilder("http://openapi.naver.com/search"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("key","UTF-8") + "=rBc4plRbAKtGSwOvEN_U"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("query","UTF-8") + "=" + URLEncoder.encode(query, "UTF-8")); /*�� ������ ��� ��*/
        urlBuilder.append("&" + URLEncoder.encode("display","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*������ ��ȣ*/
        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("B", "UTF-8")); /*���ļ���*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*OS ����*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("�����ڿ�����", "UTF-8")); /*�����̸�*/
        
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
        rd.close();
        conn.disconnect();
		return list;
	}
}
