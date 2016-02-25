<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../md_top.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/home_cardlayout.css" />">
<style type="text/css">
.myInfos{
	margin-top:100px;
}
</style>
</head>
<body>
<!-- <a href="memberupview">수정</a>
<a href="memberdel">회원탈퇴</a> -->
<div class="body">
<div class="myInfos">
	<div class="memberImgWrapper"><img class="tooltipImg" src="resources/ps_images/profile/<%=session.getAttribute("mem_primg") %>"></div>
</div>
<div id="cards" class="cards">
					<div id="cardarea" class="cardarea">
						<c:forEach var="p" items="${psList}">
							<div class="card">
								<img class="cardImg" src="resources/ps_images/postscript/${p.ps_image}">
								<div id="${p.ps_no}" class="cardTitle">${p.ps_title}</div>
								<div class="cardWriter">
									<div class="likeAndComment">
										<img class="icons" src="<c:url value="/icons/like.png" />"><span class="count">${p.ps_like}</span>
									</div>
									<div class="likeAndComment">
										<img class="icons" src="<c:url value="/icons/views.png" />"><span class="count">${p.ps_hits}</span>
									</div>
								</div>
								<div class="cardBottom">
									<img class="cardProfile" src="<c:url value="resources/ps_images/profile/${p.mem_primg}" />"><span class="count">${p.mem_nick}</span>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div id="loading" class="sk-fading-circle">
				  <div class="sk-circle1 sk-circle"></div>
				  <div class="sk-circle2 sk-circle"></div>
				  <div class="sk-circle3 sk-circle"></div>
				  <div class="sk-circle4 sk-circle"></div>
				  <div class="sk-circle5 sk-circle"></div>
				  <div class="sk-circle6 sk-circle"></div>
				  <div class="sk-circle7 sk-circle"></div>
				  <div class="sk-circle8 sk-circle"></div>
				  <div class="sk-circle9 sk-circle"></div>
				  <div class="sk-circle10 sk-circle"></div>
				  <div class="sk-circle11 sk-circle"></div>
				  <div class="sk-circle12 sk-circle"></div>
				</div>
		<input type="hidden" id="psListSize" value="${psListSize }">
		</div>
</body>
</html>
