package com.mydate.zzazum.postscript.repository;

import java.io.File;
import java.util.ArrayList;

import javax.annotation.Resource;


import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.mydate.zzazum.member.vo.MemberVo;
import com.mydate.zzazum.postscript.vo.PostScriptComment;
import com.mydate.zzazum.postscript.vo.PostScriptDetail;
import com.mydate.zzazum.postscript.vo.PostScriptLike;
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
	@Override
	public int psDeleteLike(PostScriptLike like) {		
		return postScriptDao.psDeleteLike(like);
	}
	
	@Override
	public int psInsertLike(PostScriptLike like) {
		return postScriptDao.psInsertLike(like);
	}
	
	@Override
	public int psUpdateLike(PostScriptLike like) {
		return postScriptDao.psUpdateLike(like);
	}
	
	@Override
	public PostScriptLike psLikeMain(PostScriptList list) {
		return postScriptDao.psLikeMain(list);
	}
	
	@Override
	public ArrayList<PostScriptLike> psLike(PostScriptList list) {
		return postScriptDao.psLike(list);
	}
	
	@Override
	public int pdDeleteLike(PostScriptLike like) {
		return postScriptDao.pdDeleteLike(like);
	}
	
	@Override
	public int pdInsertLike(PostScriptLike like) {
		return postScriptDao.pdInsertLike(like);
	}
	
	@Override
	public int pdUpdateLike(PostScriptLike like) {
		return postScriptDao.pdUpdateLike(like);
	}
	
	@Override
	public void psHits(String ps_no) {
		postScriptDao.psHits(ps_no);
	}
	
	@Override
	public ArrayList<PostScriptComment> psListComment(int co_psno) {
		return postScriptDao.psListComment(co_psno);
	}
	
	@Override
	public int pdCommentInsert(PostScriptComment comment) {
		return postScriptDao.pdCommentInsert(comment);
	}
	
	@Override
	public int psDataInsert(PostScriptDetail bean) {
		PostScriptList ps = new PostScriptList();
		int main_num = Integer.parseInt(bean.getMain_img().substring(14, 15));
		String mem_id = bean.getPd_email();
		
		ps.setPs_email(mem_id);
		ps.setPs_image(bean.getPd_images()[main_num].getOriginalFilename());
		ps.setPs_title(bean.getPs_title());
		ps.setPs_context(bean.getPd_contexts()[main_num]);
		ps.setPs_location(bean.getPd_location());
		
		postScriptDao.psDataInssert(ps);
		int ps_no = postScriptDao.psInsertNum(mem_id);
		
		for(int i=0; i<bean.getPd_images().length; i++){
			PostScriptDetail pd = new PostScriptDetail();
			
			pd.setPs_no(ps_no);
			pd.setPl_id(bean.getPl_ids()[i]);
			pd.setPd_email(mem_id);
			pd.setPd_context(bean.getPd_contexts()[i]);
			pd.setPd_image(bean.getPd_images()[i].getOriginalFilename());
			
			try {
				bean.getPd_images()[i].transferTo(upload(bean.getPd_images()[i]));
			} catch (Exception e) {
				System.out.println("file upload err" + e);
			}
			postScriptDao.pdDataInsert(pd);
		}
		
		return 0;
	}
	
	private File upload(MultipartFile file){
		String path="C:/Users/user/git/zzazum/src/main/webapp/resources/ps_images/postscript/" + file.getOriginalFilename();
		File f = new File(path);
		
		return f;
	}
	
}
