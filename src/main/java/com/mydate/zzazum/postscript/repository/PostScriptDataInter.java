package com.mydate.zzazum.postscript.repository;

import java.util.ArrayList;

import org.springframework.dao.DataAccessException;

import com.mydate.zzazum.member.vo.MemberVo;
import com.mydate.zzazum.postscript.vo.PostScriptList;

public interface PostScriptDataInter {
	ArrayList<PostScriptList> psListAll() throws DataAccessException;
	ArrayList<PostScriptList> psListPart(PostScriptList bean);
	String psListCnt();
	ArrayList<MemberVo> psBestPlanner();
	ArrayList<PostScriptList> psBest();
	int psImage(String pi_image);
}
