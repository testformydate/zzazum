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
	border-bottom:1px solid #69D2E7;
}
.suggestionList:hover{
	color:#69D2E7;
}
div.stepContent > a:hover{
	font-weight:600;
	color:#69D2E7;
}
#map{
	height: 100%;
}
</style>
<script type="text/javascript">
function search(str){
	alert(str);
}

var ck_keyword = /^[A-Za-z0-9]*$/;

$(document).ready(function(){
	$(".like").mouseover(function(){
		$(this).attr("src", "<c:url value='/icons/like.png' />");
	});
	$(".like").mouseout(function(){
		$(this).attr("src", "<c:url value='/icons/unlike.png' />");
	});
	$(".comment").mouseover(function(){
		$(this).attr("src", "<c:url value='/icons/commentactif.png' />");
	});
	$(".comment").mouseout(function(){
		$(this).attr("src", "<c:url value='/icons/comment.png' />");
	});
	$("#searchResult").hide();
	$("#keyword").blur(function(){
		$("#searchResult").hide();
	});
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
	})	
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
					<div class="stepContent"><a href="#">카&nbsp;&nbsp;&nbsp;페</a></div>
					<div class="stepContent"><a href="#">전시&nbsp;/&nbsp;공연</a></div>
					<div class="stepContent"><a href="#">액&nbsp;티&nbsp;비&nbsp;티</a></div>
					<div class="stepContent"><a href="#">영&nbsp;&nbsp;&nbsp;화</a></div>
				</div>
			</div>
			<div class="step" id="step2">
				<div class="stepTitle">지역</div>
				<div class="stepContents">
					<div class="stepContent"><a href="#">강남/압구정/가로수</a></div>
					<div class="stepContent"><a href="#">홍대/합정/상수</a></div>
					<div class="stepContent"><a href="#">시청/종로/광화문</a></div>
					<div class="stepContent"><a href="#">강동/송파/천호</a></div>
					<div class="stepContent"><a href="#">양천/구로/영등포</a></div>
				</div>
			</div>
			<div class="step" id="step3">
				<div class="stepTitle">장소</div>
				<div class="stepContents">
					<c:forEach var="l" items="${list}" >
						<div class="stepContent"><div class="box-font" id="${l.p_id}" onclick="javascript:variable('${l.p_id}','${l.p_name}',${l.p_lat},${l.p_lng},1)">${l.p_name}</div></div>
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
						$(tagId).toggleClass("box-font-active");
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
			<div class="detailWrapperTitle">우리가 추천함</div>
			<div class="details">
				<div class="detail">
					<div class="detailImgWrapper"><img class="detailImg" src="<c:url value="/icons/1.jpg" />"></div>
					<div class="detailContents">
						<div class="detailTitle">오빠랑 다녀온 쩌는 맛집</div>
						<div class="detailContent">
							<div class="description" style="margin-left:15px;">므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣</div>
							<div style="display:inline-block;margin-top:17px;" class="likesAndComment">
								<div class="likes" style="font-size:0.8em;margin-bottom:6px;"><span style="color:#69D2E7;">121</span>명이 좋아합니다.&nbsp;댓글&nbsp;<span style="color:#69D2E7;">21</span>개 </div>
								<div style="display:inline-block;margin-right:10px;"><a href="#"><img class="like" style="width:30px;" src="<c:url value="/icons/unlike.png" />"></a></div>
								<div style="display:inline-block;"><a href=""><img class="comment" style="width:30px;" src="<c:url value="/icons/comment.png" />"></a></div>
							</div>
						</div>
					</div>
				</div>
				<div class="detail">
					<div class="detailImgWrapper"><img class="detailImg" src="<c:url value="/icons/1.jpg" />"></div>
					<div class="detailContents">
						<div class="detailTitle">오빠랑 다녀온 쩌는 맛집</div>
						<div class="detailContent">
							<div class="description" style="margin-left:15px;">므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣</div>
							<div style="display:inline-block;margin-top:17px;" class="likesAndComment">
								<div class="likes" style="font-size:0.8em;margin-bottom:6px;"><span style="color:#69D2E7;">121</span>명이 좋아합니다.</div>
								<div style="display:inline-block;margin-right:10px;"><a href="#"><img class="like" style="width:30px;" src="<c:url value="/icons/unlike.png" />"></a></div>
								<div style="display:inline-block;"><a href=""><img class="comment" style="width:30px;" src="<c:url value="/icons/comment.png" />"></a></div>
							</div>
						</div>
					</div>
				</div>
				<div class="detail">
					<div class="detailImgWrapper"><img class="detailImg" src="<c:url value="/icons/1.jpg" />"></div>
					<div class="detailContents">
						<div class="detailTitle">오빠랑 다녀온 쩌는 맛집</div>
						<div class="detailContent">
							<div class="description" style="margin-left:15px;">므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣므흣</div>
							<div style="display:inline-block;margin-top:17px;" class="likesAndComment">
								<div class="likes" style="font-size:0.8em;margin-bottom:6px;"><span style="color:#69D2E7;">121</span>명이 좋아합니다.</div>
								<div style="display:inline-block;margin-right:10px;"><a href="#"><img class="like" style="width:30px;" src="<c:url value="/icons/unlike.png" />"></a></div>
								<div style="display:inline-block;"><a href=""><img class="comment" style="width:30px;" src="<c:url value="/icons/comment.png" />"></a></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="detailWrapperTitle">네이버 블로그</div>
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
			</div>
		</div>
	</div>
<%@include file="md_bottom.jsp" %>
</body>
</html>
