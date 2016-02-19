<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function aa(){
	alert(form.cm_id.value);
}
</script>
</head>
<body>
<form name="form" action="cm_wr" method ="post">
	글쓴이 : <input type="text" name="cm_id"><br/>
	제목 : <input type="text" name="cm_title"><br/>
	내용 : <textarea name="cm_content" rows="4" cols="50"></textarea><br/>
	<input type="submit" value="등록">
</form>
</body>
</html>