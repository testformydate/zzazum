package com.mydate.zzazum.location.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mydate.zzazum.location.service.LocationDataService;
import com.mydate.zzazum.location.vo.ClikeVo;
import com.mydate.zzazum.location.vo.LocationVo;
import com.mydate.zzazum.location.vo.NaverSearchResultVo;
import com.mydate.zzazum.location.vo.SearchKeywordVo;
import com.mydate.zzazum.postscript.service.PostScriptService;
import com.mydate.zzazum.postscript.vo.PostScriptList;

@Controller
public class PlannerController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(PlannerController.class);
	
	@Autowired
	private LocationDataService service;
	@Autowired
	private PostScriptService postService;
	
	@RequestMapping("planner")
	public ModelAndView planner(HttpSession session) throws IOException{
		ModelAndView modelAndView = new ModelAndView();
		
		/*if(session.getAttribute("mem_id")) */
		
		ArrayList<LocationVo> list = service.selectAllData();
		ArrayList<PostScriptList> postList = postService.psListAll();
		//System.out.println(postList);
		modelAndView.addObject("list", list);
		modelAndView.addObject("psList", postList);
		
		/*modelAndView.setViewName("planner");*/
		/*modelAndView.setViewName("navitest");*/
		modelAndView.setViewName("planner");
		return modelAndView;
	}
	
	@RequestMapping("autocomplete")
	@ResponseBody
	public ArrayList<Map<String, Object>> plannerSearch(@RequestParam("keyword")String keyword) throws IOException{
		ArrayList<Map<String, Object>> dataList = new ArrayList<Map<String,Object>>();
		Map<String, Object> data = null;
//		System.out.println(keyword);
		ArrayList<LocationVo> list = service.selectSearchData(keyword);
		
		for(LocationVo l:list){
			data = new HashMap<String, Object>();
			data.put("id", l.getP_id());
			data.put("name", l.getP_name());
			data.put("lng", l.getP_lng());
			data.put("lat", l.getP_lat());
			data.put("addr", l.getP_addr());
			data.put("cate", l.getP_category());
			dataList.add(data);
		}
		
		/*Map<String, Object> searchData = new HashMap<String, Object>();
		searchData.put("datas", dataList);*/
		return dataList;
	}
	
	@RequestMapping(value="keyword", method=RequestMethod.GET)
	public ModelAndView dataSearchResult(String keyword, HttpSession session, HttpServletRequest request) throws IOException{
		ModelAndView model = new ModelAndView();
		String mem_id = "";
		mem_id = (String)session.getAttribute("mem_id");
		if(mem_id == null || mem_id == "") {
			mem_id = (String)request.getHeader("X-FORWARDED-FOR");
			if(mem_id == null || mem_id == "") mem_id = request.getRemoteAddr();
		}
		//System.out.println(mem_id);
		SearchKeywordVo keywordVo = new SearchKeywordVo();
		keywordVo.setK_mid(mem_id);
		keywordVo.setK_word(keyword);
		//LOGGER.info("mem_id: " + mem_id + " keyword: " + keyword);
//		ArrayList<NaverSearchResultVo> naverList = service.selectNaverSearch(keyword);
		service.insertSearchKeyword(keywordVo);
//		System.out.println(naverList);
		
		
		ArrayList<LocationVo> resultList = service.selectSearchData(keyword);
		ArrayList<PostScriptList> postList = postService.selectPsSearch(keyword);
		//System.out.println(postList);
		if(postList == null || postList.isEmpty()) postList = postService.psListAll();
		
		model.addObject("list", resultList);
		model.addObject("psList", postList);
		model.addObject("exKeyword", keyword);
//		model.addObject("naverList", naverList);
		model.setViewName("planner");
		return model;
	}
	
	@RequestMapping(value="selectionBox", method=RequestMethod.GET)
	@ResponseBody
	public ArrayList<LocationVo> selection(@RequestParam("keyword")String keyword, @RequestParam("addr")String addr, @RequestParam("cate")String cate){
		ArrayList<LocationVo> list = new ArrayList<LocationVo>();
		
		if(addr == null || addr.equals("")) {
			if(cate == null || cate.equals("")){
		//		System.out.println(keyword);
				list = service.selection(keyword);
				
			}
		}
		
		if(list.isEmpty()) list = service.selectAllData();
		
		return list;
	}
	
	@RequestMapping(value="likeUpdate", method=RequestMethod.POST)
	@ResponseBody
	public String likeOrDislike(ClikeVo like){
		String likeOrDislike = "like";
		
		System.out.println(like.getLikeOrNot());
		System.out.println(like.getMem_id());
		System.out.println(like.getPs_no());
		
		return likeOrDislike; 
	}
}
