package com.mydate.zzazum.location.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

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
import com.mydate.zzazum.location.vo.CategoryVo;
import com.mydate.zzazum.location.vo.ClikeVo;
import com.mydate.zzazum.location.vo.ClipVo;
import com.mydate.zzazum.location.vo.LocationCategory;
import com.mydate.zzazum.location.vo.LocationVo;
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
		String mem_id = (String)session.getAttribute("mem_id");
		
		ArrayList<String> noLisst = null;
		/*if(session.getAttribute("mem_id")) */
		ArrayList<LocationVo> list = service.selectAllData();
		ArrayList<PostScriptList> postList = postService.psListAll();
		ArrayList<CategoryVo> categoryList = service.selectCategoryAllData();
		ArrayList<LocationCategory> locationList = service.selectLoCate();
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("psList", postList);
		modelAndView.addObject("categoryList", categoryList);
		modelAndView.addObject("locationList", locationList);
		modelAndView.addObject("psListSize", service.psListCnt())
;		
		if(mem_id == null || mem_id.equals("")) {
			modelAndView.setViewName("planner");
			return modelAndView;
		}else{
			noLisst = service.selectLikedNo(mem_id);
		}
		//System.out.println(postList);
		modelAndView.addObject("noList", noLisst);
		
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
		String keyword1 = "";
		String keyword2 = "";
		ArrayList<LocationVo> resultList = null;
		ArrayList<PostScriptList> postList = null;
		ArrayList<CategoryVo> categoryList = service.selectCategoryAllData();
		ArrayList<LocationCategory> locationList = service.selectLoCate();
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
		
		StringTokenizer st = new StringTokenizer(keyword);
//		System.out.println(st.countTokens());
		if(st.countTokens() > 1){
			while(st.hasMoreElements()){
				keyword1 = st.nextElement().toString();
				keyword2 = st.nextElement().toString();
				//System.out.println(keyword1 + " success " + keyword2);
				SearchKeywordVo kWord = new SearchKeywordVo();
				kWord.setKeyword1(keyword1);
				kWord.setKeyword2(keyword2);
				postList = service.selectSearchResult(kWord);
			}
		}else{
			resultList = service.selectSearchData(keyword);
			postList = postService.selectPsSearch(keyword);
		}
		
		//System.out.println(postList);
		if(resultList == null || resultList.isEmpty()) resultList = service.selectAllData();
		if(postList == null || postList.isEmpty()) postList = postService.psListAll();
		
		model.addObject("list", resultList);
		model.addObject("psList", postList);
		model.addObject("exKeyword", keyword);
		model.addObject("categoryList", categoryList);
		model.addObject("locationList", locationList);
//		model.addObject("naverList", naverList);
		model.setViewName("planner");
		return model;
	}
	
	@RequestMapping(value="selectionBox", method=RequestMethod.GET)
	@ResponseBody
	public ArrayList<LocationVo> selection(@RequestParam("keyword")String keyword){
		ArrayList<LocationVo> list = new ArrayList<LocationVo>();
		
		list = service.selection(keyword);
		
		if(list.isEmpty()) list = service.selectAllData();
		
		return list;
	}
	
	@RequestMapping(value="likeUpdate", method=RequestMethod.POST)
	@ResponseBody
	public String likeOrDislike(ClikeVo like){
		String likeOrUnlike = like.getLikeOrNot();
		System.out.println(like.getPs_no());
		//System.out.println(ps_no);
		boolean b = false;
		if(likeOrUnlike.equals("like")){
			b = service.deleteLikeData(like);
			b = service.minusLike(like.getPs_no());
			likeOrUnlike = "unlike";
		}else if(likeOrUnlike.equals("unlike")){
			b = service.insertLikeData(like);
			b = service.plusLike(like.getPs_no());
			likeOrUnlike = "like";
		}
		/*
		System.out.println(like.getLikeOrNot());
		System.out.println(like.getMem_id());
		System.out.println(like.getPs_no());*/
		
		return likeOrUnlike; 
	}
	
	@RequestMapping(value="likedList", method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<String> selectLikedNo(String mem_id){
		ArrayList<String> likedList = service.selectLikedNo(mem_id);
		
		return likedList;
	}
	
	@RequestMapping(value="clipUpdate", method=RequestMethod.POST)
	@ResponseBody
	public String clipOrNot(ClipVo clip){
		String clipOrUnclip = clip.getClipOrNot();
		String ps_no = clip.getPs_no();
//		System.out.println("ps_no: " + ps_no + " clip: " + clipOrUnclip);
		boolean b = false;
		if(clipOrUnclip.equals("clip")){
//			System.out.println("clip");
			b = service.deleteClipData(clip);
			b = service.minusClip(ps_no);
//			System.out.println(b);
			clipOrUnclip = "unclip";
		}else if(clipOrUnclip.equals("unclip")){
//			System.out.println("unclip");
			b = service.insertClipData(clip);
			b = service.plusClip(ps_no);
			clipOrUnclip = "clip";
		}
		return clipOrUnclip; 
	}
	
	@RequestMapping(value="clipedList", method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<String> selectclipedNo(String mem_id){
		ArrayList<String> clipedList = service.selectClipedNo(mem_id);
		
		return clipedList;
	}
	
	@RequestMapping("presentation")
	public String ppt(){
		return "presentation";
	}
}
