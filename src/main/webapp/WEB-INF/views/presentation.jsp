<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>  

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.slideImg{
	width:100%;
	height:100%;
}
</style>
<title>MyDate Presentation</title>
<script>
   $(document).ready(function(){
      //alert("jquery!");
      
   });
</script>
</head>
<body>
<div class="pptSlides">
	<div id="slide1" class="slide"><img class="slideImg" src="${path}/resources/icons/slide1.png"></div>
	<div id="slide2" class="slide"><img class="slideImg" src="${path}/resources/icons/slide2.PNG"></div>
	<div id="slide3" class="slide"><img class="slideImg" src="${path}/resources/icons/slide3.PNG"></div>
	<div id="slide4" class="slide"><img class="slideImg" src="${path}/resources/icons/slide4.PNG"></div>
	<div id="slide5" class="slide"><img class="slideImg" src="${path}/resources/icons/slide5.PNG"></div>
	<div id="slide6" class="slide"><img class="slideImg" src="${path}/resources/icons/slide6.PNG"></div>
	<div id="slide7" class="slide"><img class="slideImg" src="${path}/resources/icons/slide7.PNG"></div>
	<div id="slide8" class="slide"><img class="slideImg" src="${path}/resources/icons/slide8.PNG"></div>
	<div id="slide9" class="slide"><img class="slideImg" src="${path}/resources/icons/slide9.PNG"></div>
	<div id="slide10" class="slide"><img class="slideImg" src="${path}/resources/icons/slide10.PNG"></div>
	<div id="slide11" class="slide"><img class="slideImg" src="${path}/resources/icons/slide11.PNG"></div>
	<div id="slide12" class="slide"><img class="slideImg" src="${path}/resources/icons/slide12.PNG"></div>
	<div id="slide13" class="slide"><img class="slideImg" src="${path}/resources/icons/slide13.PNG"></div>
	<div id="slide14" class="slide"><img class="slideImg" src="${path}/resources/icons/slide14.PNG"></div>
</div>
</body>
</html>