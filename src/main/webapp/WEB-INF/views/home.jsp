<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String mem_id = (String)session.getAttribute("mem_id");
	
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/home_navigator.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/home_cardlayout.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/home_slider.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/home_search.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/home_footer.css" />">
	
	<title>MyDate - Find Your Own Date</title>
	<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			//alert("aa");
			$("#emergency").hide();
			$("#hurry").hover(function(){
				//alert("aa");
				$("#emergency").toggle();
			});
			$(".searchBtn").on("click", function(){
				$(this).css("background-color","#c1134e");
			});
		});
	</script>
</head>
<body>
<%-- <h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P> --%>

<!-- navigator -->
		<header class="navi-wrapper">
				<div class="navigator">
					<div style="float:left;">
				<div class="logo"><a href="${path}/home"><img src="">MyDate</a></div>
				<ul class="naviul">
					<li class="navili"><a href="${path}/planner">내가 짜줌</a></li>
					<li class="navili"><a href="${path}/psList?method=listAll">다녀왔어요</a></li>
							<li class="navili hurry"><a id="hurry" href="#">급한 마음<img id="emergency" style="width:15px;height:15px;" src="<c:url value="/icons/emergency.png" />"></a></li>
						</ul>
					</div>
					<div style="float:right;margin:5px;font-size:10pt;">
					<%	if(mem_id==null){
						
					 %>
							<div class="member"><a href="${path}/member/memberlogview">로그인&nbsp;</a></div>
							<div class="member"><a href="${path}/member/memberinsview">&nbsp;회원가입</a></div>
							<%}else{
								%>
								<div class="member"><%=mem_id %>님 환영합니다.</div>
								<div class="member"><a href="${path}/member/memberlogout">로그아웃&nbsp;</a></div>
								<div class="member"><a href="${path}/member/membermypage">마이페이지&nbsp;</a></div>
								
							<%} %>
					</div>
			</div>
		</header>
		
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
				<div id="search">
					<form action="#" name="searchForm">
						<img class="icon-search" src="<c:url value="/icons/search.png" />">
						<input type="text" class="searchMain" name="keyword" placeholder="데이트 장소 검색하기" autocomplete="off" autofocus>
						<input type="submit" class="searchBtn" value="GO!">
					</form>
				</div>
				
				<!-- card layout -->
				<div id="cards" class="cards">
					<div id="cardarea" class="cardarea">
						<div class="card">
							<img class="cardImg" src="<c:url value="/icons/1.jpg" />">
							<div class="cardTitle">여기 다녀왔어요!!!</div>
							<div class="cardWriter">
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/like.png" />"><span class="count">254</span>
								</div>
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/comment.png" />"><span class="count">22</span>
								</div>
							</div>
							<div class="cardBottom">
								<img class="cardProfile" src="<c:url value="/icons/userm.png" />"><span class="count">kyle.kim</span>
							</div>
						</div>
						<div class="card">
							<img class="cardImg" src="<c:url value="/icons/2.jpg" />">
							<div class="cardTitle">여기 다녀왔어요!!!</div>
							<div class="cardWriter">
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/like.png" />"><span class="count">254</span>
								</div>
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/comment.png" />"><span class="count">22</span>
								</div>
							</div>
							<div class="cardBottom">
								<img class="cardProfile" src="<c:url value="/icons/userm.png" />"><span class="count">kyle.kim</span>
							</div>
						</div>
						<div class="card">
							<img class="cardImg" src="<c:url value="/icons/3.jpg" />">
							<div class="cardTitle">여기 다녀왔어요!!!</div>
							<div class="cardWriter">
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/like.png" />"><span class="count">254</span>
								</div>
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/comment.png" />"><span class="count">22</span>
								</div>
							</div>
							<div class="cardBottom">
								<img class="cardProfile" src="<c:url value="/icons/userm.png" />"><span class="count">kyle.kim</span>
							</div>
						</div>
						<div class="card">
							<img class="cardImg" src="<c:url value="/icons/4.jpg" />">
							<div class="cardTitle">여기 다녀왔어요!!!</div>
							<div class="cardWriter">
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/like.png" />"><span class="count">254</span>
								</div>
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/comment.png" />"><span class="count">22</span>
								</div>
							</div>
							<div class="cardBottom">
								<img class="cardProfile" src="<c:url value="/icons/userm.png" />"><span class="count">kyle.kim</span>
							</div>
						</div>
						<div class="card">
							<img class="cardImg" src="<c:url value="/icons/1.jpg" />">
							<div class="cardTitle">여기 다녀왔어요!!!</div>
							<div class="cardWriter">
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/like.png" />"><span class="count">254</span>
								</div>
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/comment.png" />"><span class="count">22</span>
								</div>
							</div>
							<div class="cardBottom">
								<img class="cardProfile" src="<c:url value="/icons/userm.png" />"><span class="count">kyle.kim</span>
							</div>
						</div>
						<div class="card">
							<img class="cardImg" src="<c:url value="/icons/1.jpg" />">
							<div class="cardTitle">여기 다녀왔어요!!!</div>
							<div class="cardWriter">
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/like.png" />"><span class="count">254</span>
								</div>
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/comment.png" />"><span class="count">22</span>
								</div>
							</div>
							<div class="cardBottom">
								<img class="cardProfile" src="<c:url value="/icons/userm.png" />"><span class="count">kyle.kim</span>
							</div>
						</div>
						<div class="card">
							<img class="cardImg" src="<c:url value="/icons/1.jpg" />">
							<div class="cardTitle">여기 다녀왔어요!!!</div>
							<div class="cardWriter">
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/like.png" />"><span class="count">254</span>
								</div>
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/comment.png" />"><span class="count">22</span>
								</div>
							</div>
							<div class="cardBottom">
								<img class="cardProfile" src="<c:url value="/icons/userm.png" />"><span class="count">kyle.kim</span>
							</div>
						</div>
						<div class="card">
							<img class="cardImg" src="<c:url value="/icons/1.jpg" />">
							<div class="cardTitle">여기 다녀왔어요!!!</div>
							<div class="cardWriter">
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/like.png" />"><span class="count">254</span>
								</div>
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/comment.png" />"><span class="count">22</span>
								</div>
							</div>
							<div class="cardBottom">
								<img class="cardProfile" src="<c:url value="/icons/userm.png" />"><span class="count">kyle.kim</span>
							</div>
						</div>
						<div class="card">
							<img class="cardImg" src="<c:url value="/icons/1.jpg" />">
							<div class="cardTitle">여기 다녀왔어요!!!</div>
							<div class="cardWriter">
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/like.png" />"><span class="count">254</span>
								</div>
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/comment.png" />"><span class="count">22</span>
								</div>
							</div>
							<div class="cardBottom">
								<img class="cardProfile" src="<c:url value="/icons/userm.png" />"><span class="count">kyle.kim</span>
							</div>
						</div>
						<div class="card">
							<img class="cardImg" src="<c:url value="/icons/1.jpg" />">
							<div class="cardTitle">여기 다녀왔어요!!!</div>
							<div class="cardWriter">
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/like.png" />"><span class="count">254</span>
								</div>
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/comment.png" />"><span class="count">22</span>
								</div>
							</div>
							<div class="cardBottom">
								<img class="cardProfile" src="<c:url value="/icons/userm.png" />"><span class="count">kyle.kim</span>
							</div>
						</div>
						<div class="card">
							<img class="cardImg" src="<c:url value="/icons/1.jpg" />">
							<div class="cardTitle">여기 다녀왔어요!!!</div>
							<div class="cardWriter">
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/like.png" />"><span class="count">254</span>
								</div>
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/comment.png" />"><span class="count">22</span>
								</div>
							</div>
							<div class="cardBottom">
								<img class="cardProfile" src="<c:url value="/icons/userm.png" />"><span class="count">kyle.kim</span>
							</div>
						</div>
						<div class="card">
							<img class="cardImg" src="<c:url value="/icons/1.jpg" />">
							<div class="cardTitle">여기 다녀왔어요!!!</div>
							<div class="cardWriter">
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/like.png" />"><span class="count">254</span>
								</div>
								<div class="likeAndComment">
									<img class="icons" src="<c:url value="/icons/comment.png" />"><span class="count">22</span>
								</div>
							</div>
							<div class="cardBottom">
								<img class="cardProfile" src="<c:url value="/icons/userm.png" />"><span class="count">kyle.kim</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- footer -->
		<footer>
			<div>Copyright <img style="width:13px;" src="<c:url value="/icons/copyright.png" />"> 2016-2020 Team 404Plan All right reserved.</div>
		</footer>
</body>
</html>
