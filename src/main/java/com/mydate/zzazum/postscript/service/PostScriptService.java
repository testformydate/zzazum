package com.mydate.zzazum.postscript.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.mydate.zzazum.member.vo.MemberVo;
import com.mydate.zzazum.postscript.repository.PostScriptDataInter;
import com.mydate.zzazum.postscript.vo.PostScriptList;

@Service
@Component("postScriptService")
public class PostScriptService {
	

	@Resource
	private PostScriptDataInter postScriptDataInter;
	
	
	public ArrayList<PostScriptList> psListAll(){

		return postScriptDataInter.psListAll();
	}
	
	public ArrayList<PostScriptList> psListPart(PostScriptList bean){

		return postScriptDataInter.psListPart(bean);
	}
	
	public String psListCnt(){
		return postScriptDataInter.psListCnt();
	}
	
	public ArrayList<MemberVo> psBestPlanner(){

		return postScriptDataInter.psBestPlanner();
	}
	
	public ArrayList<PostScriptList> psBest(){

		return postScriptDataInter.psBest();
	}
}
