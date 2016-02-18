<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.member_login_body{position: absolute; top:15%; left:35%;}
</style>
<title>Insert title here</title>
</head>
<body>
<%@include file="../md_top.jsp" %>
<div class="member_login_body body">
	<form action="memberlog" method="post">
	<div>
	아이디 : <input type="text" name="mem_id">
	</div>
	<div>
	패스워드 : <input type="password" name="mem_pw">
	</div>
	<div >
	<input type="submit" value="로그인">
	</div>
	</form>
</div>
</body>
</html>