<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../md_top.jsp" %>
<style type="text/css">
.member_login_body{position: absolute; top:15%; left:35%;}
html {height:100%;}
body {
	margin:0;
	padding:0;
   background-image: url('../resources/ps_images/member/main.png');
   background-repeat: no-repeat;
   background-size: 1600px 785px;
}

.member_insert_body{
	width:100%;
	margin-top:230px;
}

.insert_form{
	margin:auto;
	width:25%;
	padding:30px;
	border-radius:6px;
	background-color:white;
	box-shadow:0 0 10px 1px gray;
}

.submitBtn{
	padding:0;
	margin:0;
	border:0;
	border-radius:4px;
	margin-top:20px;
	font-size:1.2em;
	font-weight:600;
	font-family:'Nanum Gothic';
	color:white;
	width:100%;
	height:50px;
	background-color:#00cdcd;
	cursor:pointer;
}

.insert_input{
	padding:0;
	margin:0;
	border:1px solid lightgray;
	width:100%;
	border-radius:4px;
	height:40px;
	font-size:1.5em;
	font-weight:400;
	font-family:'Nanum Gothic';
	margin-bottom:6px;
	box-border:0;
}
.member_insert_title{
	text-align:center;
	margin-bottom:13px;
	font-size:2em;
}
.formLogo{
	border-radius:8px;
	width:60px;
}
</style>
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/hashencode.js"></script>
<script type="text/javascript">
function calc(){
   //alert("dddd");
   var strTxt = document.insForm.mem_pw.value;
   if( strTxt.length == 0 )
   {
      return;
   }
      if( strTxt.search("\r")>0 ) strTxt=replaceAll( "\r", "", strTxt );
      var strHash = hex_sha256( strTxt );
      strHash = strHash.toUpperCase();
   	
      /* document.getElementById('txt2').value = strHash; */
      document.insForm.mem_pw.value = strHash;
      document.insForm.submit();
      //alert(strHash);
}
</script>
</head>
<body>
<div class="body">
<div class="member_insert_body">
	<div class="insert_form">
		<div class="member_insert_title"><img class="formLogo" src="../icons/mydatelogo.png"></div>
	   <div class="member_insert_content">
			<form name="insForm" action="memberlog" method="post">
				<input class="insert_input" type="text" name="mem_id" placeholder="이메일">
				<input class="insert_input" type="password" name="mem_pw" placeholder="비밀번호">
			</form>
			<button id="check" class="submitBtn" onclick="calc()">로그인</button>
	   </div>
	</div>
</div>
</div>
<%@include file="../md_bottom.jsp" %>
</body>
</html>