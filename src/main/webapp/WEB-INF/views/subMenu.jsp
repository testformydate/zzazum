<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.subMenu_body{position:fixed; bottom: 3%; right: 2%; text-align: center;}
.subMenu_img{margin: 0; padding:0;}
.subMenu_img>img:hover{cursor: pointer;}
.subMenu_img>img{ width: 60px; height: 60px; margin: 0; padding: 0; box-shadow: 0px 0px 20px rgba(0,0,0, 0.1);}
</style>
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
function psBack(){
	location.href="psListAll";
}

function psTop(){
	$('html,body').animate({scrollTop : 0}, 800);
}

function psInsert(){
	location.href="psListInsert";
}
</script>
</head>
<body>
<div class="subMenu_body">
		<div class="subMenu_img"><img class="click_cursor" src="resources/icons/write1.jpg" onclick="javascript:psInsert()"></div>
		<div class="subMenu_img"><img class="click_cursor" src="resources/icons/top1.jpg" onclick="javascript:psTop()"></div>
		<div class="subMenu_img"><img class="click_cursor" src="resources/icons/back1.jpg" onclick="javascript:psBack()"></div>
</div>
</body>
</html>