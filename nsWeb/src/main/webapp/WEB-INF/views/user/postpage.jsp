<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#commentdiv::-webkit-scrollbar {
	width: 15px;
}

#commentdiv::-webkit-scrollbar-track {
	background-color: transparent;
}

#commentdiv::-webkit-scrollbar-thumb {
	border-radius: 5px;
	background-color: #bebebe;
}

#commentdiv::-webkit-scrollbar-button {
	width: 0;
	height: 0;
}
.post {
	margin: 70px auto;
	margin-bottom: 30%;
	background: #fff;
	width: 900px;
	position: relative;
	transition: all 5s ease-in-out;
}
</style>
</head>
<body style="background-color:#FAFAFA;">
	<header>
		<%@ include file="../element/header.jsp" %>
	</header>
		<div class="post" style="border: solid gray 1px;">
			<div>
			<div style="width:60%;float:left;height:700px;">
				<img alt="" src="getimg.do?img=${post.imageList[0]}" style="width:100%;height:100%;" id="postImg">
			</div>
			<div style="width:40%;float:left;height:700px;" >
				<div style="overflow:scroll;height:650px;" id="commentdiv">
					<div style="padding:20px;">
						<img id="openProfile" alt="" src="getimg.do?img=${post.profile_img }" style="width:50px;height:50px;border-radius: 70%;vertical-align:middle;">&nbsp;&nbsp;<b id="openNick_name" >${post.nick_name}</b>
					</div>
					<hr>
					<div style="padding:2%;margin-bottom:5%;">
						<div style="float:left;width:45%;">
							<img id="openProfile2" alt="" src="getimg.do?img=${post.profile_img }" style="width:50px;height:50px;border-radius: 70%;vertical-align:middle;">&nbsp;&nbsp;<b id="openNick_name2" >${post.nick_name}</b>
						</div><br>
						<div style="float:left;width:50%;word-break:break-all;">
							<b id="openContent">${post.post_content}</b>
						</div>
					</div>
					<br><br>
					<div style="clear:both;"></div>
					<div id="commentsub">
						<c:forEach items="${comments}" var="item">
							<div style='padding:2%;'>
								<div style='float:left;width:45%;margin-bottom:5%;'>
								<img src='getimg.do?img=${item.comments_profile }' style='width:50px;height:50px;border-radius:70%;vertical-align:middle;margin-right:10px;' >
								<b>${item.comments_nick_name}</b></div><br>
								<div style='float:left;width:50%;word-break:break-all;'><b>${item.comment_content }</b><br><br>
								<a style='color:gray;margin-right:20px;' onclick=''>신고</a><a style='color:gray;' onclick=''>답글달기</a></div>
								<div style='clear:both;'></div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div style="height:50px;">
				<form action="" id="opencomments_form">
					<input type="hidden" value="${post.post_seq }" name="post_seq_str" id="openSeq">
					<input type="hidden" value="${login_id}" name="comments_email">
					<input id="openComments" name="comment_content" type="text" style="width:70%;height:100%;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;font-size:20px;" placeholder="댓글달기..">
					<input id="openCBtn"type="button" onclick="insertCommnet_open($('#openComments'))" onmouseover="$(this).css('color','skyblue')" onmouseout="$(this).css('color','#00BFFF')" style="border:0;outline:0;background-color:white;color:#00BFFF;font-size:20px;" value="입력">
				</form>
				</div>
			</div>
			</div>
			<div style="clear: both;"></div>
		</div>
</body>
<script type="text/javascript">
var insertCommnet_open =function(target){
	if(target.val().length<1){
		alert("내용을 입력하세요")
	}else{
		$.ajax({
			type:"POST",
			url:"insertComment.do",
			dataType:"text",
			data:$("#opencomments_form").serialize(),
			success:function(data){
				location.reload(true);
				alert("댓글이 등록되었습니다.")
			},
			error:function(error){
				alert("error")
			}
		})
	}
}
</script>
</html>