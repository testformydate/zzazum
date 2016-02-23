package com.mydate.zzazum.community.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mydate.zzazum.community.vo.CommentVo;

@Repository
public class CommentImpl implements CommentInter{
	
	@Autowired
	private CommentDao commentDao;
	
	@Override
	public boolean commentWrite(CommentVo commentVo) {
		boolean b = false;
		b = commentDao.commentWrite(commentVo);
		return b;
	}
	
}
