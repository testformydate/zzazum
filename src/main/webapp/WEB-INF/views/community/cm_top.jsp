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
</style>
</head>
<body>
<ul>
  <li><a href="cm_list?part_no=0">전체</a></li>
  <li><a href="cm_list?part_no=1">연애</a></li>
  <li><a href="cm_list?part_no=2">솔까말</a></li>
  <li><a href="cm_list?part_no=3">야한19	</a></li>
  <li><a href="cm_list?part_no=4">석민이방</a></li>
  <li><a href="cm_list?part_no=5">광민이방</a></li>
  <ul style="float:right;list-style-type:none;">
    <li><a href="../member/memberlogview">Login</a></li>
    <li><a href="../member/memberinsview">Join</a></li>
  </ul>
</ul>


</body>
</html>