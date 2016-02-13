package com.mydate.zzazum.postscript.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mydate.zzazum.member.repository.MemberInter;
import com.mydate.zzazum.postscript.service.PostScriptService;
import com.mydate.zzazum.postscript.vo.PostScriptLike;
import com.mydate.zzazum.postscript.vo.PostScriptList;

@Controller
public class PostScriptController {
	
	@Autowired
	private PostScriptService postScriptService;
	
	@Autowired
	private MemberInter memberInter;
	
	@RequestMapping(value="psListAll")
	public ModelAndView psListAll(){
		ModelAndView model = new ModelAndView();
		
		model.addObject("psBestPlanner", postScriptService.psBestPlanner());
		model.addObject("psListAll", postScriptService.psListAll());
		model.addObject("psBest", postScriptService.psBest());
		model.addObject("psListSize", postScriptService.psListCnt());
		model.setViewName("postscript/ps_list");
		
		return model;	
	}
	
	@RequestMapping(value="psListSort")
	public ModelAndView psListSort(@RequestParam("ps_data") String ps_data, @RequestParam("sortCate") String sortCate){
		ModelAndView model = new ModelAndView();
		if(sortCate.equals("Location")){
			model.addObject("psListAll", postScriptService.psSortLocation(ps_data));
			model.addObject("psListSize", postScriptService.psSortLocationCnt(ps_data));
			model.addObject("psSubTitle", ps_data);
		}
		else if(sortCate.equals("Email")){
			model.addObject("psListAll", postScriptService.psSortEmail(ps_data));
			model.addObject("psListSize", postScriptService.psSortEmailCnt(ps_data));
			model.addObject("psSubTitle", memberInter.memberInfo(ps_data).getMem_nick());
			
		}
		
		model.addObject("psBestPlanner", postScriptService.psBestPlanner());
		model.addObject("psBest", postScriptService.psBest());
		model.setViewName("postscript/ps_sort");
		
		return model;	
	}
	
	@RequestMapping(value="psListPart")
	@ResponseBody
	public List<Map<String, String>> psListPart(@RequestParam("track_Num") int track_Num, @RequestParam("track_Count") int track_Count){
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, String> map = null;
		List<Map<String, String>> data = new ArrayList<Map<String, String>>();
		
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
	
	@RequestMapping(value="psListSortPart")
	@ResponseBody
	public List<Map<String, String>> psListSortPart(@RequestParam("track_Num") int track_Num, @RequestParam("track_Count") int track_Count){
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, String> map = null;
		List<Map<String, String>> data = new ArrayList<Map<String, String>>();
		
		PostScriptList dto = new PostScriptList();
		dto.setTrack_Num(track_Num);
		dto.setTrack_Count(track_Count);
		ArrayList<PostScriptList> list = postScriptService.psListSortPart(dto);
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
	
	@RequestMapping(value="psListDetail")
	public ModelAndView psListDetail(PostScriptList list){
		ModelAndView model = new ModelAndView();
		
		model.addObject("psDM", postScriptService.psDetailMain(list));
		model.addObject("psD", postScriptService.psDetail(list));
		model.setViewName("postscript/ps_detail");
		
		return model;	
	}
	
	@RequestMapping(value="psListInsert")
	public ModelAndView psListInsert(){
		ModelAndView model = new ModelAndView();
		
		model.setViewName("postscript/ps_insert");
		
		return model;
	}

	
	@RequestMapping(value="psUpdateLike")
	@ResponseBody
	public String psUpdateLike(@RequestParam("sortLike") String sortLike, PostScriptLike like){
		String result="dislike";
		
		if(like.getPd_no()== 0){
			if(sortLike.equals("dislike")){
				like.setLikeVal(1);
				result = postScriptService.psInsertLike(like);
				postScriptService.psUpdateLike(like);
			}else if(sortLike.equals("like")){
				like.setLikeVal(-1);
				result = postScriptService.psDeleteLike(like);
				postScriptService.psUpdateLike(like);
			}
		}else{
			if(sortLike.equals("dislike")){
				like.setLikeVal(1);
				result = postScriptService.pdInsertLike(like);
				postScriptService.pdUpdateLike(like);
			}else if(sortLike.equals("like")){
				like.setLikeVal(-1);
				result = postScriptService.pdDeleteLike(like);
				postScriptService.pdUpdateLike(like);
			}	
		}
		return result;
	}

}
