<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="cm_top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.cm_title{
	color: green;
	font-size: 24px;
	margin-top: 10px;
	margin-left: 10px;
	}

.cm_list{
width:60%;
margin: auto;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {

    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

tr:hover{background-color:#f5f5f5}

.cm_t{
text-align: right;
}

.board_search{
margin-top:20px;
text-align: center;
}

.cm_click:hover{
	cursor: pointer;
}
</style>
</head>
<script src="//code.jquery.com/jquery-1.12.0.min.js" ></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#cm_wr").click(function(){
		//alert("aa");
		location.href = "cm_wrview?part_no="+${part_no};
	});	
});

function detail(cm_no){
	location.href="cm_detail?sm2=" + cm_no;
}
</script>
<body>
<div class = "cm_list">
<c:choose>
	<c:when test="${part_no == 0}">
		<div class="cm_title">전체</div>
	</c:when>
	<c:when test="${part_no == 1}">
		<div class="cm_title">연애</div>
	</c:when>
	<c:when test="${part_no == 2}">
		<div class="cm_title">솔까말</div>
	</c:when>
	<c:when test="${part_no == 3}">
		<div class="cm_title">야한19</div>
	</c:when>
	<c:when test="${part_no == 4}">
		<div class="cm_title">석민이방</div>
	</c:when>
	<c:when test="${part_no == 5}">
		<div class="cm_title">광민이방</div>
	</c:when>
	<c:when test="${part_no == 6}">
		<div class="cm_title">원중이방</div>
	</c:when>
	<c:when test="${part_no == 7}">
		<div class="cm_title">서연이방</div>
	</c:when>
	<c:when test="${part_no == 8}">
		<div class="cm_title">수민이방</div>
	</c:when>
	<c:when test="${part_no == 9}">
		<div class="cm_title">지상이방</div>
	</c:when>
	
</c:choose>

<table>
<tr>
	<td colspan="6">
<ul style="background-color: white">
	<li>총 : ${cmlist.size() }</li>
	<ul style="float:right;list-style-type:none;background-color: white;">
	<li>최신순 |</li>
	<li>댓글순 |</li>
	<li>조회순 |</li>
	<li>좋아요순</li>
	 	<c:choose>
 			<c:when test="${part_no ==0 }">
 		</c:when>
 		<c:otherwise>
 			<li><input type="button" id="cm_wr" name="cm_wr" value="글쓰기"></li>
 		</c:otherwise>
 		</c:choose>
	</ul>
</ul>
 </td>
	</tr>
	<tr>
		<td>No</td>
		<td>제목</td>
		<td>글쓴이</td>
		<td>조회</td>
		<td>추천</td>
		<td>등록일</td>
	</tr>
	<c:choose>
		<c:when test="${cmlist.size() ==0 }">
			<tr><td colspan="7">작성된 게시글이 없습니다</td></tr>
		</c:when>
		<c:otherwise>
		<c:forEach var="md" items="${cmlist }">
	<tr class = "cm_click" onclick="detail(${md.cm_no })">
		<td>${md.cm_no }</td>
		<td>${md.cm_title }</td>
		<td>${md.cm_id }</td>
		<td>${md.cm_rcnt }</td>
		<td>${md.cm_like }</td>
		<td>${md.cm_wdate }</td>
	</tr>
		</c:forEach>
		</c:otherwise>
 	</c:choose>
 </table>
 </div>
 <div class="board_search">
	<form name="listContentFooterForm" onsubmit="return false;" method="get" action="#">

			<!-- 검색어 대상 -->
			
			<div class="inline_box">
			<select name="searchClass" id="country_id" tabindex="1">
				<option value="1" >제목+내용</option>
				<option value="2" >제목</option>
				<option value="3" >내용</option>
							</select>
			
				<input name="searchText" type="text" title="검색어 입력" value="">
				<button class="ir" onclick="boardSubmitSearch_();"><span>검색</span></button>
			</div>    
	</form>
</div>
</body>
</html>