<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<% 
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
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/ps_detail.js">
	
</script>
</head>
<body>
<%@include file="../md_top.jsp" %>
<div class = "ps_detail_body">
	<div class="ps_detail_title">
		<h1>${psDM.ps_title}</h1>
	</div>
	<div class="ps_detail_timeline">
		<ul>
			<c:forEach var="listD" items="${psD}">
			<% sum *= (-1); jump += sum;%>

			<li class="ps_detail_li <%=timeline[jump] %>">
				<div class="ps_detail_card">
					<div class="detail_card_img">
						<img src="resources/ps_images/postscirpt/${listD.pd_image }">					
					</div>
					<div class="ps_detail_context">
						${listD.pd_context }
					</div>
					<hr style="width: 100%">	
					<div class="ps_detail_like">
						<span><img class="like_click" src="resources/ps_icon/like.png"></span>
						<span>${listD.pd_like }</span>
					</div>
					<hr style="width: 95%; margin-bottom: 0px; padding-bottom: 0px; color: #efefef;">
					<div class="ps_detail_comment">
					<p>comment</p>
				
					</div>
					<div class="ps_detail_user">
					<div class="ps_detail_user_img">
						<img src="resources/ps_images/profile/pro_3.png">
					</div>
					<div class="ps_detail_user_input">
						<input type="text">
					</div>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
</div>
<%@include file="../subMenu.jsp" %>
</body>
</html>