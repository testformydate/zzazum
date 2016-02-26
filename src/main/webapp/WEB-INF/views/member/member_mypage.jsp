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
	margin:100px auto;
	width:100%;
	height:150px;
}

.myInfo{
	width:60%;
	margin:auto;
}

.infoImgWrapper{
	float:left;
}

.infoImg{
	width:138px;
	height:138px;
	border:1px solid lightgray;
	border-radius:6px;
	cursor:default;
}

.infoTextWrapper{
	float:left;
	margin: 20px 20px;
}

.memberEmail{
	float:left;
	font-weight:bold;
    font-size: 1.17em;
    margin-bottom:10px;
}

.editBtnWrapper{
	float:left;
	margin-left:10px;
	font-size:0.8em;
}

.editBtn{
	width:15px;
	cursor:pointer;
	margin-right:5px;
}

.cards{
	width:100%;
	margin-top:0;
	background-color:#ededed;
}

.cardarea{
	margin:auto;
	padding-top:20px;
	width:80%;
}

.memberNick{
	display:inline-block;
}
</style>
</head>
<body>
<!-- <a href="memberupview">수정</a>
<a href="memberdel">회원탈퇴</a> -->
<div class="body">
	<div class="myInfos">
		<div class="myInfo">
			<div class="infoImgWrapper"><img class="infoImg" src="${path}/resources/ps_images/profile/<%=session.getAttribute("mem_primg") %>"></div>
			<div class="infoTextWrapper">
				<div class="memberEmailWrapper">
					<div class="memberEmail"><%=session.getAttribute("mem_id") %></div>
					<div class="editBtnWrapper"><img class="editBtn" src="${path}/resources/icons/edit_gear.png">edit</div>
				</div>
				<div class="memberNick"><%=session.getAttribute("mem_nick") %></div>
			</div>
		</div>
	</div>
<div id="cards" class="cards">
					<div id="cardarea" class="cardarea">
						<c:forEach var="p" items="${psList}">
							<div class="card">
								<img class="cardImg" src="${path}/resources/ps_images/postscript/${p.ps_image}">
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
									<img class="cardProfile" src="${path}/resources/ps_images/profile/${p.mem_primg}"><span class="count">${p.mem_nick}</span>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- <div id="loading" class="sk-fading-circle">
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
				</div> -->
		<input type="hidden" id="psListSize" value="${psListSize }">
		</div>
</body>
</html>
