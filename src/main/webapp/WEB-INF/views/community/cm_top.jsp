<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #00cdcd;
}

li {
    float: left;
    padding: 4px 3px;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #00cdcd;
}

.active {
    background-color: #4CAF50;
}

.dropdown{
	position: relative;
	display: inline-block;
}

.dropdown-content{
	display: none;
	position: absolute;
	background-color : #00cdcd;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	padding: 12px 16px;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
</head>
<body>
<div class="dropdown">
		<span>연애</span>
	<div class="dropdown-content">
		<p>야호</p>
	</div>

</div>
<ul>
  <li><a href="cm_list?part_no=0">전체</a></li>
  <li><a href="cm_list?part_no=1">연애</a></li>
  <li><a href="cm_list?part_no=2">솔까말</a></li>
  <li><a href="cm_list?part_no=3">야한19	</a></li>
  <li><a href="cm_list?part_no=4">석민이방</a></li>
  <li><a href="cm_list?part_no=5">광민이방</a></li>
  <li><a href="cm_list?part_no=6">원중이방</a></li>
  <li><a href="cm_list?part_no=7">서연이방</a></li>
  <li><a href="cm_list?part_no=8">수민이방</a></li>
  <li><a href="cm_list?part_no=9">지상이방</a></li>
  
  <ul style="float:right;list-style-type:none;">
    <li><a href="../member/memberlogview">Login</a></li>
    <li><a href="../member/memberinsview">Join</a></li>
  </ul>
</ul>


</body>
</html>