package kr.co.mydate.postscript.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mydate.postscript.repository.PostScriptDao;
import kr.co.mydate.postscript.repository.PostScriptDataInter;
import kr.co.mydate.postscript.vo.Member;
import kr.co.mydate.postscript.vo.PostScriptList;

@Service
public class PostScriptService {
	
	@Autowired
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
	
	public ArrayList<Member> psBestPlanner(){

		return postScriptDataInter.psBestPlanner();
	}
	
	public ArrayList<PostScriptList> psBest(){

		return postScriptDataInter.psBest();
	}
}
