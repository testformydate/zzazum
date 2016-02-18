<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<form name="insForm" method="post">
아이디 : <input type="text" name="mem_id">
패스워드 : <input type="password" name="mem_pw">
<!-- <input type="submit" value="로그인"> -->
</form>
<button id="submit" onclick="calc()"></button>
</body>
</html>