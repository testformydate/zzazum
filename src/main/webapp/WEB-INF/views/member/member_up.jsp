<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String mem_id = (String)session.getAttribute("mem_id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="Registro">
<form action="memberup" method="post">
아이디 : <input type="text" name="mem_id" readonly="readonly" value="<%=mem_id %>" /><br/>
닉네임 : <input type="text" name="mem_nick"  /><br/>
패스워드 : <input type="password" name="mem_pw"  /><br/>
패스워드확인 : <input type="password" name="mem_pwok"  /><br/>
연락처 : <input type="text" name="mem_tel"  /><br/>
생년월일 : <input type="text" name="mem_bhday"  /><br/>
<input type="submit" value="전송">
</form>
</div>
</body>
</html>