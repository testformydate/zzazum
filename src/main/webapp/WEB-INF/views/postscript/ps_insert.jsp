<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/resources/css/ps_insert.css"/>
<style>
</style>
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
var card_imgNum="";

$(document).ready(function(){
	$("#upload_btn").live("change",function(){
				readURL(this);
	});
	
});

function readURL(input) {
	$(".ps_insert_show").html('');
	var cnt=0;
	for(ima=0; ima<input.files.length; ima++){
		$(".ps_insert_show").append("<div class='ps_insert_card img_click modal_border' id='ps_insert_card"+ima+"'><input type='hidden' class='ps_insert_card"+ima+"' name='pd_context'></div>");
	   	$("#ps_insert_card"+ima).attr('onclick',"modal('ps_insert_card"+ima+"')");
		var reader = new FileReader();
        reader.readAsDataURL(input.files[ima]);
        reader.onload = function(){
        	divName ="#ps_insert_card"+cnt;
        	$(divName).css({"background-image":"url(" + this.result + ")","background-repeat":"no-repeat","background-size":"150px 150px"});
        	cnt+= 1;
        }
	}
}

function modal(card_id){
	card_imgNum= card_id;
	img_add = $("#"+card_id).css('background-image');
	$("#modal_context").attr("value", $("."+card_imgNum).val());
	$(".modal_img").css({"background-image": img_add ,"background-repeat":"no-repeat","background-size":"550px 550px"})
	location.href="#openModal";
}

function modalCancel(cate){
	if(cate=="wirte"){
	}
	card_imgNum="";
	location.href="#close";
}

function modalWrite(){
	$("."+card_imgNum).attr("value",$("#modal_context").val());
	
	if("value",$("#modal_context").val()==""){
		$("#"+card_imgNum).css("border-color", "#eee");
	}else{
		$("#"+card_imgNum).css("border-color", "#69D2E7");
	}
	
	card_imgNum="";
	location.href="#write";
	
}
</script>
</head>
<body>
<%@include file="../md_top.jsp" %>
<div class="ps_insert_body body">
	<form id="insertSubmit" enctype="multipart/form-data">
	<div class="ps_insert_ti img_click">Title</div>
	<div class="ps_insert_title">
		<input type="text" name="ps_title" placeholder="제목을 입력해주세요~">
	</div>
	<div class="ps_insert_file">
			<input type="file" multiple="multiple" id="upload_btn" name="pd_image">
	</div>
	<div class="ps_insert_show">
	</div>
	<div class="contentSubmit">
		
	</div>	
	</form>
</div>
<div id="openModal" class="modal">
	<div class="modalBody">
		<div class="modal_attr modal_img">
		</div>
		<div class="modal_title">한 줄 Comment</div>
		<div class="modal_attr modal_context">
			<input type="text" id="modal_context">
		</div>
		<div class="modal_attr modal_button">
			<input type="button" id="write" value="작성" onclick='modalWrite()' ><input id="close" type="button" value="취소" onclick='modalCancel()'>
		</div>
	</div>
</div>
<%@include file="../subMenu.jsp" %>
</body>
</html>