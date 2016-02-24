<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/planner_search.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/planner_selection.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/planner_detail.css" />">
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<!-- <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->
<%@include file="md_top.jsp" %>
 <!-- You can use Open Graph tags to customize link previews.
    Learn more: https://developers.facebook.com/docs/sharing/webmasters -->
	<meta property="og:url"           content="http://www.your-domain.com/your-page.html" />
	<meta property="og:type"          content="website" />
	<meta property="og:title"         content="Your Website Title" />
	<meta property="og:description"   content="Your description" />
	<meta property="og:image"         content="http://www.your-domain.com/path/image.jpg" />
<style>
li.navili#planner{
	font-weight:600;
	border-bottom:1px solid #00cdcd;
}
.suggestionList:hover{
	color:#00cdcd;
}
div.stepContent > a:hover{
	font-weight:600;
	color:#00cdcd;
}
#map{
	height: 100%;
}
</style>
<script type="text/javascript">
function like(no){
	//alert(no);
	var like = $("#like" + no).attr("class");
	var mem_id = "${mem_id}";
	var likeCount = parseInt($("#likeCount" + no).html());
	//alert(no + " " + like + " " + likeCount);
	/* var likeNode = $(this).prev();
	var likeVal = parseInt(likeNode.html());
	*/
	if(mem_id == "" || mem_id == 'null' ){
		alert("로그인해주세요!");
		location.href = "member/memberlogview";
		return;
	}
	
	$.ajax({
   		type: "post",
   		url: "likeUpdate",
   		data: {"likeOrNot": like ,"ps_no" : no, "mem_id" : mem_id, "ps_email" : mem_id},
   		success: function(jdata){
       		if(jdata.trim() === "like"){
	   			//alert("#like" + no);
       			$("#like" + no).attr("class","like");
       			$("#like" + no).attr("src","resources/icons/like.png");
       			$("#likeCount" + no).html(likeCount + 1);
       		}else if(jdata.trim() === "unlike"){
       			$("#like" + no).attr("class","unlike");
       			$("#like" + no).attr("src","resources/icons/unlike.png");
       			$("#likeCount" + no).html(likeCount - 1);
       		}
       			
       	}
   	});
}
function clip(no){
	
	var clip = $("#clip" + no).attr("class");
	var mem_id = "${mem_id}";
	//var likeCount = parseInt($("#clipCount" + no).html());
	//alert(no + " " + like + " " + likeCount);
	/* var likeNode = $(this).prev();
	var likeVal = parseInt(likeNode.html());
	*/
	if(mem_id == "" || mem_id == 'null' ){
		alert("로그인해주세요!");
		location.href = "member/memberlogview";
		return;
	}
	//alert(clip + " " + mem_id);
	$.ajax({
   		type: "post",
   		url: "clipUpdate",
   		data: {"clipOrNot": clip ,"ps_no" : no, "mem_id" : mem_id, "ps_email" : mem_id},
   		success: function(jdata){
       		if(jdata.trim() === "clip"){
	   			//alert("#like" + no);
       			$("#clip" + no).attr("class","clip");
       			$("#clip" + no).attr("src","resources/icons/clip.png");
       			//$("#clipCount" + no).html(likeCount + 1);
       		}else if(jdata.trim() === "unclip"){
       			$("#clip" + no).attr("class","unclip");
       			$("#clip" + no).attr("src","resources/icons/unclip.png");
       			//$("#clipCount" + no).html(likeCount - 1);
       		}
       	}
   	});
}
function cateShow(cate){
	/* var category = "div:not(." + cate + ")";
	//alert(category);
	$(category).hide(); */
	//console.log(cate);
	$.ajax({
		url:"selectionBox",
		data: "keyword=" + cate,
		success: function(data){
			//console.log("aa");
			var str = "";
			var markers=[];
			$(data).each(function(index, objArr){
				//arr = objArr.datas[index];
				//console.log(index);
				//console.log(objArr.name);
				//console.log(objArr.datas[0].id);
				str += "<div id='stepContent-" + objArr.p_id + "' class='stepContent'><div class='box-font " + objArr.p_category + "' id='" + objArr.p_id + "' onclick=\"javascript:variable('" + objArr.p_id + "','" + objArr.p_name + "'," + objArr.p_lat + "," + objArr.p_lng + ",1)\">" + objArr.p_name + "</div></div>";
				//str = objArr.name
				$("#markerList").html(str);
				if(objArr == "" || objArr == null){
					$("#markerList").html("<div class='stepContent'><div class='box-font')\">검색 결과가 없습니다.</div></div>"); 
				}
				$("#markerList").show();
				markers.push([objArr.p_name, objArr.p_lat, objArr.p_lng, 5]);
			});
			//console.log(markers);
			var map = new google.maps.Map(document.getElementById('map'), {
			    zoom: 10,
			    center: {lat: 37.537254, lng: 126.993659}
			});
			var image = {
				    url: 'icons/marker.png',
				    // This marker is 20 pixels wide by 32 pixels high.
				    size: new google.maps.Size(45, 60),
				    // The origin for this image is (0, 0).
				    origin: new google.maps.Point(0, 0),
				    // The anchor for this image is the base of the flagpole at (0, 32).
				    anchor: new google.maps.Point(0, 32)
		    };
		    var shape = {
			    coords: [1, 1, 1, 20, 18, 20, 18, 1],
			    type: 'poly'
		  	};
		  	for (var i = 0; i < markers.length; i++) {
			    var marker = markers[i];
			    var marker = new google.maps.Marker({
			      position: {lat: marker[1], lng: marker[2]},
			      map: map,
			      icon: image,
			      shape: shape,
			      title: marker[0],
			      zIndex: marker[3]
			   	  });
			 };
			//alert(id);
			var tagId = "#" + cate;
			//console.log($(tagId));
			$(".box-font-active").attr("class","box-font");
			$(".stepContent-active").attr("class","stepContent");
			$(tagId).toggleClass("box-font-active");
			$("#stepContent-" + cate).toggleClass("stepContent-active");
			if(keyword == "" || keyword == null) $("#markerList").hide();
			if(ck_keyword.test(keyword)) $("#markerList").hide();
			//$("#searchResult").autocomplete({source:[str]});
		}
	});
}

function addrShow(addr){
	/* alert(addr); */
	$.ajax({
		url:"autocomplete",
		data: "keyword=" + addr,
		success: function(data){
			console.log(data);
			var str = "";
			var markers=[];
			$(data).each(function(index, objArr){
				//arr = objArr.datas[index];
				//console.log(index);
				//console.log(objArr.name);
				//console.log(objArr.datas[0].id);
				str += "<div id='stepContent-" + objArr.id + "' class='stepContent'><div class='box-font " + objArr.cate + "' id='" + objArr.id + "' onclick=\"javascript:variable('" + objArr.id + "','" + objArr.name + "'," + objArr.lat + "," + objArr.lng + ",1)\">" + objArr.name + "</div></div>";
				//str = objArr.name
				$("#markerList").html(str);
				//alert(objArr);
				if(objArr == "" || objArr == null) $("#markerList").html("<div class='stepContent'><div class='box-font')\">검색 결과가 없습니다.</div></div>"); 
				$("#markerList").show();
				markers.push([objArr.name, objArr.lat, objArr.lng, 5]);
			});
			//console.log(markers);
			var map = new google.maps.Map(document.getElementById('map'), {
			    zoom: 10,
			    center: {lat: 37.537254, lng: 126.993659}
			});
			var image = {
				    url: 'icons/marker.png',
				    // This marker is 20 pixels wide by 32 pixels high.
				    size: new google.maps.Size(45, 60),
				    // The origin for this image is (0, 0).
				    origin: new google.maps.Point(0, 0),
				    // The anchor for this image is the base of the flagpole at (0, 32).
				    anchor: new google.maps.Point(0, 32)
		    };
		    var shape = {
			    coords: [1, 1, 1, 20, 18, 20, 18, 1],
			    type: 'poly'
		  	};
		  	for (var i = 0; i < markers.length; i++) {
			    var marker = markers[i];
			    var marker = new google.maps.Marker({
			      position: {lat: marker[1], lng: marker[2]},
			      map: map,
			      icon: image,
			      shape: shape,
			      title: marker[0],
			      zIndex: marker[3]
			   	  });
			 };
			//alert(id);
			if(addr === "강남") var id = "gangnam";
			else if(addr === "마포") var id = "hongdae";
			else if(addr === "중구") var id = "sichung";
			else if(addr === "강동") var id = "gangdong";
			else if(addr === "양천") var id = "yangcheon";
		
			var tagId = "#" + id;
			//console.log($(tagId));
			$(".box-font-active").attr("class","box-font");
			$(".stepContent-active").attr("class","stepContent");
			$(tagId).toggleClass("box-font-active");
			$("#stepContent-" + id).toggleClass("stepContent-active");
			if(keyword == "" || keyword == null) $("#markerList").hide();
			if(ck_keyword.test(keyword)) $("#markerList").hide();
			//$("#searchResult").autocomplete({source:[str]});
		}
	});
}


$(document).ready(function(){
	var id = "${mem_id}";
	/* $(".unlike").mouseover(function(){
		$(this).attr("src", "resources/icons/like.png");
	});
	$(".unlike").mouseout(function(){
		$(this).attr("src", "resources/icons/unlike.png");
	}); */
	$(".comment").mouseover(function(){
		$(this).attr("src", "resources/icons/commentactif.png");
	});
	$(".comment").mouseout(function(){
		$(this).attr("src", "resources/icons/comment.png");
	});
	$(".detailTitle").click(function(){
		var no = $(this).attr("id");
		//alert(no);
		$("#detailForm" + no).submit();
	});
	
	$.ajax({
   		type: "post",
   		url: "likedList",
   		data: {"mem_id" : id},
   		success: function(like){
   			$(like).each(function(index, no){
	    		$("#like" + no).attr("class","like");
	     		$("#like" + no).attr("src","resources/icons/like.png");   				
   			});
   			//alert(like);
   			//alert("#like" + no);
       	}
   	});
	$.ajax({
   		type: "post",
   		url: "clipedList",
   		data: {"mem_id" : id},
   		success: function(like){
   			$(like).each(function(index, no){
	    		$("#clip" + no).attr("class","clip");
	     		$("#clip" + no).attr("src","resources/icons/clip.png");   				
   			});
   			//alert(like);
   			//alert("#like" + no);
       	}
   	});
})
</script>
</head>
<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.5";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<!-- <h1>Planner가 나올거임</h1> -->
	<div class="body">
		<!-- search -->
		<%-- <div id="search">
			<form action="#" name="searchForm">
				<img class="icon-search" src="<c:url value="/icons/search.png" />">
				<input type="text" class="searchMain" id="keyword" name="keyword" placeholder="예:서울,경기,여의도" autocomplete="off" autofocus>
				<input type="submit" class="searchBtn" value="GO!">
			</form>
		</div>
		<div class="ui-widget" style="margin:auto;">
			<ul id="searchResult" style="list-style:none; margin:auto;padding:0;background-color:white;border:1px solid lightgray;" class="results"></ul>
		</div> --%>
		
		<!-- selection -->
		<div id="selectionTable" style="margin-top:20px;">
			<div class="step" id="step1">
				<div class="stepTitle">카테고리</div>
				<div class="stepContents">
					<c:forEach var="ca" items="${categoryList}">
						<div id="stepContent-${ca.ca_val}" class="stepContent"><div class="box-font" id="${ca.ca_val}" onclick="javascript:cateShow('${ca.ca_val}')">${ca.ca_name}</div></div>
					</c:forEach>
				</div>
			</div>
			<div class="step" id="step2">
				<div class="stepTitle">지역</div>
				<div class="stepContents">
					<c:forEach var="lo" items="${locationList}">
						<div id="stepContent-${lo.lc_valeng}" class="stepContent"><div class="box-font" id="${lo.lc_valeng}" onclick="javascript:addrShow('${lo.lc_val}')">${lo.lc_name}</div></div>
					</c:forEach>
				</div>
			</div>
			<div class="step" id="step3">
				<div class="stepTitle">장소</div>
				<div class="stepContents" id="markerList">
					<c:forEach var="l" items="${list}" >
						<div id="stepContent-${l.p_id}" class="stepContent"><div class="box-font ${l.p_category}" id="${l.p_id}" onclick="javascript:variable('${l.p_id}','${l.p_name}',${l.p_lat},${l.p_lng},1)">${l.p_name}</div></div>
					</c:forEach>
				</div>
			</div>
			<div class="step" id="step4">
				<div id="googleMapTitle" class="stepTitle">위치</div>
				<div class="googleMapWrapper">
					<div id="map"></div>
					<script>
					
					// The following example creates complex markers to indicate beaches near
					// Sydney, NSW, Australia. Note that the anchor is set to (0,32) to correspond
					// to the base of the flagpole.
					
					function initMap() {
					  var map = new google.maps.Map(document.getElementById('map'), {
					    zoom: 9,
					    center: {lat: 37.537254, lng: 126.993659}
					  });
					
					  //setMarkers(map);
					}
					
					function addVar(latin, lngin) {
						  var map = new google.maps.Map(document.getElementById('map'), {
						    zoom: 14,
						    center: {lat: latin, lng: lngin}
						  });
						
						  setMarkers(map);
						}
					
					function variable(id, name, lat, lng, zIndex){
						//alert(name + " " + lat + " " + lng + " " + zIndex);
						markers = [name, lat, lng, 5];
						//alert(markers[0]);
						addVar(lat, lng);
						//alert(id);
						var tagId = "#" + id;
						//console.log($(tagId));
						$(".box-font-active").attr("class","box-font");
						$(".stepContent-active").attr("class","stepContent");
						$(tagId).toggleClass("box-font-active");
						$("#stepContent-" + id).toggleClass("stepContent-active");
					}
					
					// Data for the markers consisting of a name, a LatLng and a zIndex for the
					// order in which these markers should display on top of each other.
					/* var beaches = [
					  ['Bondi Beach', -33.890542, 151.274856, 4],
					  ['Coogee Beach', -33.923036, 151.259052, 5],
					  ['Cronulla Beach', -34.028249, 151.157507, 3],
					  ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
					  ['Maroubra Beach', -33.950198, 151.259302, 1]
					]; */
						

					function setMarkers(map) {
						
						
					  // Adds markers to the map.
					
					  // Marker sizes are expressed as a Size of X,Y where the origin of the image
					  // (0,0) is located in the top left of the image.
					
					  // Origins, anchor positions and coordinates of the marker increase in the X
					  // direction to the right and in the Y direction down.
						  var image = {
						    url: 'icons/marker.png',
						    // This marker is 20 pixels wide by 32 pixels high.
						    size: new google.maps.Size(45, 60),
						    // The origin for this image is (0, 0).
						    origin: new google.maps.Point(0, 0),
						    // The anchor for this image is the base of the flagpole at (0, 32).
						    anchor: new google.maps.Point(0, 32)
						  };
					  // Shapes define the clickable region of the icon. The type defines an HTML
					  // <area> element 'poly' which traces out a polygon as a series of X,Y points.
					  // The final coordinate closes the poly by connecting to the first coordinate.
						  var shape = {
						    coords: [1, 1, 1, 20, 18, 20, 18, 1],
						    type: 'poly'
						  };
					  	  var marker = new google.maps.Marker({
					  			  position: {lat:markers[1], lng: markers[2]},
					  			  map: map,
					  			  icon: image,
					  			  shape: shape,
					  			  title: markers[0],
					  			  zIndex: markers[3]
					  	  });
					  	  
						  /* for (var i = 0; i < beaches.length; i++) {
						    var beach = beaches[i];
						    var marker = new google.maps.Marker({
						      position: {lat: beach[1], lng: beach[2]},
						      map: map,
						      icon: image,
						      shape: shape,
						      title: beach[0],
						      zIndex: beach[3]
						   	  });
						 	}; */
						}
					    </script>
					    <script async defer
					        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBfAaETQowRXNSOloGWhPhclip16_Bwdfg&signed_in=true&callback=initMap"></script>
				</div>
			</div>
		</div>
		
		<!-- placeDetail -->
		<div class="detailWrapper">
			<div class="detailWrapperTitle">우리 다녀왔어요</div>
			<div class="details">
				<c:forEach var="p" items="${psList}" >
					<div class="detail">
						<div class="detailImgWrapper"><img class="detailImg" src="resources/ps_images/postscript/${p.ps_image}"></div>
						<div class="detailContents">
							<div id="${p.ps_no}" class="detailTitle">${p.ps_title}</div>
							<div class="detailContent">
								<div class="description" style="margin-left:15px;cursor:pointer;">
									<span><img class="cardProfile" src="resources/ps_images/profile/${p.mem_primg}"></span><span class="count">${p.mem_nick}</span>
									<div class="descContext">${p.ps_context}</div>
								</div>
								<div style="display:inline-block;margin-top:17px;" class="likesAndComment">
									<div class="likesAndHitsCount" style="font-size:0.8em;margin-bottom:12px;"><span id="likeCount${p.ps_no}" style="color:#00cdcd;">${p.ps_like}</span>명이 좋아합니다.&nbsp;조회 수&nbsp;<span style="color:#00cdcd;">${p.ps_hits}</span></div>
									<div style="display:inline-block;margin-right:10px;cursor:pointer;"><img id="like${p.ps_no}" class="unlike" style="width:30px;" src="resources/icons/unlike.png" onclick="javascript:like(${p.ps_no})"></div>
									<div style="display:inline-block;margin-right:10px;cursor:pointer;"><img id="clip${p.ps_no}" class="unclip" style="width:30px;" src="resources/icons/unclip.png" onclick="javascript:clip(${p.ps_no})"></div>
									<div style="display:inline-block;cursor:pointer;"><img id="commentImg${p.ps_no}" class="comment" style="width:30px;" src="resources/icons/comment.png"></div>
								</div>
								<form id="detailForm${p.ps_no}" name="detailForm${p.ps_no}" action="psListDetail" method="post">
									<input type="hidden" id="detailId" name="ps_email" value="<%=session.getAttribute("mem_id") %>">
									<input type="hidden" id="detailNo" name="ps_no" value="${p.ps_no}">
								</form>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="ps_loading">
				<img class="ps_loading_image" src="resources/ps_icon/loding.gif">
			</div>
			<%-- <div class="detailWrapperTitle">네이버 블로그</div>
			<div class="details">
				<div class="detail">
					<div class="detailImgWrapper"><img class="detailImg" src="<c:url value="/icons/1.jpg" />"></div>
					<div class="detailContents">
						<div class="detailTitle">오빠랑 다녀온 쩌는 맛집</div>
						<div class="detailContent">
							므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣
						</div>
					</div>
				</div>
				<div class="detail">
					<div class="detailImgWrapper"><img class="detailImg" src="<c:url value="/icons/1.jpg" />"></div>
					<div class="detailContents">
						<div class="detailTitle">오빠랑 다녀온 쩌는 맛집</div>
						<div class="detailContent">
							므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣
						</div>
					</div>
				</div>
				<div class="detail">
					<div class="detailImgWrapper"><img class="detailImg" src="<c:url value="/icons/1.jpg" />"></div>
					<div class="detailContents">
						<div class="detailTitle">오빠랑 다녀온 쩌는 맛집</div>
						<div class="detailContent">
							므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣
						</div>
					</div>
				</div>
			</div> --%>
		</div>
	</div>
</body>
</html>
