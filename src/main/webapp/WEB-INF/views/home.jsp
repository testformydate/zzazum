<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/home_navigator.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/home_cardlayout.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/home_slider.css" />">
	<style type="text/css">
	/*loading*/
.sk-fading-circle {
	/* display:none; */
	margin:60px 780px;
	width: 40px;
	height: 40px;
	position: absolute;
	z-index:999;
}

.sk-fading-circle .sk-circle {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
}

.sk-fading-circle .sk-circle:before {
	content: '';
	display: block;
	margin: 0 auto;
	width: 15%;
	height: 15%;
	background-color: #333;
	border-radius: 100%;
	-webkit-animation: sk-circleFadeDelay 1.2s infinite ease-in-out both;
	animation: sk-circleFadeDelay 1.2s infinite ease-in-out both;
}
.sk-fading-circle .sk-circle2 {
  -webkit-transform: rotate(30deg);
      -ms-transform: rotate(30deg);
          transform: rotate(30deg);
}
.sk-fading-circle .sk-circle3 {
  -webkit-transform: rotate(60deg);
      -ms-transform: rotate(60deg);
          transform: rotate(60deg);
}
.sk-fading-circle .sk-circle4 {
  -webkit-transform: rotate(90deg);
      -ms-transform: rotate(90deg);
          transform: rotate(90deg);
}
.sk-fading-circle .sk-circle5 {
  -webkit-transform: rotate(120deg);
      -ms-transform: rotate(120deg);
          transform: rotate(120deg);
}
.sk-fading-circle .sk-circle6 {
  -webkit-transform: rotate(150deg);
      -ms-transform: rotate(150deg);
          transform: rotate(150deg);
}
.sk-fading-circle .sk-circle7 {
  -webkit-transform: rotate(180deg);
      -ms-transform: rotate(180deg);
          transform: rotate(180deg);
}
.sk-fading-circle .sk-circle8 {
  -webkit-transform: rotate(210deg);
      -ms-transform: rotate(210deg);
          transform: rotate(210deg);
}
.sk-fading-circle .sk-circle9 {
  -webkit-transform: rotate(240deg);
      -ms-transform: rotate(240deg);
          transform: rotate(240deg);
}
.sk-fading-circle .sk-circle10 {
  -webkit-transform: rotate(270deg);
      -ms-transform: rotate(270deg);
          transform: rotate(270deg);
}
.sk-fading-circle .sk-circle11 {
  -webkit-transform: rotate(300deg);
      -ms-transform: rotate(300deg);
          transform: rotate(300deg); 
}
.sk-fading-circle .sk-circle12 {
  -webkit-transform: rotate(330deg);
      -ms-transform: rotate(330deg);
          transform: rotate(330deg); 
}
.sk-fading-circle .sk-circle2:before {
  -webkit-animation-delay: -1.1s;
          animation-delay: -1.1s; 
}
.sk-fading-circle .sk-circle3:before {
  -webkit-animation-delay: -1s;
          animation-delay: -1s; 
}
.sk-fading-circle .sk-circle4:before {
  -webkit-animation-delay: -0.9s;
          animation-delay: -0.9s; 
}
.sk-fading-circle .sk-circle5:before {
  -webkit-animation-delay: -0.8s;
          animation-delay: -0.8s; 
}
.sk-fading-circle .sk-circle6:before {
  -webkit-animation-delay: -0.7s;
          animation-delay: -0.7s; 
}
.sk-fading-circle .sk-circle7:before {
  -webkit-animation-delay: -0.6s;
          animation-delay: -0.6s; 
}
.sk-fading-circle .sk-circle8:before {
  -webkit-animation-delay: -0.5s;
          animation-delay: -0.5s; 
}
.sk-fading-circle .sk-circle9:before {
  -webkit-animation-delay: -0.4s;
          animation-delay: -0.4s;
}
.sk-fading-circle .sk-circle10:before {
  -webkit-animation-delay: -0.3s;
          animation-delay: -0.3s;
}
.sk-fading-circle .sk-circle11:before {
  -webkit-animation-delay: -0.2s;
          animation-delay: -0.2s;
}
.sk-fading-circle .sk-circle12:before {
  -webkit-animation-delay: -0.1s;
          animation-delay: -0.1s;
}

@-webkit-keyframes sk-circleFadeDelay {
  0%, 39%, 100% { opacity: 0; }
  40% { opacity: 1; }
}

@keyframes sk-circleFadeDelay {
  0%, 39%, 100% { opacity: 0; }
  40% { opacity: 1; } 
}
	</style>
<%@include file="md_top.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#goPlannerSweet").click(function(){
		location.href = "planner";
	});
	$("#goPlannerWar").click(function(){
		location.href = "planner";
	});
	$("#goPlannerHot").click(function(){
		location.href = "planner";
	});
	$("#goPlannerCool").click(function(){
		location.href = "planner";
	});
});
</script>
</head>
		<!-- body -->
		<div class="body">
			<!-- slider -->
			<div id="slider">
				<figure id="image">
					<img src="http://demosthenes.info/assets/images/austin-fireworks.jpg" alt="">
					<img src="http://demosthenes.info/assets/images/taj-mahal.jpg" alt="">
					<img src="http://demosthenes.info/assets/images/ibiza.jpg" alt="">
					<img src="http://demosthenes.info/assets/images/ankor-wat.jpg" alt="">
					<img src="http://demosthenes.info/assets/images/austin-fireworks.jpg" alt="">
				</figure>
				<figure id="buttons">
					<div id="goPlannerSweet" class="goPlanner">달콤한 데이트 짜러가기♥</div>
					<div id="goPlannerWar" class="goPlanner">살벌한 데이트 짜러가기♥</div>
					<div id="goPlannerHot" class="goPlanner">뜨거운 데이트 짜러가기♥</div>
					<div id="goPlannerCool" class="goPlanner">쿠울한 데이트 짜러가기♥</div>
				</figure>
			</div>
			<div class="connectDatas">
				<!-- search -->
				<%-- <div id="search">
					<form action="#" name="searchForm">
						<img class="icon-search" src="<c:url value="/icons/search.png" />">
						<input type="text" class="searchMain" name="keyword" placeholder="데이트 장소 검색하기" autocomplete="off" autofocus>
						<input type="submit" class="searchBtn" value="GO!">
					</form>
				</div> --%>
				
				<!-- card layout -->
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
			</div>
		</div>
</body>
</html>
