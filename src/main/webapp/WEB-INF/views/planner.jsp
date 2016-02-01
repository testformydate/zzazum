<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/planner_search.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/planner_selection.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/planner_detail.css" />">
<title>Insert title here</title>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBfAaETQowRXNSOloGWhPhclip16_Bwdfg"></script>
<script type="text/javascript">
function initialize() {
	  var mapProp = {
	    center:new google.maps.LatLng(37.1710882649, 126.6226033034),
	    zoom:16,
	    mapTypeId:google.maps.MapTypeId.ROADMAP
	  };
	  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
<%@include file="md_top.jsp" %>
<!-- <h1>Planner가 나올거임</h1> -->
	<div class="body">
		<!-- search -->
		<div id="search">
			<form action="#" name="searchForm">
				<img class="icon-search" src="<c:url value="/icons/search.png" />">
				<input type="text" class="searchMain" name="keyword" placeholder="데이트 장소 검색하기" autocomplete="off" autofocus>
				<input type="submit" class="searchBtn" value="GO!">
			</form>
		</div>
	
		<!-- selection -->
		<div id="selectionTable">
			<div class="step" id="step1">
				<div class="stepTitle">카테고리</div>
				<div class="stepContents">
					<div class="stepContent">카&nbsp;&nbsp;&nbsp;페</div>
					<div class="stepContent">전시&nbsp;/&nbsp;공연</div>
					<div class="stepContent">액&nbsp;티&nbsp;비&nbsp;티</div>
					<div class="stepContent">영&nbsp;&nbsp;&nbsp;화</div>
				</div>
			</div>
			<div class="step" id="step2">
				<div class="stepTitle">지역</div>
				<div class="stepContents">
					<div class="stepContent">강남/압구정/가로수</div>
					<div class="stepContent">홍대/합정/상수</div>
					<div class="stepContent">시청/종로/광화문</div>
					<div class="stepContent">강동/송파/천호</div>
					<div class="stepContent">양천/구로/영등포</div>
				</div>
			</div>
			<div class="step" id="step3">
				<div class="stepTitle">장소</div>
				<div class="stepContents">
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
					<div class="stepContent">이런카페</div>
					<div class="stepContent">저런카페</div>
					<div class="stepContent">핫한카페</div>
					<div class="stepContent">쿨한카페</div>
					<div class="stepContent">쩌는카페</div>
				</div>
			</div>
			<div class="step" id="step4">
				<div id="googleMapTitle" class="stepTitle">위치</div>
				<div class="stepContents">
					<div id="googleMap" class="stepContent"></div>
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
