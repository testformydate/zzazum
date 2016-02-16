package com.mydate.zzazum.postscript.repository;

import java.util.ArrayList;

import javax.annotation.Resource;


import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.member.vo.MemberVo;
import com.mydate.zzazum.postscript.vo.PostScriptDetail;
import com.mydate.zzazum.postscript.vo.PostScriptList;

@Repository
public class PostScriptImpl implements PostScriptDataInter{
	
	@Resource
	private PostScriptDao postScriptDao;	
	@Override
	public ArrayList<PostScriptList> psListAll() {
		ArrayList<PostScriptList> list = postScriptDao.psListAll();
		return list;
	}
	
	@Override
	public ArrayList<PostScriptList> psSortEmail(String ps_data) throws DataAccessException {
		ArrayList<PostScriptList> list = postScriptDao.psSortEmail(ps_data);
		return list;
	}
	
	@Override
	public ArrayList<PostScriptList> psListPart(PostScriptList bean) {
		ArrayList<PostScriptList> list = postScriptDao.psListPart(bean);
		return list;
	}
	
	@Override
	public ArrayList<PostScriptList> psListSortPart(PostScriptList bean) {
		ArrayList<PostScriptList> list = postScriptDao.psListSortPart(bean);
		return list;
	}
	
	@Override
	public String psListCnt() {
		String size = postScriptDao.psListCnt();
		return size;
	}
	
	@Override
	public String psSortEmailCnt(String ps_data) {
		String size = postScriptDao.psSortEmailCnt(ps_data);
		return size;
	}
	
	@Override
	public String psSortLocationCnt(String ps_data) {
		String size = postScriptDao.psSortLocationCnt(ps_data);
		return size;
	}
	
	@Override
	public ArrayList<PostScriptList> psSortLocation(String ps_data) throws DataAccessException {
		ArrayList<PostScriptList> list = postScriptDao.psSortLocation(ps_data);
		return list;
	}
	
	@Override
	public ArrayList<MemberVo> psBestPlanner() {
		ArrayList<MemberVo> list = postScriptDao.psBestPlanner();
		return list;
	}
	
	@Override
	public ArrayList<PostScriptList> psBest(){
		ArrayList<PostScriptList> list = postScriptDao.psBest();
		return list;
	}
	
	@Override
	public ArrayList<PostScriptDetail> psDetail(int ps_no) {
		return postScriptDao.psDetail(ps_no);
	}
	
	@Override
	public PostScriptList psDetailMain(int ps_no) {
		return postScriptDao.psDetailMain(ps_no);
	}
	
	@Override
	public ArrayList<PostScriptList> selectPsSearch(String keyword) {
		return postScriptDao.selectPsSearch(keyword);
	}
	
}
