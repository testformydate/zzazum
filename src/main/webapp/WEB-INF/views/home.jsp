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
									<img class="cardProfile" src="<c:url value="/icons/userm.png" />"><span class="count">${p.ps_email}</span>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
