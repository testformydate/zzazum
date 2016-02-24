<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	 String mem =(String)session.getAttribute("mem_id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<c:set var="path" value="${pageContext.request.contextPath}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #00cdcd;
}

li {
    float: left;
    padding: 4px 3px;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #00cdcd;
}

.active {
    background-color: #4CAF50;
}

.cardProfile {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    margin: 0 10px;
}

.logo{
	width:40px;
	float:left;
	margin-right:15px;
	border-radius:20%;
}

</style>
</head>
<body>
<ul>
	<li><a href="${path}/home"><img class="logo" src="<c:url value="/icons/mydatelogo.png" />"></a></li>


  <li><a href="cm_list?part_no=0">전체</a></li>
  <li><a href="cm_list?part_no=1">연애</a></li>
  <li><a href="cm_list?part_no=2">솔까말</a></li>
  <li><a href="cm_list?part_no=3">야한19	</a></li>
  <li><a href="cm_list?part_no=4">짜줌에게 한마디</a></li>
  
  <ul style="float:right;list-style-type:none;">
  
  <%if(mem==null){ %>
	<li><a href="${path}/member/memberlogview">로그인</a></li>
	<li><a href="${path}/member/memberinsview">회원가입</a></li>
	<% }else{ %>
	<li><a><img class="cardProfile" src="../resources/ps_images/profile/<%=session.getAttribute("mem_primg") %>"></a></li>
	<li><a><%=session.getAttribute("mem_nick") %></a></li>
	<li><a href="${path}/member/memberlogout">로그아웃</a></li>
	<li><a href="${path}/member/membermypage">마이페이지</a></li>
	<c:set var="mem_id" value="<%=mem %>" />
	<%} %>
  </ul>
</ul>


</body>
</html>