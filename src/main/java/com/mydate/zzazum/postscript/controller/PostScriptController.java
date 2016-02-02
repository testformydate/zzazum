package com.mydate.zzazum.postscript.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mydate.zzazum.postscript.service.PostScriptService;
import com.mydate.zzazum.postscript.vo.PostScriptList;

@Controller
@RequestMapping(value="psList")
public class PostScriptController{
	
	
	@Resource
	private PostScriptService postScriptService;
	
	@RequestMapping(params="method=listAll")
	public ModelAndView psListAll(){
		ModelAndView model = new ModelAndView();
		
		model.addObject("psBestPlanner", postScriptService.psBestPlanner());
		System.out.println(postScriptService.psBestPlanner());
		model.addObject("psListAll", postScriptService.psListAll());
		model.addObject("psBest", postScriptService.psBest());
		model.addObject("psListSize", postScriptService.psListCnt());
		model.setViewName("postscript/ps_list");
		
		return model;	
	}
	
	@RequestMapping(params="method=listPart")
	@ResponseBody
	public List<Map<String, String>> psListPart(@RequestParam("track_Num") int track_Num, @RequestParam("track_Count") int track_Count){
		Map<String, Object> result = new HashMap<>();
		Map<String, String> map = null;
		List<Map<String, String>> data = new ArrayList<>();
		
		PostScriptList dto = new PostScriptList();
		dto.setTrack_Num(track_Num);
		dto.setTrack_Count(track_Count);
		ArrayList<PostScriptList> list = postScriptService.psListPart(dto);
		for(PostScriptList ps:list){
			map = new HashMap<String, String>();
			map.put("ps_no", Integer.toString(ps.getPs_no()));
			map.put("ps_email", ps.getPs_email());
			map.put("ps_location", ps.getPs_location());
			map.put("ps_date", ps.getPs_date());
			map.put("ps_psno", Integer.toString(ps.getPs_psno()));
			map.put("ps_hour", Integer.toString(ps.getPs_hour()));
			map.put("ps_image", ps.getPs_image());
			map.put("ps_title", ps.getPs_title());
			map.put("ps_context", ps.getPs_context());
			map.put("ps_like", Integer.toString(ps.getPs_like()));
			map.put("ps_hits", Integer.toString(ps.getPs_hits()));
			map.put("mb_image", ps.getMem_primg());
			
			data.add(map);
			
		}
		return data;
	}
	
	@RequestMapping(params="method=listDetail")
	public ModelAndView psListDetail(){
		ModelAndView model = new ModelAndView();
		
		model.addObject("psBestPlanner", postScriptService.psBestPlanner());
		model.addObject("psListAll", postScriptService.psListAll());
		model.addObject("psBest", postScriptService.psBest());
		model.addObject("psListSize", postScriptService.psListCnt());
		model.setViewName("postscript/ps_detail");
		
		return model;	
	}

}
