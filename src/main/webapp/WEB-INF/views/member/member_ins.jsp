<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
html {
	height: 100%;
}

body {
	margin: 0;
	padding: 0;
	background-image: url('../resources/ps_images/member/main.png');
	background-repeat: no-repeat;
	/* background-size: 1600px 785px; */
	background-size: 100% 100%;
}

.member_insert_body {
	width: 100%;
	margin-top: 50px;
}

.insert_form {
	margin: auto;
	width: 25%;
	padding: 30px;
	border-radius: 6px;
	background-color: white;
	box-shadow: 0 0 10px 1px gray;
}

.submitBtn {
	padding: 0;
	margin: 0;
	border: 0;
	border-radius: 4px;
	margin-top: 20px;
	font-size: 1.2em;
	font-weight: 600;
	font-family: 'Nanum Gothic';
	color: white;
	width: 100%;
	height: 50px;
	background-color: #00cdcd;
	cursor: pointer;
}

.submitBtn:hover{
	background-color:#00CC88;
}

.insert_input {
	padding: 0;
	margin: 0;
	border: 1px solid lightgray;
	width: 100%;
	border-radius: 4px;
	height: 40px;
	font-size: 1.5em;
	font-weight: 400;
	font-family: 'Nanum Gothic';
	margin-top: 6px;
	box-border: 0;
}

.insert_inputMini {
	padding: 0;
	margin: 0;
	border: 1px solid lightgray;
	width: 20%;
	border-radius: 4px;
	height: 40px;
	font-size: 1.5em;
	font-weight: 400;
	font-family: 'Nanum Gothic';
	margin-top: 6px;
	box-border: 0;
}

.member_insert_title {
	text-align: center;
	margin-bottom: 13px;
	font-size: 2em;
}

.logo {
	border-radius: 8px;
	width: 60px;
}

.genBoxWrapper {
	/* float:left; */
	display: inline-block;
	margin: auto;
	margin-top: 6px;
}

.genBox {
	clear: both;
	/* float:left; */
	margin-left: 60px;
	display: inline-block;
	/* margin:auto; */
}

label {
	width: 100px;
	border-radius: 3px;
	border: 1px solid #D1D3D4;
	font-size: 13pt;
	font-family: 'Nanum Gothic';
}

/* hide input */
input.radio:empty {
	margin-left: -999px;
}

/* style label */
input.radio:empty ~ label {
	position: relative;
	float: left;
	line-height: 2.5em;
	text-indent: 3.25em;
	/* margin-top: 2em; */
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

input.radio:empty ~ label:before {
	position: absolute;
	/* display: block; */
	top: 0;
	bottom: 0;
	left: 0;
	content: '';
	width: 2.5em;
	background: #D1D3D4;
	border-radius: 3px 0 0 3px;
}

/* toggle hover */
input.radio:hover:not (:checked ) ~ label:before {
	content: '\2714';
	text-indent: .9em;
	color: #C2C2C2;
}

input.radio:hover:not (:checked ) ~ label {
	color: #888;
}

/* toggle on */
input.radio:checked ~ label:before {
	content: '\2714';
	text-indent: .9em;
	color: #9CE2AE;
	background-color: #4DCB6D;
}

input.radio:checked ~ label {
	color: #777;
}

/* radio focus */
input.radio:focus ~ label:before {
	box-shadow: 0 0 0 3px #999;
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
	margin: 250px 780px;
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
</style>
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="../resources/js/hashencode.js"></script>
<script type="text/javascript">
function encode(){
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
		document.insForm.mem_pwOk.value = strHash;
		$("#loading").css("display","block");
		$(".member_insert_body").css("opacity","0.5");
		document.insForm.submit();
		//alert(strHash);
}

function check(){
var gen = document.insForm.mem_gender.value;
	
var email = document.insForm.mem_id.value;
if(email == null || email == ""){
	$("#mem_id").css("border","1px solid #e91e63");
	$("#mem_idInfo").html("<p>이메일을 입력해 주세요.</p>");
	return;
}else if(!id_regExp.test(email)){
	$("#mem_id").css("border","1px solid #e91e63");
	$("#mem_idInfo").html("<p>이메일을 확인해 주세요.</p>");
	return;
}else{
	$("#mem_idInfo").html("");
}

$.ajax({
	type: "post",
	url: "memberIdCheck",
	data: {"mem_id": email},
	success: function(b){
		if(b == true || b == "true"){
			$("#mem_id").css("border","1px solid #4DCB6D");
			$("#mem_idInfo").html("");
		}else{
			$("#mem_id").css("border","1px solid #e91e63");
			$("#mem_idInfo").html("<p>이미 존재하는 이메일입니다.</p>");
		}
	}
});

var name = document.insForm.mem_nick.value;
if(name == null || name == ""){
	$("#mem_nick").css("border","1px solid #e91e63");
	$("#mem_nickInfo").html("<p>별명을 입력해주세요.</p>");
	return;
}else if(!name_regExp.test(name)){
	$("#mem_nick").css("border","1px solid #e91e63");
	$("#mem_nickInfo").html("<p>별명은 4~12자의 한글, 영문, 숫자만 가능합니다.</p>");
	return;
}else{
	$("#mem_nickInfo").html("");
}

$.ajax({
	type: "post",
	url: "memberNameCheck",
	data: {"mem_nick": name},
	success: function(b){
		if(b == true || b == "true"){
			$("#mem_nick").css("border","1px solid #4DCB6D");
			$("#mem_nickInfo").html("");
		}else{
			$("#mem_nick").css("border","1px solid #e91e63");
			$("#mem_nickInfo").html("<p>이미 존재하는 애칭입니다.</p>");
		}
	},
});

var pw1 = document.insForm.mem_pw.value;		//비밀번호 특수문자 최소 하나 이상 입력 가능하도록.
if(pw1==null || pw1==""){
	$("#mem_pw").css("border","1px solid #e91e63");
	$("#mem_pwInfo").html("<p>비밀번호를 입력해주세요.</p>");
	$("#mem_pw").val('');
	$("#mem_pwOk").val('');
	return;
}else if(!pw1_regExp.test(pw1)){
	$("#mem_pw").css("border","1px solid #e91e63");
	$("#mem_pwInfo").html("<p>보안을 위해서 비밀번호는 8~16자의 영문 대소문자, 숫자를 반드시 포함해주셔야 해요!</p>");
	$("#mem_pw").val('');
	$("#mem_pwOk").val('');
	return;
}else{
	$("#mem_pw").css("border","1px solid #4DCB6D");
	$("#mem_pwInfo").html("");
}

var pw1 = document.insForm.mem_pw.value;
var pw2 = document.insForm.mem_pwOk.value;
if(pw1!=pw2){
	$("#mem_pwOk").css("border","1px solid #e91e63");
	$("#mem_pwOkInfo").html("<p>비밀번호가 일치하지 않습니다.</p>");
	$("#mem_pw").val('');
	$("#mem_pwOk").val('');
	return;
}else{
	$("#mem_pwOk").css("border","1px solid #4DCB6D");
	$("#mem_pwOkInfo").html("");
}	

var tel = document.insForm.mem_tel.value;
if(!tel == null || !tel == ""){
	if(!tel_regExp.test(tel)){
		$("#mem_tel").css("border","1px solid #e91e63");
		$("#mem_telInfo").html("<p>-를 제외한 숫자를 입력해주세요.</p>");
		return;
	}else{
		$("#mem_tel").css("border","1px solid #4DCB6D");
		$("#mem_telInfo").html("");
	}
}

var bhday = document.insForm.mem_bhday.value; // 생년월일 조건식 ex 1900~2000몇년 12월 40일 불가
if(!bhday == null || !bhday == ""){
	if(!bhday_regExp.test(bhday)){
		$("#mem_bhday").css("border","1px solid #e91e63");
		$("#mem_bhdayInfo").html("<p>숫자만 입력해주세요. 예)930214</p>");
		return;
	}else{
		$("#mem_bhday").css("border","1px solid #4DCB6D");
		$("#mem_bhdayInfo").html("");
	}
}

var l_email = document.insForm.mem_love.value;
if(!l_email == null || !l_email == ""){
	if(!lovem_regExp.test(l_email)){
		$("#mem_love").css("border","1px solid #e91e63");
		$("#mem_loveInfo").html("<p>이메일을 확인해주세요!</p>");
		return;
	}else{
		$("#mem_love").css("border","1px solid #4DCB6D");
		$("#mem_loveInfo").html("");
	}
}
	
	encode();
}

//regular expression
var id_regExp = /^[0-9a-zA-Z][_0-9a-zA-Z\-_.]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
var name_regExp = /^[a-zA-Z0-9가-힣]{4,12}$/;
var pw1_regExp = /^([a-zA-Z0-9!@#$%^&*]){8,16}$/;
var tel_regExp = /^\d{3}\d{3,4}\d{4}$/;
var bhday_regExp = /^\d{4}\d{4}$/;
var lovem_regExp = /^[0-9a-zA-Z][_0-9a-zA-Z\-_.]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;

$(document).ready(function(){
	var gen = document.insForm.mem_gender.value;
	
	$("#mem_id").blur(function(){
		var email = document.insForm.mem_id.value;
		if(email == null || email == ""){
			$("#mem_id").css("border","1px solid #e91e63");
			$("#mem_idInfo").html("<p>이메일을 입력해 주세요.</p>");
			return;
		}else if(!id_regExp.test(email)){
			$("#mem_id").css("border","1px solid #e91e63");
			$("#mem_idInfo").html("<p>이메일을 확인해 주세요.</p>");
			return;
		}else{
			$("#mem_idInfo").html("");
		}
		
		$.ajax({
			type: "post",
			url: "memberIdCheck",
			data: {"mem_id": email},
			success: function(b){
				if(b == true || b == "true"){
					$("#mem_id").css("border","1px solid #4DCB6D");
					$("#mem_nickInfo").html("");
				}else{
					$("#mem_id").css("border","1px solid #e91e63");
					$("#mem_idInfo").html("<p>이미 존재하는 이메일입니다.</p>");
				}
			}
		});
	});
	
	$("#mem_id").keyup(function(e){
		if(e.keyCode == 13){
			document.insForm.mem_nick.focus();
		}
	});
	
	$("#mem_nick").blur(function(){
		var name = document.insForm.mem_nick.value;
		if(name == null || name == ""){
			$("#mem_nick").css("border","1px solid #e91e63");
			$("#mem_nickInfo").html("<p>별명을 입력해주세요.</p>");
			return;
		}else if(!name_regExp.test(name)){
			$("#mem_nick").css("border","1px solid #e91e63");
			$("#mem_nickInfo").html("<p>별명은 4~12자의 한글, 영문, 숫자만 가능합니다.</p>");
			return;
		}else{
			$("#mem_nickInfo").html("");
		}
		
		$.ajax({
			type: "post",
			url: "memberNameCheck",
			data: {"mem_nick": name},
			success: function(b){
				if(b == true || b == "true"){
					$("#mem_nick").css("border","1px solid #4DCB6D");
					$("#mem_nickInfo").html("");
				}else{
					$("#mem_nick").css("border","1px solid #e91e63");
					$("#mem_nickInfo").html("<p>이미 존재하는 애칭입니다.</p>");
				}
			},
		});
	});
	
	$("#mem_nick").keyup(function(e){
		if(e.keyCode == 13){
			document.insForm.mem_pw.focus();
		}
	});
	
	$("#mem_pw").blur(function(){
		var pw1 = document.insForm.mem_pw.value;		//비밀번호 특수문자 최소 하나 이상 입력 가능하도록.
		if(pw1==null || pw1==""){
			$("#mem_pw").css("border","1px solid #e91e63");
			$("#mem_pwInfo").html("<p>비밀번호를 입력해주세요.</p>");
			$("#mem_pw").val('');
			$("#mem_pwOk").val('');
			return;
		}else if(!pw1_regExp.test(pw1)){
			$("#mem_pw").css("border","1px solid #e91e63");
			$("#mem_pwInfo").html("<p>보안을 위해서 비밀번호는 8~16자의 영문 대소문자, 숫자를 반드시 포함해주셔야 해요!</p>");
			$("#mem_pw").val('');
			$("#mem_pwOk").val('');
			return;
		}else{
			$("#mem_pw").css("border","1px solid #4DCB6D");
			$("#mem_pwInfo").html("");
		}
	});
	
	$("#mem_pw").keyup(function(e){
		if(e.keyCode == 13){
			document.insForm.mem_pwOk.focus();
		}
	});
	
	$("#mem_pwOk").blur(function(){
		var pw1 = document.insForm.mem_pw.value;
		var pw2 = document.insForm.mem_pwOk.value;
		if(pw1!=pw2){
			$("#mem_pwOk").css("border","1px solid #e91e63");
			$("#mem_pwOkInfo").html("<p>비밀번호가 일치하지 않습니다.</p>");
			$("#mem_pw").val('');
			$("#mem_pwOk").val('');
			return;
		}else{
			$("#mem_pwOk").css("border","1px solid #4DCB6D");
			$("#mem_pwOkInfo").html("");
		}
	});
	
	$("#mem_pwOk").keyup(function(e){
		if(e.keyCode == 13){
			document.insForm.radio1.focus();
		}
	});
	
	$("#radio1").keyup(function(e){
		if(e.keyCode == 13){
			document.insForm.mem_tel.focus();
		}
	});
	
	$("#radio2").keyup(function(e){
		if(e.keyCode == 13){
			document.insForm.mem_tel.focus();
		}
	});
	
	$("#mem_tel").blur(function(){
		var tel = document.insForm.mem_tel.value;
		if(!tel == null || !tel == ""){
			if(!tel_regExp.test(tel)){
				$("#mem_tel").css("border","1px solid #e91e63");
				$("#mem_telInfo").html("<p>-를 제외한 숫자를 입력해주세요.</p>");
				return;
			}else{
				$("#mem_tel").css("border","1px solid #4DCB6D");
				$("#mem_telInfo").html("");
			}
		}
	});
	
	$("#mem_tel").keyup(function(e){
		if(e.keyCode == 13){
			document.insForm.mem_bhday.focus();
		}
	});
	
	$("#mem_bhday").blur(function(){
		var bhday = document.insForm.mem_bhday.value; // 생년월일 조건식 ex 1900~2000몇년 12월 40일 불가
		if(!bhday == null || !bhday == ""){
			if(!bhday_regExp.test(bhday)){
				$("#mem_bhday").css("border","1px solid #e91e63");
				$("#mem_bhdayInfo").html("<p>숫자만 입력해주세요. 예)19930214</p>");
				return;
			}else{
				$("#mem_bhday").css("border","1px solid #4DCB6D");
				$("#mem_bhdayInfo").html("");
			}
		}
	});
	
	$("#mem_bhday").keyup(function(e){
		if(e.keyCode == 13){
			document.insForm.mem_love.focus();
		}
	});
	
	$("#mem_love").blur(function(){
		var l_email = document.insForm.mem_love.value;
		if(!l_email == null || !l_email == ""){
			if(!lovem_regExp.test(l_email)){
				$("#mem_love").css("border","1px solid #e91e63");
				$("#mem_loveInfo").html("<p>이메일을 확인해주세요!</p>");
				return;
			}else{
				$("#mem_love").css("border","1px solid #4DCB6D");
				$("#mem_loveInfo").html("");
			}
		}
	});
	
	$("#mem_love").keyup(function(e){
		if(e.keyCode == 13){
			check();
		}
	});
	
	$("#submitBtn").click(function(){
		check();
	});
});
</script>
</head>
<body>
<div id="loading" class="sk-fading-circle">
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
				<div class="member_insert_title">
					<a href="/mydate/home"><img class="logo"
						src="../icons/mydatelogo.png"></a>
				</div>
				<div class="member_insert_content">
					<form name="insForm" action="memberins" method="post">
						<input class="insert_input" type="text" id="mem_id" name="mem_id"placeholder="이메일" autofocus> 
						<div id="mem_idInfo"></div>
						<input class="insert_input"type="text" id="mem_nick" name="mem_nick" placeholder="애칭">
						<div id="mem_nickInfo"></div>
						<input class="insert_input" type="password" id="mem_pw" name="mem_pw"placeholder="비밀번호">
						<div id="mem_pwInfo"></div> 
						<input class="insert_input" type="password" id="mem_pwOk" name="mem_pwOk" placeholder="비밀번호 재입력">
						<div id="mem_pwOkInfo"></div>
						<div class="genBoxWrapper">
							<div class="genBox">
								<input type="radio" name="mem_gender" id="radio1" class="radio"
									value="1" checked /> <label for="radio1">남자</label>
							</div>
							<div class="genBox">
								<input type="radio" name="mem_gender" id="radio2" value="2"
									class="radio" /> <label for="radio2">여자</label>
							</div>
						</div>
						<input class="insert_input" type="text" id="mem_tel" name="mem_tel" placeholder="휴대전화번호(선택)" />
						<div id="mem_telInfo"></div> 
						<input class="insert_input" type="text" id="mem_bhday" name="mem_bhday" placeholder="생년월일(선택)" />
						<div id="mem_bhdayInfo"></div> 
						<input class="insert_input" type="text" id="mem_love" name="mem_love" placeholder="그/그녀의 이메일(선택)" />
						<div id="mem_loveInfo"></div>
					</form>
					<button id="submitBtn" class="submitBtn">가입하기</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../md_bottom.jsp"%>
</body>
</html>