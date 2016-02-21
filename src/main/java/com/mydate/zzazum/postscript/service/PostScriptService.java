package com.mydate.zzazum.postscript.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
import com.mydate.zzazum.postscript.vo.PostScriptComment;
import com.mydate.zzazum.postscript.vo.PostScriptDetail;
import com.mydate.zzazum.postscript.vo.PostScriptLike;
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
	
	public ArrayList<PostScriptDetail> psDetail(PostScriptList list){
		ArrayList<PostScriptDetail> result = postScriptDataInter.psDetail(list.getPs_no());
		ArrayList<PostScriptLike> like = postScriptDataInter.psLike(list);
		ArrayList<PostScriptComment> comment = postScriptDataInter.psListComment(list.getPs_no());
		
		for(PostScriptDetail pd : result){
			for(PostScriptLike pl : like){
				if(pd.getPd_no() == pl.getPd_no()){
					pd.setPd_clike("like");
				}
			}
			if(pd.getPd_clike()==null) pd.setPd_clike("dislike");
		}
		
		for(PostScriptDetail pd: result){
			ArrayList<PostScriptComment> pdList = new ArrayList<PostScriptComment>();
			PostScriptComment comm;
			for(PostScriptComment pc: comment){
				if(pd.getPd_no() == pc.getCo_pdno()){
					//System.out.println(pc.getMem_nick());
					comm = new PostScriptComment();
					comm.setMem_primg(pc.getMem_primg());
					comm.setMem_nick(pc.getMem_nick());
					comm.setCo_context(pc.getCo_context());
					
					pdList.add(comm);
				}
			}
			pd.setPd_comment(pdList);
		}
		
		return result;
	}
	
	public int pdCommentInsert(PostScriptComment comment){	
		return postScriptDataInter.pdCommentInsert(comment);
	}
	
	public PostScriptList psDetailMain(PostScriptList list){
		PostScriptList result = postScriptDataInter.psDetailMain(list.getPs_no());
		PostScriptLike like = postScriptDataInter.psLikeMain(list);
		if(like != null){
			result.setPs_clike("like");
		}else{
			result.setPs_clike("dislike");
		}
		return result;
	}
	
	public String psDeleteLike(PostScriptLike like) {
		postScriptDataInter.psDeleteLike(like);
		return "dislike";
	}
	
	public String psInsertLike(PostScriptLike like) {
		postScriptDataInter.psInsertLike(like);
		return "like";
	}
	
	public int psUpdateLike(PostScriptLike like) {
		return postScriptDataInter.psUpdateLike(like);
	}
	
	public String pdDeleteLike(PostScriptLike like) {
		postScriptDataInter.pdDeleteLike(like);
		return "dislike";
	}
	
	public String pdInsertLike(PostScriptLike like) {
		postScriptDataInter.pdInsertLike(like);
		return "like";
	}
	
	public int pdUpdateLike(PostScriptLike like) {
		return postScriptDataInter.pdUpdateLike(like);
	}
	
	public void psHits(String ps_no){
		postScriptDataInter.psHits(ps_no);
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
	
	public void psDataInsert(PostScriptDetail bean){
		postScriptDataInter.psDataInsert(bean);
	}
}
