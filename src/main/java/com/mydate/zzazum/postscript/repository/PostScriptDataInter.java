package com.mydate.zzazum.postscript.repository;

import java.util.ArrayList;

import org.springframework.dao.DataAccessException;

import com.mydate.zzazum.member.vo.MemberVo;
import com.mydate.zzazum.postscript.vo.PostScriptDetail;
import com.mydate.zzazum.postscript.vo.PostScriptList;

public interface PostScriptDataInter {
	String psListCnt();
	ArrayList<PostScriptList> psListAll() throws DataAccessException;
	String psSortEmailCnt(String ps_data);
	ArrayList<PostScriptList> psSortEmail(String ps_data) throws DataAccessException;
	String psSortLocationCnt(String ps_data);
	ArrayList<PostScriptList> psSortLocation(String ps_data) throws DataAccessException;
	ArrayList<PostScriptList> psListPart(PostScriptList bean);
	ArrayList<PostScriptList> psListSortPart(PostScriptList bean);
	ArrayList<MemberVo> psBestPlanner();
	ArrayList<PostScriptList> psBest();
	
	PostScriptList psDetailMain(int ps_no);
	ArrayList<PostScriptDetail> psDetail(int ps_no);
}
