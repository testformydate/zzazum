package com.mydate.zzazum.community.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mydate.zzazum.community.service.CommentService;
import com.mydate.zzazum.community.vo.CommentVo;

@Controller
@RequestMapping("community")
public class CommentController {
	
	@Autowired
	@Qualifier("commentService")
	private CommentService commentService;
	
	
	@RequestMapping(value = "comt_wr", produces = "text/plain;charset=UTF-8", method=RequestMethod.POST)
	public String commentWrite(@ModelAttribute("commentVo") CommentVo commentVo, HttpServletResponse response) throws IOException{
		commentService.commentWrite(commentVo);
		int bb = commentVo.getComt_bono();
		return "redirect:cm_detail?sm2=" + bb;
	}
	
			
}
