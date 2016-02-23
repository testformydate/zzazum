<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="cm_top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</script>
<body>
<div>
<c:choose>
	<c:when test="${part_no == 0}">
		전체
	</c:when>
	<c:when test="${part_no == 1}">
		연애
	</c:when>
	<c:when test="${part_no == 2}">
		솔까말
	</c:when>
	<c:when test="${part_no == 3}">
		야한19
	</c:when>
	<c:when test="${part_no == 4}">
		석민이방
	</c:when>
	<c:when test="${part_no == 5}">
		광민이방
	</c:when>
</c:choose>


<table border="1">
	<tr>
		<th>No</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>내용</th>
		<th>조회</th>
		<th>추천</th>
		<th>등록일</th>
	</tr>
	<c:choose>
		<c:when test="${cmlist.size() ==0 }">
			<tr><td colspan="7">작성된 게시글이 없습니다</td></tr>
		</c:when>
		<c:otherwise>
		<c:forEach var="md" items="${cmlist }">
	<tr>
		<td><a href="cm_upview?sm=${md.cm_no }">${md.cm_no }</a> </td>
		<td><a href="cm_detail?sm2=${md.cm_no }">${md.cm_title }</a></td>
		<td>${md.cm_id }</td>
		<td>${md.cm_content }
		<td>${md.cm_rcnt }</td>
		<td>${md.cm_like }</td>
		<td>${md.cm_wdate }</td>
	</tr>
		</c:forEach>
		</c:otherwise>
 	</c:choose>
 </table>
 </div>
 
 <input type="button" id="cm_wr" name="cm_wr" value="글쓰기">
</body>
</html>