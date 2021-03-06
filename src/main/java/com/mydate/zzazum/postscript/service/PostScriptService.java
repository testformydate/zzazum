package com.mydate.zzazum.postscript.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Array;
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
import com.mydate.zzazum.postscript.vo.PostScriptFile;
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
		ArrayList<PostScriptList> list = postScriptDataInter.psListAll();	
		return list;
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
					comm = new PostScriptComment();
					comm.setMem_primg(pc.getMem_primg());
					comm.setMem_nick(pc.getMem_nick());
					comm.setCo_context(pc.getCo_context());
					comm.setCo_no(pc.getCo_no());
					
					if(list.getPs_email().equals(pc.getCo_email())){
						comm.setCo_delete("pd_comment_id");
					}else{
						comm.setCo_delete("pd_comment_none");
					}
					
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
		
		if(list.getPs_email().equals(result.getPs_email())){
			result.setEmail_check("Ok");
		}else{
			result.setEmail_check("No");
		}
		
		if(like != null){
			result.setPs_clike("like");
		}else{
			result.setPs_clike("dislike");
		}
		return result;
	}
	
	public PostScriptLike psLikeMain(PostScriptLike like){
		PostScriptList list = new PostScriptList();
		list.setPs_email(like.getMem_id());
		list.setPs_no(like.getPs_no());
		return postScriptDataInter.psLikeMain(list);
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
	
	public ArrayList<PostScriptList> selectPsSearch(String keyword){
		return postScriptDataInter.selectPsSearch(keyword);
	}
	
	public void psDataInsert(PostScriptDetail bean){
		postScriptDataInter.psDataInsert(bean);
	}
	
	public ArrayList<PostScriptFile> tempFileUp(PostScriptFile beanFile){
		beanFile.setPf_name(beanFile.getPd_images()[0].getOriginalFilename());
		int num = postScriptDataInter.tempFileMa(beanFile);
		
		
		for(MultipartFile mf : beanFile.getPd_images()){
			PostScriptFile dto = new PostScriptFile();
			num += 1;
			String fileName = Integer.toString(num) + ".png";
			
			dto.setPf_name(fileName);
			dto.setPf_email(beanFile.getPf_email());
			
			postScriptDataInter.tempFileUp(dto);
		}
		
		num -= beanFile.getPd_images().length;
		
		for(MultipartFile mf : beanFile.getPd_images()){
			num +=1;
			try {
				mf.transferTo(upload(Integer.toString(num) + ".png"));
				Thread.sleep(5000);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return postScriptDataInter.tempFileSe(beanFile);
	}
	
	private File upload(String fileName){
		String path="C:/Users/user/git/zzazum/src/main/webapp/resources/ps_data/" + fileName;
		File f = new File(path);
		
		return f;
	}
	
	public void pdCommentDelete(PostScriptComment comment){
		postScriptDataInter.pdCommentDelete(comment);
	}
	
	public ArrayList<PostScriptDetail> pdEdit(PostScriptList list){
		ArrayList<PostScriptDetail> pdList = postScriptDataInter.pdEdit(list);
		
		for(PostScriptDetail pd: pdList){
			updateUpload(pd.getPd_image());
		}
		
		return pdList;
	}
	
	public void psDataUpdate(PostScriptDetail bean){
		postScriptDataInter.pdDataUpdate(bean);
	}
	
	private void updateUpload(String fileName){
		String inPath="C:/Users/user/git/zzazum/src/main/webapp/resources/ps_images/postscript/" + fileName;
		String outPath ="C:/Users/user/git/zzazum/src/main/webapp/resources/ps_data/"+fileName;
		File delete = new File(inPath);
		try {
			FileInputStream fis = new FileInputStream(inPath);
			FileOutputStream fos = new FileOutputStream(outPath);
			
			int data =0;
			while((data=fis.read())!=-1){
				fos.write(data);
			}
			
			fis.close();
			fos.close();
			
			delete.delete();
		} catch (Exception e) {
			System.out.println("file upload err : " + e);
		}
	}
	
	public void psUpdateCancel(int ps_no){
		postScriptDataInter.psUpdateCancel(ps_no);
	
	}
}
