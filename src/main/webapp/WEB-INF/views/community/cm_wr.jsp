<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	 String mem_id =(String)session.getAttribute("mem_id");
	 String mem_nick =(String)session.getAttribute("mem_nick");
%>
<%@ include file="cm_top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/bd_detail.css" />">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#ins_back").click(function() {
			location.href = history.back();
		});
		$("#wr_submit").click(function(){
			if($("#cm_title").val() == ""){
				alert("제목좀 써라");
				return;
			}
			if($("#cm_content").val() == ""){
				alert("내용은 써야하지 않겠니?")
				return;
			}
			form.submit();
		});
	});
</script>
</head>
<body>
<form name="form" action="cm_wr" method ="post">
<input type="hidden" name="cm_id" value="<%=mem_id %>">
<input type="hidden" name="cm_nick" value="<%=mem_nick %>">
<input type="hidden" name="cm_partno" value="${part_no }">
<input type="hidden" name="part_no" value="${part_no }">
		<div class="wrapbody">
			<div id="container" class="clear"></div>
			<div id="content">
				<div class="view_rap">
					<div class="view_head">
						<!-- 제목 -->
						<p class="view_title">
							<input type="text" size="50" id="cm_title" name="cm_title" placeholder="제목을 입력하세요"
								style="font-size: 24px;">
						</p>
						<!-- 조회수/추천수 -->
						<div class="info clear">
							<span class="icon_love"></span> 0 <span
								class="view"> "조회수 " <span> 0 </span>
							</span> 
						</div>
						<!-- 조회수/추천수 -->
						<!-- 글쓴이 -->
						<div class="write_user">
							<b> <span class="user_img_box"> <img
									src="https://member.yanolja.com/include/img/picture/default_gender_picture.png"
									width="38" height="38"> <em class="cover46"></em>
							</span> <%=mem_nick %>
							</b>
						</div>
						<!-- 글쓴이 -->
					</div>
					<!-- 본문내용 -->
					<div class="view_content">
						<textarea id = "cm_content" name="cm_content" cols="100" rows="12" placeholder="내용을 입력하세요"></textarea>
					</div>
					<div class="move_area clear">
						<div class="btn_box">
							<button type="button" id="wr_submit" class="del btn_100x36_g text_h36"
								style="height: 40px;">
								<span>글작성 완료</span>
							</button>
							<button type="button" id="ins_back" class="btn_100x36_p text_h36">
								<span>목록 으로</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>