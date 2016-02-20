package com.mydate.zzazum.postscript.repository;

import java.util.ArrayList;

import org.springframework.dao.DataAccessException;

import com.mydate.zzazum.member.vo.MemberVo;
import com.mydate.zzazum.postscript.vo.PostScriptComment;
import com.mydate.zzazum.postscript.vo.PostScriptDetail;
import com.mydate.zzazum.postscript.vo.PostScriptLike;
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
	
	//검색을 위한 메소드
	ArrayList<PostScriptList> selectPsSearch(String keyword);
	
	PostScriptLike psLikeMain(PostScriptList list);
	ArrayList<PostScriptLike> psLike(PostScriptList list);
	
	int psInsertLike(PostScriptLike like);
	int psDeleteLike(PostScriptLike like);
	int psUpdateLike(PostScriptLike like);
	
	int pdInsertLike(PostScriptLike like);
	int pdDeleteLike(PostScriptLike like);
	int pdUpdateLike(PostScriptLike like);
	
	void psHits(String ps_no);
	
	int pdCommentInsert(PostScriptComment comment);
	
	ArrayList<PostScriptComment> psListComment(int co_psno);
	
	int psDataInsert(PostScriptDetail bean);
}
