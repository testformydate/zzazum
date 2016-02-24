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

.submitBtn:hover{
	background-color:#00CC88;
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
	margin-top:6px;
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

p{
	color:#e91e63;
	padding:0;
	margin:0;
	font-size:0.8em;
}

/*loading*/
.sk-fading-circle {
	display:none;
  margin: 100px 200px;
  width: 40px;
  height: 40px;
  position: absolute;
  z-index:999;
}

.sk-fading-circle .sk-circle {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  top: 0;
}

.sk-fading-circle .sk-circle:before {
  content: '';
  display: block;
  margin: 0 auto;
  width: 15%;
  height: 15%;
  background-color: #333;
  border-radius: 100%;
  -webkit-animation: sk-circleFadeDelay 1.2s infinite ease-in-out both;
          animation: sk-circleFadeDelay 1.2s infinite ease-in-out both;
}
.sk-fading-circle .sk-circle2 {
  -webkit-transform: rotate(30deg);
      -ms-transform: rotate(30deg);
          transform: rotate(30deg);
}
.sk-fading-circle .sk-circle3 {
  -webkit-transform: rotate(60deg);
      -ms-transform: rotate(60deg);
          transform: rotate(60deg);
}
.sk-fading-circle .sk-circle4 {
  -webkit-transform: rotate(90deg);
      -ms-transform: rotate(90deg);
          transform: rotate(90deg);
}
.sk-fading-circle .sk-circle5 {
  -webkit-transform: rotate(120deg);
      -ms-transform: rotate(120deg);
          transform: rotate(120deg);
}
.sk-fading-circle .sk-circle6 {
  -webkit-transform: rotate(150deg);
      -ms-transform: rotate(150deg);
          transform: rotate(150deg);
}
.sk-fading-circle .sk-circle7 {
  -webkit-transform: rotate(180deg);
      -ms-transform: rotate(180deg);
          transform: rotate(180deg);
}
.sk-fading-circle .sk-circle8 {
  -webkit-transform: rotate(210deg);
      -ms-transform: rotate(210deg);
          transform: rotate(210deg);
}
.sk-fading-circle .sk-circle9 {
  -webkit-transform: rotate(240deg);
      -ms-transform: rotate(240deg);
          transform: rotate(240deg);
}
.sk-fading-circle .sk-circle10 {
  -webkit-transform: rotate(270deg);
      -ms-transform: rotate(270deg);
          transform: rotate(270deg);
}
.sk-fading-circle .sk-circle11 {
  -webkit-transform: rotate(300deg);
      -ms-transform: rotate(300deg);
          transform: rotate(300deg); 
}
.sk-fading-circle .sk-circle12 {
  -webkit-transform: rotate(330deg);
      -ms-transform: rotate(330deg);
          transform: rotate(330deg); 
}
.sk-fading-circle .sk-circle2:before {
  -webkit-animation-delay: -1.1s;
          animation-delay: -1.1s; 
}
.sk-fading-circle .sk-circle3:before {
  -webkit-animation-delay: -1s;
          animation-delay: -1s; 
}
.sk-fading-circle .sk-circle4:before {
  -webkit-animation-delay: -0.9s;
          animation-delay: -0.9s; 
}
.sk-fading-circle .sk-circle5:before {
  -webkit-animation-delay: -0.8s;
          animation-delay: -0.8s; 
}
.sk-fading-circle .sk-circle6:before {
  -webkit-animation-delay: -0.7s;
          animation-delay: -0.7s; 
}
.sk-fading-circle .sk-circle7:before {
  -webkit-animation-delay: -0.6s;
          animation-delay: -0.6s; 
}
.sk-fading-circle .sk-circle8:before {
  -webkit-animation-delay: -0.5s;
          animation-delay: -0.5s; 
}
.sk-fading-circle .sk-circle9:before {
  -webkit-animation-delay: -0.4s;
          animation-delay: -0.4s;
}
.sk-fading-circle .sk-circle10:before {
  -webkit-animation-delay: -0.3s;
          animation-delay: -0.3s;
}
.sk-fading-circle .sk-circle11:before {
  -webkit-animation-delay: -0.2s;
          animation-delay: -0.2s;
}
.sk-fading-circle .sk-circle12:before {
  -webkit-animation-delay: -0.1s;
          animation-delay: -0.1s;
}

@-webkit-keyframes sk-circleFadeDelay {
  0%, 39%, 100% { opacity: 0; }
  40% { opacity: 1; }
}

@keyframes sk-circleFadeDelay {
  0%, 39%, 100% { opacity: 0; }
  40% { opacity: 1; } 
}

.loading{
	background-color:black;
	opacity:0.5;
	z-index:5;
}
</style>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/hashencode.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#mem_id").blur(function(){
		var email = document.logForm.mem_id.value;
		if(email == null || email == ""){
			$("#mem_id").css("border","1px solid #e91e63");
			$("#mem_idInfo").html("<p>이메일을 입력해 주세요.</p>");
	  		return;
		}else{
			$("#mem_id").css("border","1px solid lightgray");
			$("#mem_idInfo").html("");
		}
	});
	
	$("#mem_pw").blur(function(){
		var pw = document.logForm.mem_pw.value;
		if(pw == null || pw == ""){
			$("#mem_pw").css("border","1px solid #e91e63");
			$("#mem_pwInfo").html("<p>비밀번호를 입력해주세요.</p>");
		   	return;
		}else{
			$("#mem_pw").css("border","1px solid lightgray");
			$("#mem_pwInfo").html("");
		}
	});
/*    if(!pw_regExp.test(pw)){
		alert("비밀번호를 다시 확인해주세요.");
	   	document.insForm.mem_pw.focus();
	   	return;
   }; */
	$("#mem_id").keyup(function(e){
		if(e.keyCode == 13){
			document.logForm.mem_pw.focus();
		}
	});
	
	$("#mem_pw").keyup(function(e){
		if(e.keyCode == 13){
			var email = document.logForm.mem_id.value;
			var pw = document.logForm.mem_pw.value;
			$("#submitBtn").css("background-color", "#00CC88");
			calc(email, pw);
		}
	});
	
	$("#check").click(function(){
		var email = document.logForm.mem_id.value;
		var pw = document.logForm.mem_pw.value;
		calc(email, pw);
	});
});

function calc(email, pw){
	
	if(email == null || email == ""){
		$("#mem_id").css("border","1px solid #e91e63");
		$("#mem_idInfo").html("<p>이메일을 입력해 주세요.</p>");
		$("#mem_id").focus();
  		return;
	}else{
		$("#mem_id").css("border","1px solid lightgray");
		$("#mem_idInfo").html("");
	}
	
	if(pw == null || pw == ""){
		$("#mem_pw").css("border","1px solid #e91e63");
		$("#mem_pwInfo").html("<p>비밀번호를 입력해주세요.</p>");
		$("#mem_pw").focus();
	   	return;
	}else{
		$("#mem_pw").css("border","1px solid lightgray");
		$("#mem_pwInfo").html("");
	}
   //alert("dddd");
/*    var e_regExp = /^[0-9a-zA-Z][_0-9a-zA-Z\-_.]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
   var pw_regExp = /^([a-zA-Z0-9]){8,16}$/;

   if(!e_regExp.test(email)){
		alert("이메일을 확인해주세요.");
   		document.insForm.mem_id.focus();
   		return;
   }; */
	var strTxt = pw;
	if( strTxt.length == 0 )
	{
	   return;
	}
	if( strTxt.search("\r")>0 ) strTxt=replaceAll( "\r", "", strTxt );
	var strHash = hex_sha256( strTxt );
	strHash = strHash.toUpperCase();
	/* $.ajax({
	   type: "post",
	   url: "memberlog",
	   data: {"mem_id": email, "mem_pw": strHash},
	   success: function(b){
			if(b == true || b == "true"){
		      //document.getElementById('txt2').value = strHash;
		      //alert(strHash);
			}else{
				alert("아이디와 비밀번호가 일치하지 않습니다.");
				return;
			}
		}
	}); */
	document.logForm.mem_pw.value = strHash;
	document.logForm.submit();
}
</script>
</head>
<body>
<div class="sk-fading-circle">
  <div class="sk-circle1 sk-circle"></div>
  <div class="sk-circle2 sk-circle"></div>
  <div class="sk-circle3 sk-circle"></div>
  <div class="sk-circle4 sk-circle"></div>
  <div class="sk-circle5 sk-circle"></div>
  <div class="sk-circle6 sk-circle"></div>
  <div class="sk-circle7 sk-circle"></div>
  <div class="sk-circle8 sk-circle"></div>
  <div class="sk-circle9 sk-circle"></div>
  <div class="sk-circle10 sk-circle"></div>
  <div class="sk-circle11 sk-circle"></div>
  <div class="sk-circle12 sk-circle"></div>
</div>
<div class="member_insert_body body">
<div class="member_insert_body">
	<div class="insert_form">
		<div class="member_insert_title"><img class="formLogo" src="../icons/mydatelogo.png"></div>
	   <div class="member_insert_content">
			<form name="logForm" action="memberlog" method="post">
				<input class="insert_input" type="text" id="mem_id" name="mem_id" placeholder="이메일" autofocus>
				<div id="mem_idInfo"></div>
				<input class="insert_input" type="password" id="mem_pw" name="mem_pw" placeholder="비밀번호">
				<div id="mem_pwInfo"></div>
			</form>
			<button id="check" class="submitBtn">로그인</button>
	   </div>
	</div>
</div>
</div>
<%@include file="../md_bottom.jsp" %>
</body>
</html>