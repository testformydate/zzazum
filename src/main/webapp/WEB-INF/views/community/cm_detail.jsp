<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="cm_top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/bd_detail.css" />">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js" ></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#cm_up").click(function(){
		location.href = "cm_upview?sm=${cm_Detail.cm_no}";
	});	

	$("#cm_del").click(function(){
		if(confirm("정말 삭제할까요?") == true){
			event.preventDefault();	
		}else{
			return;
		}
		var p_no = $("#cm_pn").val();
		location.href = "cm_del?sm3=${cm_Detail.cm_no}&p_no=" + p_no;
	});	
	$("#cm_back").click(function(){
		location.href = history.back();
	});
});
</script>
</head>
<body>
<input type="hidden" id = "cm_pn" value="${cm_Detail.cm_partno }">
<div class="wrapbody">
	<div id="container" class="clear"></div>
		<div id="content">
			<div class="view_rap">
				<div class="view_head">
				<!-- 제목 -->
					<p class="view_title">${cm_Detail.cm_title }</p>
				<!-- 조회수/추천수 -->
				<div class="info clear">
					<span class="icon_love"></span>
						${cm_Detail.cm_like }
						<span class="view">
						"조회수 "
						<span>${cm_Detail.cm_rcnt }</span>
					</span>
					<span class="date">
					${cm_Detail.cm_wdate }
					</span>
				</div>
				<!-- 조회수/추천수 -->
				<!-- 글쓴이 -->
				<div class="write_user">
					<b>
					<span class="user_img_box">
						<img src="https://member.yanolja.com/include/img/picture/default_gender_picture.png" width="38" height= "38">
						<em class="cover46"></em>
					</span>
					${cm_Detail.cm_nick }
					</b>
				</div>	
				<!-- 글쓴이 -->
				</div>
				<!-- 본문내용 -->
				<div class="view_content">
				 ${cm_Detail.cm_content }
				</div>
				<div class="response_area">
				<!-- 좋아요 -->
				<button type="button" class="btn_heart">
					<em class="icon_love"></em>
					${cm_Detail.cm_like }
				</button>
				<!-- SNS 링크 -->
				<div class="sns_box">
					<a href = "http://facebook.com" class="sns_f">
						<span class="p_hide">페이스북</span>
					</a>
				<a href = "http://twitter.com" class="sns_t">
					<span class="p_hide">트위터</span>
				</a>
				</div>
				<!-- SNS 링크 -->
				</div>
				<!-- 하단 메뉴 -->
				<!-- 이전글/다음글 -->
				<div class="move_area clear">
					<div class="btn_box">
					<c:choose>
					<c:when test="${b }">
					<button type="button" id="cm_del" class="del btn_100x36_g text_h36">
						<span>삭제</span>
					</button>
					<button type="button" id="cm_up" class="edit btn_100x36_wg text_h36">
						<span>수정</span>
					</button>
					</c:when>
					</c:choose>
					
					<c:choose>
						<c:when test="${a }">
					<button type="button" id="cm_del" class="del btn_100x36_g text_h36">
						<span>삭제</span>
					</button>
					<button type="button" id="cm_up" class="edit btn_100x36_wg text_h36">
						<span>수정</span>
					</button>
						</c:when>
					</c:choose>
					<button type="button" id="cm_back" class="btn_100x36_p text_h36">
						<span>목록</span>
					</button>
					</div>
					<div id="repBoard">
						<div class="reply_rap">
						<div class="edit_area">
							<h4>
								"댓글 "
								<span class="point">${comt_List.size() }</span>
							</h4>
							<a href="cm_rule" target="_blank" class="link">짜줌 운영원칙</a>
								</div>
							<form method = "post" action="comt_wr">
							<input type="hidden" name="comt_part" value="${cm_Detail.cm_partno }"><br/>
							<input type="hidden" name="comt_bono" value="${cm_Detail.cm_no }"><br/>
							<input type="hidden" name="comt_id" value="${mem_id }"><br/>
							<input type="hidden" name="comt_nick" value="${mem_nick }"><br/>
							<textarea name="comt_content" cols="92" rows="3" style="border:1px solid; border-color:lightgray; "></textarea>
							<button type="submit" class="edit btn_100x36_wg text_h36" style="height:40px;">
							<span>댓글 쓰기</span>
							</button>
							</form>
							<div class="reply_area">
							<c:forEach items="${comt_List}" var="c">
								<div class="reply_box clear ">
									<div class="user_img clear">
										<span class="user">
											<img src="https://member.yanolja.com/member/picture?memberNo=30400875" width="38" height="38" alt>
											<em class="cover42"></em>
										</span>
									</div>
									<div class="text">
										<div class="user">
											<span class="id">${c.comt_nick }</span>
											<em>·</em>
											<span class="write_time">${c.comt_wdate }</span>
										</div>
										<div class="cnt">
											<pre>${c.comt_content }</pre>
										</div>
									</div>
									</div>
								</c:forEach>
								</div>
							</div>
							</div>
						</div>
						</div>
					</div>
				</div>
</body>
</html>