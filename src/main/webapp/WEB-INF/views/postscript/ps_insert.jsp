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
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
var card_imgNum="";
var main_imgNum="none";
var count = 0;
$(document).ready(function(){
	
	$(".ps_loading").hide;
	
});

function modal(card_id, fileName){
	card_imgNum= card_id;
	
	if($("#pd_lc").val()=="none"){
		alert("지역을 선택해주세요!");
		$("#pd_lc").focus();
		return;
	}
	
	if(main_imgNum==card_imgNum){
		$("#main_btn").attr("value","대표사진");
	}else{
		$("#main_btn").attr("value","대표선택");
	}
	
	img_add = $("#"+card_id).css('background-image');
	$(".modal_img>img").attr("src","resources/ps_data/"+fileName);
	$("#modal_context").attr("value", $("."+card_imgNum).val());
	location.href="#openModal";
}

function modalCancel(cate){
	$("#modal_loc_init").attr("selected","selected");
	$("#main_btn").attr("value","대표선택");
	card_imgNum="";
	location.href="#close";
}

function modalWrite(){
	$("."+card_imgNum).attr("value",$("#modal_context").val());
	$("."+card_imgNum+"_loc").attr("value",$("#modal_loc").val());
	
	if($("#modal_context").val()==""){
		$("#"+card_imgNum).css("border-color", "#eee");
	}else{
		$("#"+card_imgNum).css("border-color", "#69D2E7");
	}
	
	if(main_imgNum != $("#main_val").val() && main_imgNum != ""){
		if($("."+main_imgNum).val()==""){
			$("#"+main_imgNum).css("border-color", "#eee");
		}else{
			$("#"+main_imgNum).css("border-color", "#69D2E7");
		}
		main_imgNum = card_imgNum;
	}
	
	if($("#main_btn").val()=="대표사진"){
		$("#"+card_imgNum).css("border-color", "red");
	}
	
	$("#modal_loc_init").attr("selected","selected");
	$("#main_btn").attr("value","대표선택");
	card_imgNum="";
	location.href="#write";
	
}

function title_img(){
	if($("#main_btn").val()=="대표사진"){
		$("#main_val").attr("value", "");
		$("#main_btn").attr("value","대표선택");
	}else if($("#main_btn").val()=="대표선택"){
		$("#main_val").attr("value", card_imgNum);
		$("#main_btn").attr("value","대표사진");
	}
}

function hisBack(){
	history.back();
}

function insertSubmit(){
	
	if($("#pd_lc").val()==""){
		alert("지역을 선택해주세요!");
		$("#pd_lc").focus();
		return;
	}
	
	if($("#ps_main_title").val() == ""){
		alert("제목을 입력해주세요!");
		$("#ps_main_title").focus();
		return;
	}
	
	if($("#upload_btn").val()==""){
		alert("사진을 넣어주세요!");
		$("#upload_btn").focus();
		return;
	}
	
	if($("#main_val").val()==""){
		alert("대표 사진을 선택해주세요!");
		return;
	}
	
	$("#loading").css("display","block");
	$(".member_insert_body").css("opacity","0.5");
	
	$("#insertSubmit").attr("action", "psDataInsert");
	$("#insertSubmit").submit();
}

function modalLocation(){
	addr = $(pd_lc).val();
	$.ajax({
		url:"autocomplete",
		data: "keyword=" + addr,
		success: function(data){
			var str = "<option id='modal_loc_init' selected='selected' value=''>지역 선택</option>";
			$(data).each(function(index, objArr){
				 str += "<option value='"+ objArr.id +"'> " +objArr.name + "</option>";
			});
			
			$(".modal_main_btn>select").html(str);
		}
	});
}

function deleteCard(ps_id, fileName){
	
	if(main_imgNum === "ps_insert_card"+ps_id){
		$("#main_val").attr("value", "");
	}
	
	$("#ps_insert_card"+ps_id).parent().remove();
	$(".ps_insert_body>form").append("<input type='hidden' class='insert_delete' name='deleteFile' value='"+ fileName +"'>");
}

function showProgress(evt) {
	$(".ps_loading").show();
}

function fileUpload(){
	var formdata = new FormData() ;
	var str ="";
	formdata.append('pf_email', $("#getId").val());
	$.each($("#upload_btn")[0].files, function(index, fileObj){
		count++;
		formdata.append('pd_images', fileObj);
		str += "<div class='ps_insert_card_body'><div class='close_btn'><img src='resources/icons/close_btn.png' id='card_cancel"+count+"' ></div><div class='img_click modal_border ps_insert_card' id='ps_insert_card"+count+"'><img src='resources/ps_icon/loding.gif'></div></div>";
	});
	count -= $("#upload_btn")[0].files.length;
	$(".ps_insert_show").append(str);
	
	$.ajax({
		url:"tempFileUp",
		type:'post',
		data: formdata,
		processData: false,
        contentType: false,
		success:function(data){
			$.each(data, function(index, fileObj){
				count++;
				$(".ps_insert_body>form").append("<input type='hidden' value='"+ fileObj.pf_name +"' name='pd_images'>");
				$(".ps_insert_body>form").append("<input type='hidden' class='ps_insert_card"+count+"' value='' name='pd_contexts'>")
				$(".ps_insert_body>form").append("<input type='hidden' class='ps_insert_card"+count+"_loc' value='' name='pl_ids'>")
				$("#card_cancel"+count).attr("onclick","deleteCard('"+count+"','"+fileObj.pf_name+"')");
				$("#ps_insert_card"+count).attr('onclick',"modal('ps_insert_card"+count+"','"+fileObj.pf_name+"')");
				$("#ps_insert_card"+count+">img").attr('src',"resources/ps_data/"+fileObj.pf_name);
			});
		}
	});
}

function fileTag(){
	$("#upload_btn").click();
}
</script>
</head>
<body>
<div id="loading" class="sk-fading-circle">
  <div class="sk-circle1 sk-circle"></div>
  <div class="sk-circle2 sk-circle"></div>
  <div class="sk-circle3 sk-circle"></div>
  <div class="sk-circle4 sk-circle"></div>
  <div class="sk-circle5 sk-circle"></div>
  <div class="sk-circle6 sk-circle"></div>
  <div class="sk-circle7 sk-circle"></div>
  <div class="sk-circle8 sk-circle"></div>
  <div class="sk-circle9 sk-circle"></div>
  <div class="sk-circle10 sk-circle"></div>
  <div class="sk-circle11 sk-circle"></div>
  <div class="sk-circle12 sk-circle"></div>
</div>
<%@include file="../md_top.jsp" %>
<div class="ps_insert_body body member_insert_body">
	<form id="insertSubmit" enctype="multipart/form-data" method="post">
	<div class="ps_insert_location">
	<select name="pd_location" id="pd_lc" onchange="modalLocation()">
		<option value="none" selected="selected">지역선택 해주세요</option>
		<c:forEach var="lc" items="${psLo}">
			<option value="${lc.lc_val}">${lc.lc_name}</option>
		</c:forEach>
	</select>
	</div>
	<div class="ps_insert_ti img_click">Title</div>
	<div class="ps_insert_title">
		<input type="text" id="ps_main_title" name="ps_title" placeholder="제목을 입력해주세요~">
	</div>
	<div class="ps_insert_file">
			<img class="ps_icon" src="resources/ps_icon/picture_add.png" onclick="fileTag()">
	</div>
	<div class="ps_insert_label">
		<span>* 사진을 클릭해주세요</span>
		<span class="comment_color">ㅁ</span>Comment작성
		<span class="title_color">ㅁ</span>대표 사진 선택
	</div>
	<div class="ps_insert_show">
	</div>
	<div class="contentSubmit">
		
	</div>
	<div class="ps_insert_button">
		<input type="button" value="작성" onclick="insertSubmit()">
		<input type="button" value="취소" onclick="hisBack()">
	</div>
	<input type="hidden" id="main_val" name="main_img" value="">
	<input type="hidden" name="pd_email" value="<%=session.getAttribute("mem_id") %>">	
	</form>
</div>
<div id="openModal" class="modal">
	<div class="modalBody">
		<div class="modal_main_btn">
			<input id="main_btn" type="button" value="대표선택" onclick="title_img()">
			<select id="modal_loc">
				
			</select>
		</div>
		<div class="modal_attr modal_img">
			<img>
		</div>
		<div class="modal_title">한 줄 Comment</div>
		<div class="modal_attr modal_context">
			<input type="text" id="modal_context" value="">
		</div>
		<div class="modal_attr modal_button">
			<input type="button" id="write" value="작성" onclick='modalWrite()' ><input id="close" type="button" value="취소" onclick='modalCancel()'>
		</div>
	</div>
	<div class="ps_loading">
		<img class="ps_loading_image" src="resources/ps_icon/loding.gif">
	</div>
</div>
<%@include file="../subMenu.jsp" %>
<form>
	<input type="file" multiple="multiple" id="upload_btn" name="pd_images" onchange="fileUpload()">
</form>
<input type="hidden" id="getId" value="<%=(String)session.getAttribute("mem_id") %>">
</body>
</html>