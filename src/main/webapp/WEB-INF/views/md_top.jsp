<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	 String mem =(String)session.getAttribute("mem_id");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/home_navigator.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/planner_selection.css" />">
<!-- navigator -->
<style>
body{
	margin-bottom:70px;
}
/* search bar */
div#search{
	margin:12px auto;
	/* border: 1px solid #69D2E7; */
	/* position:relative;
	margin-top:-300px;
	margin-left:485px; */
	background-color:white;
	width:500px;
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
	background-color:white;
	font-size:15pt;
	border:none;
	float:left;
	width:423px;
	font-family:나눔고딕;
}

.searchBtn{
	margin:0;
	padding:0;
	border:0;
	float:right;
	width:40px;
	height:30px;
	background-color:#00cdcd;
	font-size:13pt;
	font-family:Sans-serif;
	color:white;
	border-top-right-radius:5px;
	border-bottom-right-radius:5px;
	cursor:pointer;
	border:2px solid white;
}

.searchBtn:hover{
	background-color:#c1134e;
}

/*navigation box*/

/* #nav-toggle { position: absolute; left: 5%; top: 50%; }
 */
#nav-toggle { cursor: pointer; padding: 15px 35px 16px 0px; margin-top:10px;}
#nav-toggle span, #nav-toggle span:before, #nav-toggle span:after {
  cursor: pointer;
  border-radius: 1px;
  height: 3px;
  width: 20px;
  background: white;
  position: absolute;
  display: block;
  content: '';
}
#nav-toggle span:before {
  top: -5px; 
}
#nav-toggle span:after {
  bottom: -5px;
}

#nav-toggle span, #nav-toggle span:before, #nav-toggle span:after {
  transition: all 500ms ease-in-out;
}
#nav-toggle.active span {
  background-color: transparent;
}
#nav-toggle.active span:before, #nav-toggle.active span:after {
  top: 0;
}
#nav-toggle.active span:before {
  transform: rotate(45deg);
}
#nav-toggle.active span:after {
  transform: rotate(-45deg);
}

.pageLinks{
	color:white;
	background-color: #00cdcd;
	padding:7px;
	font-family:'Nanum Gothic';
	border-radius:3px;
}

.pageLinks:hover{
	background-color:#2FAEAE;
	color:white !important;
	font-family:'Nanum Gothic';
}


.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 999;
    top: 55px;
    left: 0;
    background-color: #00cdcd;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: white;
    display: block;
    transition: 0.3s
}

.sidenav a:hover, .offcanvas a:focus{
    color: #c1134e;
}

.sidenav-actif {
    height: 100%;
    width: 250px;
    position: fixed;
    z-index: 999;
    top: 55px;
    left: 0;
    background-color: #00cdcd;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav-actif a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: white;
    display: block;
    transition: 0.3s
}

.sidenav-actif a:hover, .offcanvas a:focus{
    color: #c1134e;
}

.closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px !important;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

.cardProfile {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    margin: 0 10px;
}

.memberUpload{
	top:0;
	top:10px;
	right:222px;
	margin:0;
	padding:0;
	background-color:white;
	border-radius:3px;
	padding-left:10px;
	padding-right:10px;
	display:inline-block;
	margin-right:20px;
	cursor:pointer;
	border:2px solid lightgray;
	position:absolute;
}

.memberUpload:hover{
	background-color:lightgray;
}

.memberImgWrapper{
	display:inline-block;
	margin-top:10px;
}

.memberDetail{
	top:0;
	right:0;
	top:50px;
	right:150px;
	background-color:white;
	border:1px solid lightgray;
	padding:20px;
	box-shadow:1px 1px 10px gray;
	position:absolute;
	display:inline-block;
}
</style>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
function search(keyword){
	//var ck_keyword = /[a-zA-Z0-9\~!@#$%^&*()_-.,]*$/
	var ch = /[가-힣]+/
	if(!ch.test(keyword)) {
		alert("해커냐?");
		$("#searchResult").hide();
		$("#autocompleteClose").hide();
	}
	//alert(keyword);
// 	$(".box-font-active").attr("class","box-font");
	$(".stepContent-active").attr("class","stepContent");
	$("#keyword").attr("value", keyword);
	searchForm.keyword.focus();
	searchForm.submit();
}

function openNav() {
    document.getElementById("sideNav").style.width = "250px";
}

function closeNav() {
    document.getElementById("sideNav").style.width = "0";
}

$(document).ready(function(){
	/* var ck_keyword = /^[A-Za-z0-9\~!@#$%^&*()_-.,]*$/; */
	var ck_keyword = /^[가-힣]*$/
	var autocompleteListId = 0; 
	var rowIdx = 0;
	
	$(".body").click(function(){
		$("#searchResult").slideUp();
	});
	
	$("#autocompleteClose").click(function(){
			$(this).hide();
			$('#searchResult').slideUp();
	});
	
	$("#searchResult").hide();
	$("#autocompleteClose").hide();
	$("#keyword").keyup(function(e){
		console.log("keyCode: " + e.keyCode);
		var keyword = searchForm.keyword.value;
		var currentId = 0;
		
		if(e.keyCode == 37){
			//left
			//alert("aa");
			console.log("left reset currentId: " + currentId);
			currentId = parseInt(searchForm.resultIndex.value);
			console.log("left searchForm Value: " + currentId);
 			if(currentId == 0) {
				searchForm.resultIndex.value = autocompleteListId;
				currentId = autocompleteListId;
				//console.log(autocompleteListId);
			}else{
				currentId = currentId - 1;
				searchForm.resultIndex.value = currentId;
			}
			//console.log(e.keyCode + " " + currentId);
			var tagId = "#list" + currentId;
			console.log("left currentId: " + currentId);
			//console.log(tagId);
			$(".box-font-active").attr("class","box-font");
			$(".stepContent-active").attr("class","stepContent");
			$(tagId).toggleClass("box-font-active");
			$(tagId + "wrapper").toggleClass("stepContent-active");
			//alert($(tagId).attr("name"));
			var injectedWord = $(tagId).attr("name");
			//console.log(injectedWord);
			$("#keyword").attr("value", injectedWord);
			searchForm.keyword.focus();
			return;
		}else if(e.keyCode == 39){
			//right
			//alert("aa");
			console.log("right reset currentId: " + currentId);
			currentId = parseInt(searchForm.resultIndex.value);
			console.log("right searchForm Value: " + currentId);
			if(currentId == autocompleteListId) {
				searchForm.resultIndex.value = -1;
			}else{
				currentId = currentId + 1;
				searchForm.resultIndex.value = currentId;				
			}
			//console.log(e.keyCode + " " + currentId);
			var tagId = "#list" + currentId;
			console.log("right currentId: " + currentId);
			$(".box-font-active").attr("class","box-font");
			$(".stepContent-active").attr("class","stepContent");
			$(tagId).toggleClass("box-font-active");
			$(tagId + "wrapper").toggleClass("stepContent-active");
			//alert($(tagId).attr("name"));
			var injectedWord = $(tagId).attr("name");
			//console.log(injectedWord);
			$("#keyword").attr("value", injectedWord);
			searchForm.keyword.focus();
			return;
		}else if(e.keyCode == 38){
			//up
			//alert("aa");
			console.log("up reset currentId: " + currentId);
			currentId = parseInt(searchForm.resultIndex.value);
			console.log("up searchForm Value: " + currentId);
			if(currentId == 0){
				searchForm.resultIndex.value = autocompleteListId;
			}else{
				currentId = currentId - 4;
				searchForm.resultIndex.value = currentId;				
			}
			//console.log(e.keyCode + " " + currentId);
			var tagId = "#list" + currentId;
			console.log("up currentId" + currentId);
			$(".box-font-active").attr("class","box-font");
			$(".stepContent-active").attr("class","stepContent");
			$(tagId).toggleClass("box-font-active");
			$(tagId + "wrapper").toggleClass("stepContent-active");
			//alert($(tagId).attr("name"));
			var injectedWord = $(tagId).attr("name");
			//console.log(injectedWord);
			$("#keyword").attr("value", injectedWord);
			searchForm.keyword.focus();
			return;
		}else if(e.keyCode == 40){
			//down
			//alert("aa");
			console.log("down reset currentId: " + currentId);
			currentId = parseInt(searchForm.resultIndex.value)
			console.log("down searchForm Value: " + currentId);;
			if(currentId == autocompleteListId) {
				searchForm.resultIndex.value = 0;
			}/* else if(currentId == 0){
				searchForm.resultIndex.value = 0;
			} */else{
				currentId = currentId + 4;
				searchForm.resultIndex.value = currentId;				
			}
			//console.log(e.keyCode + " " + currentId);
			var tagId = "#list" + currentId;
			console.log("down currentId: " + currentId);
			//console.log(tagId);
			$(".box-font-active").attr("class","box-font");
			$(".stepContent-active").attr("class","stepContent");
			$(tagId).toggleClass("box-font-active");
			$(tagId + "wrapper").toggleClass("stepContent-active");
			//alert($(tagId).attr("name"));
			var injectedWord = $(tagId).attr("name");
			//console.log(injectedWord);
			$("#keyword").attr("value", injectedWord);
			searchForm.keyword.focus();
			return;
		}else if(e.keyCode == 27){
			searchForm.keyword.focus();
			$("#searchResult").hide();
			searchForm.resultIndex.value = -1;
			return;
		}
		setTimeout(function(){
			//console.log("aaa");
			//console.log(e.keyCode);
			$.ajax({
				url:"${path}/autocomplete",
				data: "keyword=" + keyword,
				success: function(data){
					//console.log(data)
					var str = "";
					$(data).each(function(index, objArr){
						//arr = objArr.datas[index];
						//console.log(index);
						//console.log(objArr.name);
						//console.log(objArr.datas[0].id);
						str += "<li id='list" + index + "wrapper' class='result stepContent' style='width:23%;display:inline-block;margin:5px;'><span id='list" + index + "' name='" + objArr.name + "' class='suggestionList box-font' onclick=\"javascript:search('" + objArr.name + "')\" onfocus=\"javascript:search('" + objArr.name + "')\">" + objArr.name + "</span></li>";
						//str = objArr.name
						$("#resultBox").html(str);
						if(objArr == "" || objArr == null) $("#searchResult").hide(); 
						$("#searchResult").slideDown();
						$("#autocompleteClose").show();
						autocompleteListId = index;
						rowIdx = index / 4;
						//console.log(autocompleteListId + " " + rowIdx);
						searchForm.resultIndex.value = 0;
					});
					if(keyword == "" || keyword == null){
						$("#searchResult").hide();
						$("#autocompleteClose").hide();
					}
					//$("#searchResult").autocomplete({source:[str]});
				}
			});
			console.log(e.keyCode);
			if(e.keyCode == 13){
				searchForm.submit();
			}
		}, 1300);
		//console.log(e.keyCode)
	});
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
    $(".body").css("display", "none").slideDown();
	/* $(".body").css("width", "0"); */
    /* $(".body").fadeIn(400); */
	//$(".body").show( "slide", {direction: "up" }, 2000 );
    /* $(".body").animate({width:'toggle'},350); */
    // Set the effect type
/*     var effect = 'slide';

    // Set the options for the effect type chosen
    var options = { direction: 'right' };

    // Set the duration (default: 400 milliseconds)
    var duration = 500;

    $('.body').toggle(effect, options, duration); */
    // to fade out before redirect
    $('.pageLinks').click(function(e){
        redirect = $(this).attr('href');
        e.preventDefault();
        $('.body').slideUp();
        $('.body').fadeOut(400, function(){
            document.location.href = redirect
        });
    });
	// navigation box
	$("#nav-toggle").click(function(){
		//alert("aa");
	    $(this).toggleClass("active");
 	    $("#sideNav").toggleClass("sidenav-actif");
	});
	$(".body").click(function(){
		var state = $("#sideNav").attr("class");
//		alert(state);
		if(state == "sidenav sidenav-actif"){
			$("#sideNav").attr("class","sidenav");
//			alert($("#sideNav").attr("class"));
			$("#nav-toggle").attr("class","");
 			/* $("#sideNav").css("width","0"); */
		}
	});
	
	$("#memberUpload").click(function(){
		location.href = "psListInsert";
	});
});
</script>
<title>MyDate - Find Your Own Date</title>
		<div id="sideNav" class="sidenav">
		  <!-- <a href="javascript:void(0)" class="closebtn">X</a> -->
		  <a href="${path}/home">메인으로</a>
		  <a href="${path}/planner">데이트 짜기</a>
		  <a href="${path}/psListAll">서연이가 함</a>
		  <a href="${path}/community/cm_list?part_no=0">커뮤니티 미완성</a>
		  <a href="#">Contact</a>
		</div>
<header class="navi-wrapper">
		<div class="navigator">
			<div style="float:left;width:100%;">
				<ul class="naviul">
					<li class="navili">
						<div id="nav-toggle"><span></span></div>
					</li>
					<li class="navili"><div class="logo"><a href="${path}/home"><img class="logo" src="<c:url value="/icons/mydatelogo.png" />"></a></div></li>
					<%-- <li class="navili" id="planner"><a id="planner" href="${path}/planner">내가 짜줌</a></li>
					<li class="navili" id="psList"><a id="psList" href="${path}/psList?method=listAll">다녀왔어요</a></li>
					<li class="navili hurry" id="hurry"><a id="hurry" href="#">급한 마음<img id="emergency" style="width:15px;height:15px;" src="<c:url value="/icons/emergency.png" />"></a></li> --%>
					<li class="navili">
						<div id="search">
							<form action="${path}/keyword" name="searchForm">
								<input type="hidden" id="resultIndex" name="resultIndex" value="0" />
								<img class="icon-search" src="<c:url value="/icons/search.png" />">
								<input type="text" class="searchMain" id="keyword" name="keyword" value="${exKeyword}" placeholder="예:서울,여의도, 강남" autocomplete="off">
								<button class="searchBtn"><img width="20px;" src="<c:url value="/icons/enter-arrow.png" />"></button>
								<!-- <input type="submit" class="searchBtn" value="GO!"> -->
							</form>
						</div>
					</li>
				</ul>
					<div style="float:right;display:inline-block;font-size:10pt;">
							<%	if(mem==null){ %>
						<div class="member"><a class="pageLinks" href="${path}/member/memberlogview">로그인</a></div>
						<div class="member"><a class="pageLinks" href="${path}/member/memberinsview">회원가입</a></div>
						<% }else{ %>
							<div id="memberUpload" class="memberUpload">후기쓰기</div>
							<div class="memberImgWrapper"><img class="cardProfile" src="resources/ps_images/profile/<%=session.getAttribute("mem_primg") %>"></div>
							<div class="memberDetail">
								<div>
									<div class="member"><%=session.getAttribute("mem_id") %></div>
								</div>
								<div class="member"><a class="pageLinks" href="${path}/member/memberlogout">로그아웃</a></div>
								<div class="member"><a class="pageLinks" href="${path}/member/membermypage">마이페이지</a></div>
							</div>
							<c:set var="mem_id" value="<%=mem %>" />
						<%} %>
					</div>						
			</div>
		</div>
		<div id="searchResult" style="background-color:white;border-bottom:1px solid lightgray;width:100%;height:300px;overflow:auto;">
			<div id="autocompleteClose" style="color:lightgray;font-weight:600;font-size:1.5em;cursor:pointer;text-align:right;padding-right:40px;">X</div>
			<ul id="resultBox" style="list-style:none;margin-left:30px;"></ul>
		</div>
</header>
