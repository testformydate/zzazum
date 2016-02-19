<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js" ></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#cm_up").click(function(){
		location.href = "cm_upview?sm=${cm_Detail.cm_no}";
	});	

	$("#cm_del").click(function(){
		location.href = "cm_del?sm3=${cm_Detail.cm_no}";
	});	

});
</script>
</head>
<body>
<input type="button" id="cm_up" value="수정">
 <input type="button" id="cm_del" value="삭제"><br/>
글번호 : <input type="text" readonly="readonly" value="${cm_Detail.cm_no }"><br/>
글쓴이 : <input type="text" readonly="readonly" value="${cm_Detail.cm_id } "><br/>
제목 : <input type="text" readonly="readonly" value="${cm_Detail.cm_title } "><br/>
내용 : <input type="text" readonly="readonly" value="${cm_Detail.cm_content } "><br/>

</body>
</html>