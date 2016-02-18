<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.ps_slide_body{position: absolute; top :15%; left:10%; width: 80%; overflow: hidden;}
.ps_slide_body>ul>li{list-style: none; }
.ps_slide_card{width:300px; height: 383px; background-color: red;}
.ps_slide_show{display:inline-block;}
.ps_slide_hidden{display:none;}
.ps_slide_left{position: absolute; left:0; top:50%}
.ps_slide_right{position: absolute; right:0; top:50%}
.ps_slide_card{margin: 0px 10px;}
.ps_slide_ul{margin-left: 20px;}
</style>
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">


</script>
</head>
<body>
<div class="ps_slide_body">
	<div class="ps_slide_left"><input type="button" value="left"></div>
	<div class="ps_slide_ul">
		<ul>
			<li id="1" class="ps_slide_show"><div class="ps_slide_card"></div></li>
			<li id="2" class="ps_slide_show"><div class="ps_slide_card"></div></li>
			<li id="3" class="ps_slide_show"><div class="ps_slide_card"></div></li>
			<li id="4" class="ps_slide_show"><div class="ps_slide_card"></div></li>
			<li id="5" class="ps_slide_hidden"><div class="ps_slide_card"></div></li>
			<li id="6" class="ps_slide_hidden"><div class="ps_slide_card"></div></li>
			<li id="7" class="ps_slide_hidden"><div class="ps_slide_card"></div></li>
		</ul>
	</div>
	<div class="ps_slide_right"><input type="button" value="right"></div>
</div>
</body>
</html>