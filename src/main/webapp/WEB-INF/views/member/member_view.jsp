<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@charset "utf-8";
@import url(http://fonts.googleapis.com/css?family=Titan+One);
@import url(http://weloveiconfonts.com/api/?family=fontawesome);
@import url(http://meyerweb.com/eric/tools/css/reset/reset.css);

body {
	background: #1b1e24;
  background-image:-webkit-linear-gradient(right,#1b1e24,#1b1e24 50%,#1b1e24);
	background-image:-moz-linear-gradient(right,#1b1e24,#1b1e24 50%,#1b1e24);
  background-image:-o-linear-gradient(right,#1b1e24,#1b1e24 50%,#1b1e24);
	background-image:-ms-linear-gradient(right,#1b1e24,#1b1e24 50%,#1b1e24);
	background-image:linear-gradient(to left,#1b1e24,#1b1e24 50%,#1b1e24);
  text-align: center;
	font-family: Arial, sans-serif;
	font-size: 13px;
	line-height: 1.5em;
}

[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}

input {
	font-size: 1em;
	line-height: 1.5em;
	margin: 0;
	padding: 0;
	-webkit-appearance: none;
}

.Registro {
	margin: 50px auto;
	width: 242px;
}

.Registro span {
	color: hsl(5, 50%, 57%);
	display: block;
	height: 48px;
	line-height: 48px;
	position: absolute;
	text-align: center;
	width: 36px;
}

.Registro input {
	border: none;
	height: 48px;
	outline: none;
}

.Registro input[type="text"] {
	background-color: #fff;
	border-top: 2px solid #2c90c6;
	border-right: 1px solid #000;
	border-left: 1px solid #000;
	border-radius: 5px 5px 0 0;
	-moz-border-radius: 5px 5px 0 0;
	-webkit-border-radius: 5px 5px 0 0;
  -o-border-radius: 5px 5px 0 0;
  -ms-border-radius: 5px 5px 0 0;
	color: #363636;
	padding-left: 36px;
	width: 218px;
}

.Registro input[type="password"] {
	background-color: #fff;
	border-top: 2px solid #2c90c6;
	border-right: 1px solid #000;
	border-bottom: 2px solid #2c90c6;
	border-left: 1px solid #000;
	border-radius: 0 0 5px 5px;
	-moz-border-radius: 0 0 5px 5px;
	-webkit-border-radius: 0 0 5px 5px;
  -o-border-radius: 0 0 5px 5px;
  -ms-border-radius: 0 0 5px 5px;
	color: #363636;
	margin-bottom: 20px;
	padding-left: 36px;
	width: 218px;
}

.Registro input[type="submit"] {
	background-color: #2c90c6;
	border: 1px solid #2c90c6;
	border-radius: 15px;
	-moz-border-radius: 15px;
	-webkit-border-radius: 15px;
  -ms-border-radius: 15px;
  -o-border-radius: 15px;
	color: #fff;
	font-weight: bold;
	line-height: 48px;
	text-align: center;
	text-transform: uppercase;
	width: 240px;
	margin-top: 17px;
}

.Registro input[type="submit"]:hover {
	background-color: #2c70c6;
  box-shadow: 2px 2px 20px  #2c90c6, #fff 0 -1px 2px;
}

.mempage {
  color: pink; 
  font-size: 30px; 
  margin: 2% auto;
  text-align: center;
  font-family: 'Titan One';   
  text-shadow: 1px 2px 1px  rgba(0,0,0,.5);
  padding-top: 40px;
}

p:hover {
  text-shadow: 2px 2px 20px  #2c90c6, #fff 0 -1px 2px;
}
</style>

</head>
<body>
	<p class='mempage'>회원가입</p>
<div class="Registro">

<form action="memberins" autocomplete="off">

<input type="text" name="id" placeholder="아이디(이메일)를 입력해주세요" />
<input type="text" name="nick" placeholder="닉네임을 입력하세요(2자~8자)" />
<input type="password" name="password" placeholder="비밀번호를 입력하세요(8~20자)" />
<input type="password" name="passwordOk" placeholder="비밀번호를 한번 더 입력하세요" />
<input type="text" name="tel" placeholder="휴대폰번호를  입력하세요" />
<input type="text" name="bhday" placeholder="생년월일을 - 없이 입력하세요" />
<input type="submit" value="전송">
</form>
</div>

</body>
</html>










