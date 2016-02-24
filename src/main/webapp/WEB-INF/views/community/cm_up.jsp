<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="cm_top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/bd_detail.css" />">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#up_back").click(function() {
			location.href = history.back();
		});
	});
</script>
</head>
<body>
	<form action="cm_up" method="post">
		<input type="hidden" name="cm_no" value="${cm_UpView.cm_no }">
		<div class="wrapbody">
			<div id="container" class="clear"></div>
			<div id="content">
				<div class="view_rap">
					<div class="view_head">
						<!-- 제목 -->
						<p class="view_title">
							<input type="text" name="cm_title" value="${cm_UpView.cm_title }"
								style="font-size: 24px;">
						</p>
						<!-- 조회수/추천수 -->
						<div class="info clear">
							<span class="icon_love"></span> ${cm_UpView.cm_like } <span
								class="view"> "조회수 " <span>${cm_UpView.cm_rcnt }</span>
							</span> <span class="date"> ${cm_UpView.cm_wdate } </span>
						</div>
						<!-- 조회수/추천수 -->
						<!-- 글쓴이 -->
						<div class="write_user">
							<b> <span class="user_img_box"> <img
									src="https://member.yanolja.com/include/img/picture/default_gender_picture.png"
									width="38" height="38"> <em class="cover46"></em>
							</span> ${cm_UpView.cm_nick }
							</b>
						</div>
						<!-- 글쓴이 -->
					</div>
					<!-- 본문내용 -->
					<div class="view_content">
						<textarea name="cm_content" cols="90" rows="10">${cm_UpView.cm_content }</textarea>
					</div>
					<div class="move_area clear">
						<div class="btn_box">
							<button type="submit" class="del btn_100x36_g text_h36"
								style="height: 40px;">
								<span>수정 완료</span>
							</button>
							<button type="button" id="up_back" class="btn_100x36_p text_h36">
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
