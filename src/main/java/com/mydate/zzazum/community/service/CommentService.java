package com.mydate.zzazum.community.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.mydate.zzazum.community.repository.CommentInter;
import com.mydate.zzazum.community.vo.CommentVo;

@Service
@Component("commentService")
public class CommentService {

	@Autowired
	private CommentInter commentInter;
	
	public boolean commentWrite(CommentVo commentVo){
		boolean b = false;
		b = commentInter.commentWrite(commentVo);
		return b;
	}
	
}
