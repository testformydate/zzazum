<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
회원가입 페이지<br/>
<form enctype="multipart/form-data" action="memberins">
<input type="text" name="id" placeholder="아이디(이메일)를 입력해주세요"><br/>
<input type="text" name="nick" placeholder="닉네임을 입력하세요(2자~8자)"><br/>
<input type="password" name="password" placeholder="비밀번호를 입력하세요(8~20자)"><br/>
<input type="password" name="passwordOk" placeholder="비밀번호를 한번 더 입력하세요"><br/>
<input type="text" name="tel" placeholder="휴대폰번호를 - 없이 입력하세요"><br/>
<input type="text" name="bhday" placeholder="생년월일을 - 없이 입력하세요"><br/>
<input type="file" name="primg"><br/>
<input type="submit" value="전송">
</form>


</body>
</html>