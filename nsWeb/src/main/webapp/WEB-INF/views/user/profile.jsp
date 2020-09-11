<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#maindiv {
	width: 800px;
	margin-top: 2%;
	margin-left: 28%;
}

#profileimg {
	width: 200px;
	height: 200px;
	border-radius: 70%;
}
#popup2 {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.7);
	transition: opacity 500ms;
	visibility: hidden;
	opacity: 0;
}

.post {
	margin: 70px auto;
	margin-bottom: 30%;
	background: #fff;
	width:900px;
	position: relative;
	transition: all 5s ease-in-out;
}

.post .close {
	position: absolute;
	top: 20px;
	right: 30px;
	transition: all 200ms;
	font-size: 30px;
	font-weight: bold;
	text-decoration: none;
	color: #333;
}
#delpost{
	display: none;
}
</style>
</head>
<body style="background-color:#FAFAFA;">
	<header>
		<%@ include file="../element/header.jsp" %>
	</header>
	<div id="maindiv">
		<div style="width:100%;"> 
			<div style="float:left;">
				<img id="profileimg" alt="" src="/web/images/${customer.profile_img}">
			</div>
			<div style="float:left;margin-left:10%;width:500px;">
				<div style="font-size:35px;">
					<b>${customer.nick_name }(${customer.name })</b>
				</div><br><br>
				<div style="font-size:20px;">
					<b>게시물 ${post.size() }</b>&nbsp;&nbsp;<b>팔로워 100</b>&nbsp;&nbsp;<b>팔로잉 120</b><br><br>
					<b>${customer.introduce }</b>
				</div><br><br>
				<div>
					<c:if test="${login_id == customer.email }">
						<button style="font-size:20px;color:black;" class="btn btn-outline-secondary" onclick="location.href='profileset.do'">프로필 편집</button>&nbsp;&nbsp;<button style="font-size:20px;color:black;" class="btn btn-outline-secondary" onclick="location.href='uploadPage.do'">게시물 업로드</button>
					</c:if>
					<c:if test="${login_id != customer.email }">
						<c:if test="${customer.followStatus == 0 }">
							<button style="font-size:20px;color:black;" class="btn btn-outline-secondary" onclick="follow('${customer.email}')" id="fbtn">팔로우</button>
						</c:if>
						<c:if test="${customer.followStatus == 1 }">
							<button style="font-size:20px;color:black;" class="btn btn-secondary" onclick="unfollow('${customer.email}')" id="fbtn">팔로잉</button>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
		<div id="popup2" style="z-index:10;">
			<div class="post" style="z-index:10;">
				<a class="close" href="#" onclick="closePost()">&times;</a>
				<div style="width:60%;float:left;height:700px;">
					<img alt="" src="" style="width:100%;height:100%;" id="postImg">
				</div>
				<div style="width:40%;float:left;height:700px;overflow:scroll;" id="commentdiv">
					<div style="" >
						<div style="padding:20px;">
							<img id="openProfile" alt="" src="" style="width:50px;height:50px;border-radius: 70%;vertical-align:middle;">&nbsp;&nbsp;<b id="openNick_name" ></b>
							
						</div>
						<p onclick="" id="delpost" onclick="" style="font-size:10px;color:gray;margin-left:20px;" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">게시물 삭제</p>
						<hr>
						<div style="padding:2%;margin-bottom:5%;">
							<div style="float:left;width:40%;">
								<img id="openProfile2" alt="" src="" style="width:50px;height:50px;border-radius: 70%;vertical-align:middle;">&nbsp;&nbsp;<b id="openNick_name2" ></b>
							</div><br>
							<div style="float:left;width:50%;word-break:break-all;">
								<b id="openContent"></b>
							</div>
						</div>
						<br><br>
						<div style="clear:both;"></div>
						<div id="commentsub"></div>
					</div>
				</div>
				<div style="clear: both;"></div>
			</div>
		</div>
		<br><br><hr>
		<div style="margin-left:40%;">
			<div style="float:left;margin-right:100px;border-top:solid;" id="board">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/board.png" style="width:50px;height:50px;" onclick="">			
			</div>
			<div style="float:left;" id="save">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/index/star.png" style="width:50px;height:50px;" onclick="">
			</div>	
		</div>
		<div style="clear:both;"></div>
		<br><br>
		<div>
			<c:forEach items="${post }" var="post">
				<div style="width:32%;height:280px;float:left;margin-right:1%;margin-bottom:1%;" >
					<img src="/web/images/${post.imageList[0] }" style="width:100%;height:100%" onclick="openContentPop('${post.imageList[0]}','${customer.profile_img}','${customer.nick_name}','${post.post_content }','${post.post_uploader}',${post.post_seq})" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">			
				</div>
			</c:forEach>
		</div>
		<div style="clear:both;"></div>
		<div style="margin-top:20%;margin-bottom:10%;">
			<a>소개</a>&nbsp;&nbsp;&nbsp;<a>도움말</a>&nbsp;&nbsp;&nbsp;<a>홍보 센터</a>&nbsp;&nbsp;&nbsp;<a>API</a>&nbsp;&nbsp;&nbsp;<a>채용</a>&nbsp;&nbsp;&nbsp;<a>정보</a>&nbsp;&nbsp;&nbsp;<a>개인정보</a>
			 &nbsp;&nbsp;&nbsp;<a>처리방침</a>&nbsp;&nbsp;&nbsp;<a>약관</a>&nbsp;&nbsp;&nbsp;<a>위치</a>&nbsp;&nbsp;&nbsp;<a>인기 계정</a>&nbsp;&nbsp;&nbsp; 
			<br><br>
			<b>© 2020 INSTAGRAM FROM FACEBOOK</b>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#board").click(function(){
			$("#board").css("border-top","solid");
			$("#save").css("border-top","none");
		}),
		$("#save").click(function(){
			$("#save").css("border-top","solid");
			$("#board").css("border-top","none");			
		})
	})
	
	var follow = function(email){
		$.ajax({
			 type:"POST",
			 url:"follow.do",
			 dataType:"text",
			 data:{
				 following:email
			 },
			 success:function(data){
				 location.reload(true);
			 },
			 error:function(error){
				 
			 }
		})
	}
	var unfollow = function(email){
		$.ajax({
			 type:"POST",
			 url:"unfollow.do",
			 dataType:"text",
			 data:{
				 following:email
			 },
			 success:function(data){
				 location.reload(true);
			 },
			 error:function(error){
				 
			 }
		})
	}
	var openContentPop = function(image,profile,nick_name,content,uploader,seq){
		$("#postImg").attr("src","/web/images/"+image)
		$("#openNick_name").html(nick_name)
		$("#openProfile").attr("src","/web/images/"+profile)
		$("#openNick_name2").html(nick_name)
		$("#openProfile2").attr("src","/web/images/"+profile)
		$("#openContent").html(content)
		$("#popup2").css("visibility","visible");
		$("#popup2").css("opacity","1");
		$("#delpost").css("display","initial");
		$("#delpost").attr("onclick","deletePost("+seq+")")
	}
	var closePost = function(){
		$("#popup2").css("visibility","hidden");
		$("#popup2").css("opacity","0");
	}
	var deletePost = function(seq){
		$.ajax({
			type:"POST",
			url:"deletePost.do",
			dataType:"text",
			data:{
				post_seq:seq	
			},
			success:function(data){
				closePost();
				location.reload(true);
			}
		})
	}
</script>
</html>