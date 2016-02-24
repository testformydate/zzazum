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
	background-size: 1600px 785px;
}

.member_insert_body {
	width: 100%;
	margin-top: 100px;
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
	margin-bottom: 6px;
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
	margin-bottom: 10px;
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
</style>
<title>Insert title here</title>

<script type="text/javascript" src="../resources/js/hashencode.js"></script>
<script type="text/javascript">
function calc(){

	//input values
	var email = document.insForm.mem_id.value;
	var name = document.insForm.mem_nick.value;
	var pw1 = document.insForm.mem_pw.value;		//비밀번호 특수문자 최소 하나 이상 입력 가능하도록.
	var pw2 = document.insForm.mem_pwOk.value;
	var gen = document.insForm.mem_gender.value; 
	var tel = document.insForm.mem_tel.value;	
	var bhday = document.insForm.mem_bhday.value; // 생년월일 조건식 ex 1900~2000몇년 12월 40일 불가
	var l_email = document.insForm.mem_love.value;
	//regular expression
	var id_regExp = /^[0-9a-zA-Z][_0-9a-zA-Z\-_.]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
	var name_regExp = /^[a-zA-Z0-9가-힣]{4,12}$/;
	var pw1_regExp = /^([a-zA-Z0-9]){8,16}$/;
	var tel_regExp = /^\d{3}\d{3,4}\d{4}$/; 
	var bhday_regExp = /^\d{2}\d{4}$/;
	var lovem_regExp = /^[0-9a-zA-Z][_0-9a-zA-Z\-_.]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
	
	
	if(!id_regExp.test(email)){
		alert("이메일을 확인해 주세요");
		document.insForm.mem_id.focus();
		return;
	};
	if(email == null || email == ""){
		alert("이메일을 입력해 주세요");
		document.insForm.mem_id.focus();
		return;
	}
	if(!name_regExp.test(name)){
		alert("별명은 한글, 영문, 숫자만 가능합니다.");
		document.insForm.mem_nick.focus();
		return;
	};
	if(name == null || name == ""){
		alert("별명을 입력해주세요.");
		document.insForm.mem_nick.focus();
		return;
	}
	if(!pw1_regExp.test(pw1)){
		alert("보안을 위해서 비밀번호는 8~16자의 영문 대소문자, 숫자를 반드시 포함해주셔야 해요!");
		$("#mem_pw").val('');
		$("#mem_pwOk").val('');
		document.insForm.mem_pw.focus();
		return;
	};
	if(pw1==null || pw1==""){
		alert("비밀번호를 입력해주세요.");
		$("#mem_pw").val('');
		$("#mem_pwOk").val('');
		document.insForm.mem_pw.focus();
		return;
	}
	if(pw1!=pw2){
		alert("비밀번호가 일치하지 않습니다.");
		$("#mem_pw").val('');
		$("#mem_pwOk").val('');
		document.insForm.mem_pw.focus();
		return;
	}
	if(!tel_regExp.test(tel)){
		alert("-를 제외한 숫자를 입력해주세요.");
		document.insForm.mem_tel.focus();
		return;
	};
	if(tel == null || tel == ""){
		alert("휴대전화번호를 입력해주세요.");
		document.insForm.mem_tel.focus();
		return;
	}
	if(!bhday_regExp.test(bhday)){
		alert("숫자만 입력해주세요. 예)930214");
		document.insForm.mem_bhday.focus();
		return;
	};
	if(!lovem_regExp.test(l_email)){
		alert("이메일을 확인해주세요!");
			document.insForm.mem_love.focus();
			return;
	};
	
	
	
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
		document.insForm.submit();
		//alert(strHash);
}
</script>
</head>
<body>
	<div class="member_insert_body body">
		<div class="member_insert_body">
			<div class="insert_form">
				<div class="member_insert_title">
					<a href="/mydate/home"><img class="logo"
						src="../icons/mydatelogo.png"></a>
				</div>
				<div class="member_insert_content">
					<form name="insForm" action="memberins" method="post">
						<input class="insert_input" type="text" name="mem_id"placeholder="이메일"> 
						<input class="insert_input"type="text" name="mem_nick" placeholder="애칭">
						<input class="insert_input" type="password" name="mem_pw"placeholder="비밀번호"> 
						<input class="insert_input" type="password" name="mem_pwOk" placeholder="비밀번호 재입력">
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
						<input class="insert_input" type="text" name="mem_tel" placeholder="휴대전화번호(선택)" /> 
						<input class="insert_input" type="text" name="mem_bhday" placeholder="생년월일(선택)" /> 
						<input class="insert_input" type="text" name="mem_love" placeholder="그/그녀의 이메일(선택)" />
					</form>
					<button class="submitBtn" onclick="calc()">가입하기</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../md_bottom.jsp"%>
</body>
</html>