<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String mem_id = (String)session.getAttribute("mem_id");
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/home_navigator.css" />">
<!-- navigator -->
<style>
/* search bar */
div#search{
	margin:7px auto;
	/* border: 1px solid #69D2E7; */
	/* position:relative;
	margin-top:-300px;
	margin-left:485px; */
	background-color:#e0e0e0;
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
	background-color:#e0e0e0;
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
	background-color:#69D2E7;
	font-size:13pt;
	font-family:Sans-serif;
	color:white;
	border-top-right-radius:5px;
	border-bottom-right-radius:5px;
	cursor:pointer;
}
</style>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
/* function search(keyword){
	$("#keyword").attr("value", keyword);
} */
$(document).ready(function(){
	$("#searchResult").hide();
	/* $("#keyword").blur(function(){
		$("#searchResult").hide();
	}); */
	$("#keyword").keyup(function(e){
		var keyword = searchForm.keyword.value;
		setTimeout(function(){
			//console.log("aaa");
			//console.log(e.keyCode);
			$.ajax({
				url:"autocomplete",
				data: "keyword=" + keyword,
				success: function(data){
					console.log(data)
					var str = "";
					$(data).each(function(index, objArr){
						//arr = objArr.datas[index];
						//console.log(index);
						//console.log(objArr.name);
						//console.log(objArr.datas[0].id);
						str += "<li class='result' style='width:23%;display:inline-block;'><a class='suggestionList' href=\"javascript:search('" + objArr.name + "')\">" + objArr.name + "</a></li>";
						//str = objArr.name
						$("#searchResult").html(str);
						if(objArr == "" || objArr == null) $("#searchResult").hide(); 
						$("#searchResult").show();
					});
					if(keyword == "" || keyword == null) $("#searchResult").hide();
					if(ck_keyword.test(keyword)) $("#searchResult").hide();
					//$("#searchResult").autocomplete({source:[str]});
				}
			});
			console.log(e.keyCode);
			if(e.keyCode == 13){
				searchForm.submit();
			}
		}, 1300);
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
				<ul class="naviul">
					<li class="navili">
						
					</li>
					<li class="navili"><div class="logo"><a href="${path}/home"><img src="">MyDate</a></div></li>
					<%-- <li class="navili" id="planner"><a id="planner" href="${path}/planner">내가 짜줌</a></li>
					<li class="navili" id="psList"><a id="psList" href="${path}/psList?method=listAll">다녀왔어요</a></li>
					<li class="navili hurry" id="hurry"><a id="hurry" href="#">급한 마음<img id="emergency" style="width:15px;height:15px;" src="<c:url value="/icons/emergency.png" />"></a></li> --%>
					<li class="navili">
						<div id="search">
							<form action="#" name="searchForm">
								<img class="icon-search" src="<c:url value="/icons/search.png" />">
								<input type="text" class="searchMain" id="keyword" name="keyword" placeholder="예:서울,여의도, 강남" autocomplete="off" autofocus>
								<input type="submit" class="searchBtn" value="GO!">
							</form>
						</div>
					</li>
					<li class="navili" style="float:right;">
						<div style="float:right;margin:5px;font-size:10pt;">
								<%	if(mem_id==null){ %>
							<div class="member"><a href="${path}/member/memberlogview">로그인&nbsp;</a></div>
							<div class="member"><a href="${path}/member/memberinsview">&nbsp;회원가입</a></div>
							<% }else{ %>
								<div class="member"><%=mem_id %>님 환영합니다.</div>
								<div class="member"><a href="${path}/member/memberlogout">로그아웃&nbsp;</a></div>
								<div class="member"><a href="${path}/member/membermypage">마이페이지&nbsp;</a></div>
								
							<%} %>
						</div>						
					</li>
					<li class="navili">
						<ul style="list-style:none;">
							<li>
								<div class="ui-widget" style="margin:auto;">
									<div style="color:lightgray;font-weight:600;font-size:1.5em;" onclick="$('#searchResult').hide();">X</div>
									<ul id="searchResult" style="list-style:none; margin:auto;padding:0;background-color:white;border:1px solid lightgray;height:300px;overflow:auto;" class="results"></ul>
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</div>
	</div>
</header>
