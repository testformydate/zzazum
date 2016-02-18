<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="cm_up" method ="post">
글번호 : <input type="text" name = "cm_no" readonly="readonly" value="${cm_UpView.cm_no }"><br/>
글쓴이 : <input type="text" name = "cm_id" readonly="readonly" value="${cm_UpView.cm_id }"><br/>
제목 : <input type="text" name = "cm_title" value="${cm_UpView.cm_title }"><br/>
내용 : <input type="text" name = "cm_content" value="${cm_UpView.cm_content }"><br/>
<input type="submit" value="등록">
</form>
</body>
</html>
