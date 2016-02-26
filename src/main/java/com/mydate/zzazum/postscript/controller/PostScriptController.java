package com.mydate.zzazum.postscript.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mydate.zzazum.location.service.LocationDataService;
import com.mydate.zzazum.location.vo.LocationVo;
import com.mydate.zzazum.member.repository.MemberInter;
import com.mydate.zzazum.postscript.service.PostScriptService;
import com.mydate.zzazum.postscript.vo.PostScriptComment;
import com.mydate.zzazum.postscript.vo.PostScriptDetail;
import com.mydate.zzazum.postscript.vo.PostScriptFile;
import com.mydate.zzazum.postscript.vo.PostScriptLike;
import com.mydate.zzazum.postscript.vo.PostScriptList;

@Controller
@Scope("prototype")
public class PostScriptController {
	
	@Autowired
	private PostScriptService postScriptService;
	
	@Autowired
	private MemberInter memberInter;
	
	@Autowired
	private LocationDataService locationDataService;
	
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
			map.put("ps_nick", ps.getMem_nick());
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
			map.put("ps_clip", Integer.toString(ps.getPs_clip()));
			
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
		
		model.addObject("userP", memberInter.memberInfo(list.getPs_email()));
		model.addObject("psDM", postScriptService.psDetailMain(list));
		model.addObject("psD", postScriptService.psDetail(list));
		model.setViewName("postscript/ps_detail");
		
		return model;	
	}
	
	@RequestMapping(value="commentInsert")
	public String commentInsert(PostScriptComment comment){
		postScriptService.pdCommentInsert(comment);
		return "redirect:/psListDetail?ps_no="+comment.getCo_psno()+"&ps_email="+comment.getCo_email();
	}
	
	@RequestMapping(value="deleteComment")
	public String deleteComment(PostScriptComment comment){
		postScriptService.pdCommentDelete(comment);
		return "redirect:/psListDetail?ps_no="+comment.getCo_psno()+"&ps_email="+comment.getCo_email();
	}
	
	@RequestMapping(value="psListInsert")
	public ModelAndView psListInsert(){
		ModelAndView model = new ModelAndView();
		ArrayList<LocationVo> list = locationDataService.selectAllData();
		model.addObject("psLo", locationDataService.selectLoCate());
		model.addObject("pdLocation", list);
		model.setViewName("postscript/ps_insert");
		
		return model;
	}
	
	@RequestMapping(value="psDataInsert")
	public ModelAndView psDataInsert(PostScriptDetail bean){
		ModelAndView model = new ModelAndView();
		
		postScriptService.psDataInsert(bean);
		
		model.setViewName("redirect:/psListAll");
		return model;
	}

	
	@RequestMapping(value="psUpdateLike")
	@ResponseBody
	public String psUpdateLike(@RequestParam("sortLike") String sortLike, PostScriptLike like){
		String result="dislike";
		
		if(sortLike.equals("pslike")){
			PostScriptLike pan = postScriptService.psLikeMain(like);
			if(pan != null){
				like.setLikeVal(-1);
				result = postScriptService.psDeleteLike(like);
				postScriptService.psUpdateLike(like);
			}else{
				like.setLikeVal(1);
				result = postScriptService.psInsertLike(like);
				postScriptService.psUpdateLike(like);
			}
			
			return result;
		}
		
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
	
	@RequestMapping(value="psHits")
	public void psHits(@RequestParam("ps_no") String ps_no){
		postScriptService.psHits(ps_no);
	}
	
	@RequestMapping(value="tempFileUp")
	@ResponseBody
	public List<Map<String, String>> tempFileUp(PostScriptFile beanFile){
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		Map<String, String> map = null;
		
		for(PostScriptFile pf : postScriptService.tempFileUp(beanFile)){
			map = new HashMap<String, String>();
			map.put("pf_no", Integer.toString(pf.getPf_no()));
			map.put("pf_name", pf.getPf_name());
			
			result.add(map);
		}
		
		return result;
	}
	
	@RequestMapping(value="psListUpdate")
	public ModelAndView psListUpdate(PostScriptList list, HttpSession session){
		ModelAndView model = new ModelAndView();
		list.setPs_email((String)session.getAttribute("mem_id"));
		
		PostScriptList psList = postScriptService.psDetailMain(list);
		ArrayList<PostScriptDetail> pdList = postScriptService.pdEdit(list);
		
		for(int i =0; i<pdList.size(); i++){
			if(pdList.get(i).getPd_image().equals(psList.getPs_image())){
				model.addObject("main_val", "ps_insert_card"+Integer.toString(i+1));
			}
		}
		model.addObject("psDSize", pdList.size());
		model.addObject("psLo", locationDataService.selectLoCate());
		model.addObject("psDM", psList);
		model.addObject("psD", pdList);
		model.setViewName("postscript/ps_update");
		
		return model;
	}
	

}
