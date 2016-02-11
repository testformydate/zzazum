<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/home_navigator.css" />">
<!-- navigator -->
<style>
/* Navigation Menu - Background */
.navigation {
  /* critical sizing and position styles */
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 0;
  
  /* non-critical appearance styles */
  list-style: none;
  background: #111;
}

/* Navigation Menu - List items */
.nav-item {
  /* non-critical appearance styles */
  width: 200px;
  border-top: 1px solid #111;
  border-bottom: 1px solid #000;
}

.nav-item a {
  /* non-critical appearance styles */
  display: block;
  padding: 1em;
  background: linear-gradient(135deg, rgba(0,0,0,0) 0%,rgba(0,0,0,0.65) 100%);
  color: white;
  font-size: 1.2em;
  text-decoration: none;
  transition: color 0.2s, background 0.5s;
}

.nav-item a:hover {
  color: #c74438;
  background: linear-gradient(135deg, rgba(0,0,0,0) 0%,rgba(75,20,20,0.65) 100%);
}

/* Site Wrapper - Everything that isn't navigation */
.site-wrap {
  /* Critical position and size styles */
  min-height: 100%;
  min-width: 100%;
  background-color: white; /* Needs a background or else the nav will show through */
  position: relative;
  top: 0;
  bottom: 100%;
  left: 0;
  z-index: 1;
  
  /* non-critical apperance styles */
  padding: 4em;
  background-image: linear-gradient(135deg, rgb(254,255,255) 0%,rgb(221,241,249) 35%,rgb(160,216,239) 100%);
  background-size: 200%;
}

/* Nav Trigger */
.nav-trigger {
  /* critical styles - hide the checkbox input */
  position: absolute;
  clip: rect(0, 0, 0, 0);
}

label[for="nav-trigger"] {
  /* critical positioning styles */
  position: fixed;
  left: 15px; top: 15px;
  z-index: 2;
  
  /* non-critical apperance styles */
  height: 30px;
  width: 30px;
  cursor: pointer;
  background-image: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' version='1.1' x='0px' y='0px' width='30px' height='30px' viewBox='0 0 30 30' enable-background='new 0 0 30 30' xml:space='preserve'><rect width='30' height='6'/><rect y='24' width='30' height='6'/><rect y='12' width='30' height='6'/></svg>");
  background-size: contain;
}

/* Make the Magic Happen */
.nav-trigger + label, .site-wrap {
  transition: left 0.2s;
}

.nav-trigger:checked + label {
  left: 215px;
}

.nav-trigger:checked ~ .site-wrap {
  left: 200px;
  box-shadow: 0 0 5px 5px rgba(0,0,0,0.5);
}

body {
    /* Without this, the body has excess horizontal scroll when the menu is open */
  overflow-x: hidden;
}

/* Additional non-critical styles */

h1, h3, p {
  max-width: 600px;
  margin: 0 auto 1em;
}

code {
    padding: 2px;
    background: #ddd;
}

/* Micro reset */
*,*:before,*:after{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;margin:0;padding:0;}
html, body { height: 100%; width: 100%; font-family: Helvetica, Arial, sans-serif; }
/* search bar */
div#search{
	margin:15px auto;
	/* border: 1px solid #69D2E7; */
	/* position:relative;
	margin-top:-300px;
	margin-left:485px; */
	background-color:#e0e0e0;
	width:300px;
	height:30px;
	line-height:30px;
	border-radius:5px;
}

.icon-search{
	width:17px;
	margin:6px;
	float:left;
	padding-right: 3px;
	border-right: 1px solid lightgray;
}

.searchMain{
	height:25px;
	outline-style:none;
	background-color:#e0e0e0;
	font-size:15pt;
	border:none;
	float:left;
	width:224px;
	font-family:나눔고딕;
}

.searchBtn{
	margin:0;
	padding:0;
	border:0;
	float:right;
	width:40px;
	height:30px;
	background-color:#69D2E7;
	font-size:13pt;
	font-family:Sans-serif;
	color:white;
	border-top-right-radius:5px;
	border-bottom-right-radius:5px;
}
</style>
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
	// to fade in on page load
    $("body").css("display", "none");
    $("body").fadeIn(400); 
    // to fade out before redirect
    $('a').click(function(e){
        redirect = $(this).attr('href');
        e.preventDefault();
        $('body').fadeOut(400, function(){
            document.location.href = redirect
        });
    });
});
</script>
<title>MyDate - Find Your Own Date</title>
<header class="navi-wrapper">
		<div class="navigator">
			<div style="float:left;">
				<ul class="navigation">
				    <li class="nav-item"><a href="#">Home</a></li>
				    <li class="nav-item"><a href="#">Portfolio</a></li>
				    <li class="nav-item"><a href="#">About</a></li>
				    <li class="nav-item"><a href="#">Blog</a></li>
				    <li class="nav-item"><a href="#">Contact</a></li>
				</ul>
				
				<input type="checkbox" id="nav-trigger" class="nav-trigger" />
				<label for="nav-trigger"></label>
				
				<div class="logo"><a href="${path}/home"><img src="">MyDate</a></div>
				<ul class="naviul">
					<li class="navili" id="planner"><a id="planner" href="${path}/planner">내가 짜줌</a></li>
					<li class="navili" id="psList"><a id="psList" href="${path}/psList?method=listAll">다녀왔어요</a></li>
					<li class="navili hurry" id="hurry"><a id="hurry" href="#">급한 마음<img id="emergency" style="width:15px;height:15px;" src="<c:url value="/icons/emergency.png" />"></a></li>
					<li class="navili">
						<div id="search">
							<form action="#" name="searchForm">
								<img class="icon-search" src="<c:url value="/icons/search.png" />">
								<input type="text" class="searchMain" id="keyword" name="keyword" placeholder="예:서울,경기,여의도" autocomplete="off" autofocus>
								<input type="submit" class="searchBtn" value="GO!">
							</form>
						</div>
						<div class="ui-widget" style="margin:auto;">
							<ul id="searchResult" style="list-style:none; margin:auto;padding:0;background-color:white;border:1px solid lightgray;" class="results"></ul>
						</div>
						</li>
				</ul>
			</div>
			<div style="float:right;margin:5px;font-size:10pt;">
					<div class="member"><a href="#">로그인&nbsp;</a></div>
					<div class="member"><a href="${path}/member/memberinsview">&nbsp;회원가입</a></div>
			</div>
	</div>
</header>
