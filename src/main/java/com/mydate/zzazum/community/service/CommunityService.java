package com.mydate.zzazum.community.service;

import java.util.ArrayList;

import org.jvnet.hk2.annotations.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mydate.zzazum.community.repository.CommunityInter;
import com.mydate.zzazum.community.vo.CommentVo;
import com.mydate.zzazum.community.vo.CommunityVo;

@Service
@Component("communityService")
public class CommunityService {
	
	@Autowired
	private CommunityInter communityInter;

	public boolean communityWrite(CommunityVo communityVo){
		boolean b = false;
		b = communityInter.communityWrite(communityVo);
		return b;
	}
	
	public ArrayList<CommunityVo> communityList(){
		ArrayList<CommunityVo> list = communityInter.communityList();
		return list;
	}
	
	public int cm_Up(CommunityVo communityVo){
		return communityInter.cm_Up(communityVo);
	}
	
	public CommunityVo cm_UpView(String cm_no){
		
		return communityInter.cm_UpView(cm_no);
	}
	
	public CommunityVo cm_Detail(String cm_no){
		
		return communityInter.cm_Detail(cm_no);
	}
		
	public int cm_Del(String cm_no){
		
		return communityInter.cm_Del(cm_no); 
	}
	
	public ArrayList<CommunityVo> communityPartList(String part_no){
		
		return communityInter.communityPartList(part_no);
	}
	
	public int cm_Rcnt(String cm_no){
		
		return communityInter.cm_Rcnt(cm_no);
	}
	
	public ArrayList<CommentVo> commentList(String comt_bono){
		
		return communityInter.commentList(comt_bono);
	}
}
