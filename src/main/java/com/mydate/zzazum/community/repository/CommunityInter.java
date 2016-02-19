package com.mydate.zzazum.community.repository;

import java.util.ArrayList;

import com.mydate.zzazum.community.vo.CommunityVo;

public interface CommunityInter {

	boolean communityWrite(CommunityVo communityVo);
	ArrayList<CommunityVo> communityList();
	CommunityVo cm_UpView(String cm_no);
	CommunityVo cm_Detail(String cm_no);
	
	int cm_Up(CommunityVo communityVo);
	int cm_Del(String cm_no);
}
