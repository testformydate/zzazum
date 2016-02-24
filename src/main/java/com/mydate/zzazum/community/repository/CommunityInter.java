package com.mydate.zzazum.community.repository;

import java.util.ArrayList;

import com.mydate.zzazum.community.vo.CommentVo;
import com.mydate.zzazum.community.vo.CommunityVo;

public interface CommunityInter {

	boolean communityWrite(CommunityVo communityVo);
	ArrayList<CommunityVo> communityList();
	CommunityVo cm_UpView(String cm_no);
	CommunityVo cm_Detail(String cm_no);
	
	int cm_Up(CommunityVo communityVo);
	int cm_Del(String cm_no);
	ArrayList<CommunityVo> communityPartList(String part_no);
	int cm_Rcnt(String cm_no);
	ArrayList<CommentVo> commentList(String comt_bono);
	ArrayList<CommunityVo> communitySearch(CommunityVo communityVo);
}
