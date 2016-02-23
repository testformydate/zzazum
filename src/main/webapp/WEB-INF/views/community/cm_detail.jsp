<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
조회수 : <input type="text" name="cm_rcnt" value="${cm_Detail.cm_rcnt }"><br/><br/><br/><br/>

<div>
<form method = "post" action="comt_wr">
	<input type="hidden" name="comt_part" value="${cm_Detail.cm_partno }"><br/>
	<input type="hidden" name="comt_bono" value="${cm_Detail.cm_no }"><br/>
	작성자 : <input type="text" name="comt_id"><br/>
	닉네임 : <input type="text" name="comt_nik"><br/>
	내 용 : <textarea name="comt_content" cols="40" rows="10" ></textarea><br/>
	<input type="submit" value="댓글등록">
</form>
		<table border="1">
		<tr><th>1</th><th>2</th><th>3</th></tr>
	<c:forEach items="${comt_List}" var="c">
		<tr>
		<td>
			${c.comt_id }
		</td>
		<td>
			${c.comt_nik }
		</td>
		<td>
			${c.comt_content }
		</td>
		</tr>
	</c:forEach>
		</table>


</div>
</body>
</html>