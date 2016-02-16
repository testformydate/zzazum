package com.mydate.zzazum.postscript.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mydate.zzazum.member.vo.MemberVo;
import com.mydate.zzazum.postscript.repository.PostScriptDataInter;
import com.mydate.zzazum.postscript.vo.PostScriptDetail;
import com.mydate.zzazum.postscript.vo.PostScriptList;

@Service
@Component("postScriptService")
public class PostScriptService {
	

	@Resource
	private PostScriptDataInter postScriptDataInter;
	
	public String psListCnt(){
		return postScriptDataInter.psListCnt();
	}
	
	public ArrayList<PostScriptList> psListAll(){
		return postScriptDataInter.psListAll();
	}
	
	public String psSortEmailCnt(String ps_data){
		return postScriptDataInter.psSortEmailCnt(ps_data);
	}
	
	public ArrayList<PostScriptList> psSortEmail(String ps_data){
		return postScriptDataInter.psSortEmail(ps_data);
	}
	
	public String psSortLocationCnt(String ps_data){
		return postScriptDataInter.psSortLocationCnt(ps_data);
	}
	
	public ArrayList<PostScriptList> psSortLocation(String ps_data){
		return postScriptDataInter.psSortLocation(ps_data);
	}
	
	public ArrayList<PostScriptList> psListPart(PostScriptList bean){
		return postScriptDataInter.psListPart(bean);
	}
	
	public ArrayList<PostScriptList> psListSortPart(PostScriptList bean){
		return postScriptDataInter.psListSortPart(bean);
	}
	
	public ArrayList<MemberVo> psBestPlanner(){

		return postScriptDataInter.psBestPlanner();
	}
	
	public ArrayList<PostScriptList> psBest(){

		return postScriptDataInter.psBest();
	}
	
	public ArrayList<PostScriptDetail> psDetail(int ps_no){
		
		return postScriptDataInter.psDetail(ps_no);
	}
	
	public PostScriptList psDetailMain(int ps_no){
		
		return postScriptDataInter.psDetailMain(ps_no);
	}
	
	private void upload(HttpServletRequest request){
		MultipartHttpServletRequest req = (MultipartHttpServletRequest)request;
		String path="C:/Users/user/git2/mydate/src/main/webapp/resources/ps_data";
		File f;
		MultipartFile file;
		Iterator<String> itr =  req.getFileNames();
		file = req.getFile("pd_image");
		System.out.println(req.getFile("pd_image"));
		while(itr.hasNext()){
			/*String fileName = itr.next();
			file = req.getFile(fileName);*/
			f = new File(path, file.getOriginalFilename());
			System.out.println(file.getOriginalFilename());
			
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<PostScriptList> selectPsSearch(String keyword){
		return postScriptDataInter.selectPsSearch(keyword);
	}
}
