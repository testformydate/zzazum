<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<% 
	request.setCharacterEncoding("utf-8");
	String[] timeline = {"detail_inverted", "detail_facade"};
	int jump =0;
	int sum = -1;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/resources/css/ps_detail.css" />
<title>Insert title here</title>
<%@include file="../md_top.jsp" %>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/ps_detail.js">

</script>
</head>
<body>
<div class="body">
<div class = "ps_detail_body">
	<div class="ps_detail_title">
		<div class="ps_main_title"><h1>${psDM.ps_title}</h1></div>
		<div class="ps_main_like"><img class="like_click ps_like" id="pslike${psDM.ps_no}" src="resources/ps_icon/${psDM.ps_clike }.png"><span>${psDM.ps_like }</span>
			<input type="hidden" class="pslike${psDM.ps_no}" value="${psDM.ps_clike }">
		</div>
	</div>
	<div class="ps_detail_timeline">
		<ul>
			<c:forEach var="listD" items="${psD}">
			<% 
			sum *= (-1); 
			jump += sum;
			%>

			<li class="ps_detail_li <%=timeline[jump] %>">
				<div class="ps_detail_card">
					<div class="detail_card_img">
						<img src="resources/ps_images/postscript/${listD.pd_image }">					
					</div>
					<div class="ps_detail_context">
						${listD.pd_context }
					</div>
					<hr style="width: 100%">	
					<div class="ps_detail_like">
						<span><img class="like_click pd_like"  id="pdlike${listD.pd_no}" src="resources/ps_icon/${listD.pd_clike }.png"></span>
						<span class="likeCnt">${listD.pd_like }</span>
						<input type="hidden" class="pdlike${listD.pd_no}" value="${listD.pd_clike }">
					</div>
					<hr style="width: 95%; margin-bottom: 0px; padding-bottom: 0px; color: #efefef;">
					<div class="ps_detail_comment">
					<div class="pd_comment_link">comment ▼</div>
					<c:forEach var="pdC" items="${listD.pd_comment}">
					<div class="pd_comment_body">
						<c:if test="${pdC.co_delete eq 'pd_comment_none'} ">
						<div class="pd_comment_delete like_click pd_comment_none" onclick="deleteComment('${pdC.co_no}')">
							<img src='resources/icons/close_btn.png'>
						</div>
						</c:if>
						<c:if test="${pdC.co_delete eq 'pd_comment_id'}">
						<div class="pd_comment_delete like_click pd_comment_id" onclick="deleteComment('${pdC.co_no}')">
							<img src='resources/icons/close_btn.png'>
						</div>
						</c:if>
						<div class="pd_comment_profile">
							<img src="resources/ps_images/profile/${pdC.mem_primg }">
						</div>
						<div class="pd_comment_context">
							${pdC.mem_nick }
							<hr>
							${pdC.co_context }
						</div>
					</div>
					</c:forEach>
					</div>
					<div class="ps_detail_user">
					<div class="ps_detail_user_img">
					<c:choose>
						<c:when test="${!empty userP.mem_primg }">
							<img src="resources/ps_images/profile/${userP.mem_primg }">
						</c:when>
						<c:otherwise>
							<img src="resources/ps_images/profile/no_primg.png">
						</c:otherwise>
					</c:choose>
					</div>
					<div class="ps_detail_user_input">
						<textarea id="pdComm${listD.pd_no}" class='ps_insert_content enter_click'></textarea>
					</div>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
</div>
<div class="subMenu_body">
		<c:if test="${psDM.email_check eq 'Ok' }">
		<div class="subMenu_img"><img class="click_cursor" src="resources/icons/edit.png" onclick="psUpdate()"></div>
		</c:if>
		<div class="subMenu_img"><img class="click_cursor" src="resources/icons/write.png" onclick="javascript:psInsert()"></div>
		<div class="subMenu_img"><img class="click_cursor" src="resources/icons/top1.jpg" onclick="javascript:psTop()"></div>
		<div class="subMenu_img"><img class="click_cursor" src="resources/icons/back1.jpg" onclick="javascript:psBack()"></div>
</div>
<form id="insertComment" method="post">
	<input type="hidden" id="detailNo" name="co_psno" value="${psDM.ps_no}">
	<input type="hidden" id="getId" name="co_email" value="<%=(String)session.getAttribute("mem_id") %>">
	<input type="hidden" name="co_pdno" id="co_pdno">
	<input type="hidden" name="co_context" id="co_comment">
</form>

<form id="deleteComment" method="post">
	<input type="hidden" name="co_psno" value="${psDM.ps_no}">
	<input type="hidden" name="co_email" value="<%=(String)session.getAttribute("mem_id") %>">
	<input type="hidden" id="co_no" name="co_no">
</form>
</div>
</body>
</html>