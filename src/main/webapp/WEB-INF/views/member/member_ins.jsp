<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%-- <%@include file="../md_top.jsp" %> --%>
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
		document.insForm.mem_pwOk.value = strHash;
		document.insForm.submit();
		//alert(strHash);
}
</script>
<link rel="stylesheet" href="<c:url value="/resources/css/signupform.css" />">
</head>
<body class="back-img">
<div class="member_insert_body">
   <div class='member_insert_title'>회원가입</div>
   <div class="member_insert_content" style="border: 1px solid white; padding: 20px; text-align: center;">
      <form name="insForm" action="memberins" method="post" style="margin: -3px">
         <div class="insert_input">
            <div class="insert_subtitle">아이디</div>
            <input type="text" name="mem_id" placeholder="아이디(이메일)를 입력해주세요">
         </div>
         <div class="insert_input">
            <div class="insert_subtitle">닉네임</div>
            <input type="text" name="mem_nick" placeholder="닉네임을 입력하세요(2자~8자)">
         </div>
         <div class="insert_input">
            <div class="insert_subtitle">비밀번호</div>
            <input type="password" name="mem_pw" placeholder="비밀번호를 입력하세요(8~20자)">
         </div>
         <div class="insert_input">
            <input type="password" name="mem_pwOk" placeholder="비밀번호를 한번 더 입력하세요">
         </div>
         <div class="insert_input">
            <div class="insert_subtitle">휴대폰</div>
            <input type="text" name="mem_tel" placeholder="휴대폰번호를  입력하세요" />
         </div>
         <div class="insert_input">
            <div class="insert_subtitle">생일</div>
            <input type="text" name="mem_bhday" placeholder="생년월일을 - 없이 입력하세요" />
         </div>
         <div class="insert_input">
            <!-- <input class="insert_button" type="submit" value="submit"> -->
         </div>
      </form>
            <button onclick="calc()" width="100%" height="50px"></button>
   </div>
</div>
<div id="txt2" style="top:40px;left:20px;"></div>
</body>
</html>










