<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../md_top.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/js/hashencode.js' />"></script>
<script type="text/javascript">
//hash listener
$('#generate-hash').click( function() {
	alert("aa");
    var t = new Date();
    hash = Sha256.hash($('#message').val());
    $('#hash-time').html(((new Date() - t))+'ms');
    $('#hash').val(hash);
});

// show source code
$.get('/mydate/resources/js/hashencode.js', function(data) {
    var src = data.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;') // replace &, <, >
    $('#src-code').html(src);
    prettyPrint();
}, 'text');
</script>
<link rel="stylesheet" href="<c:url value="/css/signupform.css" />">
</head>
<body>
	<p class='mempage'>회원가입</p>
<div class="Registro">
<form action="#" autocomplete="off" method="post">
<input type="text" id="message" name="mem_id" placeholder="아이디(이메일)를 입력해주세요" autofocus />
<input type="text" name="mem_nick" placeholder="닉네임을 입력하세요(2자~8자)" />
<input type="password" name="mem_pw" placeholder="비밀번호를 입력하세요(8~20자)" />
<input type="password" name="mem_pwok" placeholder="비밀번호를 한번 더 입력하세요" />
<input type="text" name="mem_tel" placeholder="휴대폰번호를  입력하세요" />
<input type="text" name="mem_bhday" placeholder="생년월일을 - 없이 입력하세요" />

</form>
<button style="z-index:9999;width:100%;height:100px;" id="generate-hash"></button>
<input type="text" id="hash">
</div>

</body>
</html>










