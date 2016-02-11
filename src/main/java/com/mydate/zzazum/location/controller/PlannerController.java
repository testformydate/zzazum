package com.mydate.zzazum.location.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mydate.zzazum.location.service.LocationDataService;
import com.mydate.zzazum.location.vo.LocationVo;
import com.mydate.zzazum.location.vo.SearchKeywordVo;

@Controller
public class PlannerController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(PlannerController.class);
	
	@Autowired
	private LocationDataService service;
	
	@RequestMapping("planner")
	public ModelAndView planner() throws IOException{
		ModelAndView modelAndView = new ModelAndView();
		
		ArrayList<LocationVo> list = service.selectAllData();
		System.out.println(list);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("planner");
		return modelAndView;
	}
	
	@RequestMapping("autocomplete")
	@ResponseBody
	public ArrayList<Map<String, Object>> plannerSearch(@RequestParam("keyword")String keyword) throws IOException{
		ArrayList<Map<String, Object>> dataList = new ArrayList<Map<String,Object>>();
		Map<String, Object> data = null;
//		System.out.println(keyword);
		ArrayList<LocationVo> list =  service.selectSearchData(keyword);
		
		for(LocationVo l:list){
			data = new HashMap<String, Object>();
			data.put("id", l.getP_id());
			data.put("name", l.getP_name());
			data.put("lng", l.getP_lng());
			data.put("lat", l.getP_lat());
			data.put("addr", l.getP_addr());
			dataList.add(data);
		}
		
		/*Map<String, Object> searchData = new HashMap<String, Object>();
		searchData.put("datas", dataList);*/
		return dataList;
	}
	
	@RequestMapping(value="keyword", method=RequestMethod.GET)
	public ModelAndView dataSearchResult(String keyword, HttpSession session){
		String mem_id = (String)session.getAttribute("mem_id");
		SearchKeywordVo keywordVo = new SearchKeywordVo();
		keywordVo.setK_mid(mem_id);
		keywordVo.setK_word(keyword);
		service.insertSearchKeyword(keywordVo);
		
		ModelAndView model = new ModelAndView();
		ArrayList<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		
		
		
		model.addObject("list", resultList);
		model.setViewName("planner");
		return model;
	}
}
