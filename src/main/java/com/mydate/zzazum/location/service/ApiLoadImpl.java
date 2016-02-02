package com.mydate.zzazum.location.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.mydate.zzazum.location.vo.LocationVo;

@Service
public class ApiLoadImpl implements ApiLoadInter {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ApiLoadImpl.class);
	
	 public ArrayList<LocationVo> apiUpdate() throws IOException, DataAccessException{
		 
		 /*String xml = "";
			
			try {
				xml = apiUpdateInter.apiUpdate();
				LOGGER.info(xml);
			} catch (Exception e) {
				LOGGER.info("apiUpdate err: " + e);
			}*/
			
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=%2BsrXKXWBJD%2FbZnmOXnC%2FIk93WKZ%2FjkbHa%2FLsWttU6DmcbM%2B7fTiMHspZoCn6QbcJjXZ4APlra0SEsh%2FccvJ0zg%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("120", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("B", "UTF-8")); /*정렬순서*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*OS 구분*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("공유자원포털", "UTF-8")); /*어플이름*/
	        
	        URL url = new URL(urlBuilder.toString());
	        
//	        System.out.println(url);
	        
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        LOGGER.info("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));	//한글은 인코딩을 꼭 넣어줄것!!!
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
	        
	        String xml = sb.toString();
	        JSONObject xmlToJsonObj = XML.toJSONObject(xml);
	        int numOfRows = xmlToJsonObj.getJSONObject("response").getJSONObject("body").getInt("numOfRows");
	        JSONArray items = xmlToJsonObj.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
	        ArrayList<LocationVo> list = new ArrayList<LocationVo>();
	        for(int i = 0; i < numOfRows; i++){
	        	LocationVo location = new LocationVo();
	        	location.setP_no(items.getJSONObject(i).getInt("contentid"));
	        	location.setP_name(items.getJSONObject(i).getString("title"));
	        	location.setP_addr(items.getJSONObject(i).getString("addr1"));
	        	location.setP_lat(items.getJSONObject(i).getDouble("mapy"));
	        	location.setP_lng(items.getJSONObject(i).getDouble("mapx"));
	        	location.setP_image(items.getJSONObject(i).getString("firstimage"));
	        	list.add(location);
	        }
	        /*ArrayList<LocationVo> list = new ArrayList<LocationVo>();
	        for (int i = 0; i < numOfRows; i++) {
				LocationVo location = new LocationVo();
				location.setP_no(i + 1);
				location.setP_lat(items.getJSONObject(i).getInt("mapy"));
				list.add(location);
			}*/
	        
	        /*for(LocationVo l: list){
	        	System.out.println(l.getP_lat());
//	        	System.out.println(l.getP_lng());
	        }*/
//	        LOGGER.info(numOfRows + "");
	        /*for (int i = 0; i < items.length(); i++) {
				JSONObject item = items.getJSONObject(i);
				LOGGER.info(item.getString("item"));
			}*/
	        /*JSONParser jsonParser = new JSONParser();
	        JSONObject jsonObject = (JSONObject)jsonParser.parse(xmlToJsonObj);
	        String numOfRows = (String)jsonObject.get("numOfRows");*/
	        
	        /*JSONObject xmlToJsonObj = new JSONObject(XML.toJSONObject(xml));*/
	        /*JSONArray response = xmlToJsonObj.getJSONArray("response");
	        JSONObject body = response.toJSONObject(response);*/
	        
	        /*String json = xmlToJsonObj.toString();
	        LOGGER.info(json);*/
//	        System.out.println(xml);
	        /*String numOfRows = xmlToJsonObj.getJSONObject("item").getString("numOfRows");
	        LOGGER.info(numOfRows);*/
	        
		 	return list;
	    }
}
