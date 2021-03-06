package com.mydate.zzazum.community.repository;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.community.vo.CommentVo;
import com.mydate.zzazum.community.vo.CommunityVo;

@Repository
public class CommunityImpl implements CommunityInter{

	@Autowired
	private CommunityDao communityDao;
	
	@Override
	public boolean communityWrite(CommunityVo communityVo) {
		boolean b = false;
		b = communityDao.communityWrite(communityVo);
		return b;
	}
	
	@Override
	public ArrayList<CommunityVo> communityList() {
		ArrayList<CommunityVo> list = communityDao.communityList();
		return list;
	}
	
	
	
	@Override
	public int cm_Up(CommunityVo communityVo) {
		
		return communityDao.cm_Up(communityVo);
	}
	
	
	@Override
	public CommunityVo cm_UpView(String cm_no) {
		
		return communityDao.cm_UpView(cm_no);
	}
	
	@Override
	public CommunityVo cm_Detail(String cm_no) {
		
		return communityDao.cm_Detail(cm_no);
	}
	
	@Override
	public int cm_Del(String cm_no) {
		
		return communityDao.cm_Del(cm_no);
	}
	
	@Override
	public ArrayList<CommunityVo> communityPartList(String part_no) {
		
		return communityDao.communityPartList(part_no);
	}
	
	@Override
	public int cm_Rcnt(String cm_no) {
		
		return communityDao.cm_Rcnt(cm_no);
	}
	
	@Override
	public ArrayList<CommentVo> commentList(String comt_bono) {
		
		return communityDao.commentList(comt_bono);
	}
	
	@Override
	public ArrayList<CommunityVo> communitySearch(CommunityVo communityVo) {
		return communityDao.communitySearch(communityVo);
	}
}
