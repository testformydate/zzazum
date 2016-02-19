package com.mydate.zzazum.community.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mydate.zzazum.community.service.CommunityService;
import com.mydate.zzazum.community.vo.CommunityVo;
import com.sun.research.ws.wadl.Response;

@Controller
@RequestMapping("community")
public class CommunityController {

	@Autowired
	@Qualifier("communityService")
	private CommunityService communityService;
	
	//커뮤니티 리스트로 가는 컨트롤러
	@RequestMapping("/cm_list")
	public ModelAndView communityList(){
		ModelAndView model = new ModelAndView("/community/cm_list");
		ArrayList<CommunityVo> list = communityService.communityList();
		model.addObject("cmlist",list);
		return model;
	}
	
	//커뮤니티 글쓰기로 가는 컨트롤러
	@RequestMapping("/cm_wrview")
	public String communityWriteView(){
		
		return "community/cm_wr";
	}
	
	//글쓰기 프로세스 진행하는 컨트롤러
	@RequestMapping(value = "cm_wr", produces = "text/plain;charset=UTF-8", method=RequestMethod.POST)
	public void communityWrite(@ModelAttribute("communityVo") CommunityVo communityVo, HttpServletResponse response) throws IOException{
		communityService.communityWrite(communityVo);
		response.setContentType("text/html;charset=utf-8");
		System.out.println(communityVo.getCm_content());
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<script>alert('글작성 완료');"
	      		+ "location.href='/mydate/community/cm_list';</script>");
		out.println("</body></html>");
		out.close();
	}
	
	
	//디테일 프로세스 뷰로 이동!!
	@RequestMapping("cm_detail")
	public ModelAndView cm_Detail(@RequestParam("sm2")String cm_no){
		 ModelAndView model = new ModelAndView("/community/cm_detail");
		 CommunityVo dto = communityService.cm_Detail(cm_no);
		 model.addObject("cm_Detail", dto);
		 return model;
	}
	
		
	
	//수정 프로세스 뷰로 이동!
	@RequestMapping("cm_upview")
	public ModelAndView cm_UpView(@RequestParam("sm")String cm_no, ModelAndView model){
		CommunityVo dto = communityService.cm_UpView(cm_no);
		
		model.addObject("cm_UpView", dto);
		model.setViewName("/community/cm_up");
		return model;
	}
	
	
	
	//수정 프로세스를 위한 컨트롤러
		@RequestMapping(value = "cm_up", method = RequestMethod.POST)
		public void cm_Up(CommunityVo communityVo, HttpServletResponse response) throws IOException{
			response.setContentType("text/html;charset=utf-8");
			communityService.cm_Up(communityVo);
			PrintWriter out = response.getWriter();
		      out.println("<html><body>");
		      out.println("<script>alert('수정되었습니다');"
		      		+ "location.href='cm_list';</script>");
		      
		      out.println("</body></html>");
		      
		      out.close();
		}
		
	//삭제 프로세스를 위한 컨트롤러
		@RequestMapping("cm_del")
		public void cm_Del(@RequestParam("sm3") String cm_no, HttpServletResponse response) throws IOException {
			response.setContentType("text/html;charset=utf-8");
			communityService.cm_Del(cm_no);
			PrintWriter out = response.getWriter();
		      out.println("<html><body>");
		      out.println("<script>alert('삭제되었습니다');"
		      		+ "location.href='cm_list';</script>");
		      
		      out.println("</body></html>");
		      
		      out.close();
			
		}
	
}
