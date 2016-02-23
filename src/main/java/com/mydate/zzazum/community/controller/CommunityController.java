package com.mydate.zzazum.community.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mydate.zzazum.community.service.CommunityService;
import com.mydate.zzazum.community.vo.CommentVo;
import com.mydate.zzazum.community.vo.CommunityVo;

@Controller
@RequestMapping("community")
public class CommunityController {

	@Autowired
	@Qualifier("communityService")
	private CommunityService communityService;
	
	//커뮤니티 글쓰기로 가는 컨트롤러
	@RequestMapping("/cm_wrview")
	public String communityWriteView(@RequestParam("part_no")String part_no,  Model model){
		System.out.println(part_no);
		model.addAttribute("part_no", part_no);
		
		return "community/cm_wr";
	}
	
	//글쓰기 프로세스 진행하는 컨트롤러
	@RequestMapping(value = "cm_wr", produces = "text/plain;charset=UTF-8", method=RequestMethod.POST)
	public void communityWrite(@ModelAttribute("communityVo") CommunityVo communityVo, HttpServletRequest request, HttpServletResponse response) throws IOException{
		communityService.communityWrite(communityVo);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
	    out.println("<script>alert('글이 작성되었습니다.');"
	      		+ "location.href='cm_list?part_no="+communityVo.getCm_partno()+"'</script>");
	    out.println("</body></html>");
		out.close();
	}
	
	
	//디테일 프로세스 뷰로 이동!!
	@RequestMapping("cm_detail")
	public ModelAndView cm_Detail(@RequestParam("sm2")String cm_no, CommunityVo communityVo){
		 communityService.cm_Rcnt(cm_no);
		 ArrayList<CommentVo> comt_list = communityService.commentList(cm_no);
		 ModelAndView model = new ModelAndView("/community/cm_detail");
		 CommunityVo cm_detail = communityService.cm_Detail(cm_no);
		 System.out.println(cm_detail.getCm_no());
		 model.addObject("cm_Detail", cm_detail);
		 model.addObject("comt_List", comt_list);
		 
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
		
	//탑 가는 컨트롤러
		@RequestMapping("cm_top")
		public String cm_Top(){
			
			return "community/cm_top";
					
		}
		
	//커뮤니티 파트리스트를 뿌려주기 위한 컨트롤러지만 이따쓰겠음
		@RequestMapping("cm_list")
		public String communityPartList(HttpServletRequest request, Model model){
			String part_no = request.getParameter("part_no");
			
			model.addAttribute("part_no", part_no);
			ArrayList<CommunityVo> list = null;
			if(part_no.equals("0")){
				list=communityService.communityList();
			}else{
				list=communityService.communityPartList(part_no);
			}
			model.addAttribute("cmlist",list);
			return "community/cm_list";
		}
		
	
		
}
