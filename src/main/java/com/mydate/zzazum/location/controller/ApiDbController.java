package com.mydate.zzazum.location.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mydate.zzazum.location.service.LocationDataService;
import com.mydate.zzazum.location.vo.LocationVo;

@Controller
public class ApiDbController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ApiDbController.class);
	
	@Autowired
	private LocationDataService locationDataService;

	@RequestMapping(value = "/test")
	public ModelAndView apiLoad() throws IOException{
		
		return new ModelAndView("test");
	}
	
	@RequestMapping(value = "/updatedatabase")
	public ModelAndView apiUpdate() throws IOException {
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=%2BsrXKXWBJD%2FbZnmOXnC%2FIk93WKZ%2FjkbHa%2FLsWttU6DmcbM%2B7fTiMHspZoCn6QbcJjXZ4APlra0SEsh%2FccvJ0zg%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("300", "UTF-8")); /*�� ������ ��� ��*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*������ ��ȣ*/
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
        
        String xml = sb.toString();
        JSONObject xmlToJsonObj = XML.toJSONObject(xml);
        int numOfRows = xmlToJsonObj.getJSONObject("response").getJSONObject("body").getInt("numOfRows");
        JSONArray items = xmlToJsonObj.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
        for(int i = 0; i < numOfRows; i++){
        	LocationVo location = new LocationVo();
        	location.setP_id(items.getJSONObject(i).getInt("contentid"));
        	location.setP_name(items.getJSONObject(i).getString("title"));
        	location.setP_addr(items.getJSONObject(i).getString("addr1"));
        	location.setP_lat(items.getJSONObject(i).getDouble("mapy"));
        	location.setP_lng(items.getJSONObject(i).getDouble("mapx"));
        	/*location.setP_image(items.getJSONObject(i).getString("firstimage"));*/
        	System.out.println(location.getP_name());
        	boolean b = locationDataService.insertApiData(location);
        	System.out.print(b);
        }
		return new ModelAndView("home");
	}
}
