<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<style type="text/css">
#maindiv {
	width: 800px;
	margin-top: 2%;
	margin-left: 28%;
}

#storybox::-webkit-scrollbar {
	width: 10px;
}

#storybox::-webkit-scrollbar-thumb {
	background-color: #2f3542;
	border-radius: 10px;
}

#storybox::-webkit-scrollbar-track {
	background-color: grey;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}
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
@media ( max-width : 900px) {
	#maindiv {
		width: 700px;
		margin-left: 0%;
	}


}
@media (max-width : 1500px){
	#sidediv {display: none;}
	#bdiv{display: none;}
	#recommenddiv{display: none;}
}
.overlay {
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

.popup {
  margin: 70px auto;
  margin-top:25%;
  background: #fff;
  border-radius: 10px;
  width: 30%;
  position: relative;
  transition: all 5s ease-in-out;
}

.popup .close {
  position: absolute;
  top: 20px;
  right: 30px;
  transition: all 200ms;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
.popup .close:hover {
  color: #06D85F;
}
.content{
	font-size:20px;
	padding:20px;
}
#popup2{
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
.post{
  margin: 70px auto;
  margin-top:15%;
  background: #fff;
  width: 45%;
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
.post .close:hover {
  color: #06D85F;
}
</style>
<title>Insert title here</title>
</head>
<body style="background-color:#FAFAFA;">
	<header>
		<%@ include file="../element/header.jsp" %>
	</header>
	<div id="popup1" class="overlay">
		<div class="popup">
			<a class="close" href="#" onclick="closeContentPop()">&times;</a>
			<div class="content" style="color:red;">
				콘텐츠 신고
			</div>
			<hr>
			<div class="content">
				팔로우 취소
			</div>
			<hr>
			<div class="content">
				게시물로 이동
			</div>
		</div>
	</div>
	<div id="popup2">
		<div class="post" >
			<a class="close" href="#" onclick="closePost()">&times;</a>
			<div style="width:60%;float:left;height:700px;">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/index/busan.jpg" style="width:100%;height:100%;">
			</div>
			<div style="width:40%;float:left;height:700px;overflow:scroll;" id="commentdiv">
				<div style="" >
					<div style="padding:20px;">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/my1.jpg" style="width:50px;height:50px;border-radius: 70%;vertical-align:middle;">&nbsp;&nbsp;<b>hong_123</b>
					</div>
					<hr>
					<div style="padding:2%;margin-bottom:5%;">
						<div style="float:left;width:40%;">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/my1.jpg" style="width:50px;height:50px;border-radius: 70%;vertical-align:middle;">&nbsp;&nbsp;<b>hong_123</b>
						</div>
						<div style="float:left;width:50%;word-break:break-all;">
							<b>ㅎㄹㄴㅇㄹㅇㄴㄹㄴㅇㄹㄴdaasdsadasdadasdsasadadasdsdsasdasdsaㄹㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄹㅁㅁㅁㅁㅁㄴㄹ</b>
						</div>
					</div>
					<div style="clear:both;"></div>
					<div style="padding:2%;">
						<div style="float:left;width:40%;margin-bottom:5%;">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/my1.jpg" style="width:50px;height:50px;border-radius: 70%;vertical-align:middle;">&nbsp;&nbsp;<b>hong_123</b>
						</div>
						<div style="float:left;width:50%;word-break:break-all;">
							<b>ㅎㄹㄴㄹㅁㅁㅁㅁㅁㄴㄹ</b><br><br>
							<a style="color:gray;">신고</a>&nbsp;&nbsp;<a style="color:gray;">답글달기</a>
						</div>
						<div style="clear:both;"></div>
					</div>
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
	</div>
	<div id="sidediv" style="position:absolute;width:400px;margin-left:67%;margin-top:2%;padding:1%;">
		<div>
			<div style="float:left;">
				<img alt="" src="http://localhost:8080/web/images/${customer.profile_img}" style="width:64px;height:64px;border-radius: 30px 30px 30px 30px;" >
			</div>
			<div style="float:left;margin-left:10px;font-size:20px;">
				<b>${customer.nick_name }</b><br><br><b style="color:gray;">${customer.name }</b>
			</div>
		</div>
		
		<div style="clear:both;"></div>
		
		<div style="margin-top:5%;" id="recommenddiv">
			<b>회원님을 위한 추천</b><a style="margin-left:46%;" href="#">모두보기</a>
			<br><br>
			<div>
				<div style="float:left;">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/my1.jpg" style="width:50px;height:50px;border-radius: 70%;" >
				</div>
				<div style="float:left;margin-left:10px;font-size:16px;">
					<b>park_ns</b>
					<br><br><b style="color:gray;">회원님을 팔로우 합니다.</b>		
				</div>
				<div style="float:left;margin-left:90px;">
					<a>팔로우</a>
				</div>
			</div>
		</div>
		
		<div style="clear:both;"></div>
		
		<div style="margin-top:30px;color:gray;" id="bdiv">
			<a>소개</a> | <a>도움말</a> | <a>홍보 센터</a> | <a>API</a> | <a>채용</a> | <a>정보</a> | <a>개인정보</a>
			 | <a>처리방침</a> | <a>약관</a> | <a>위치</a> | <a>인기 계정</a> | 
			<a>해시태그</a> | <a>언어</a>
			<br><br>
			<b>© 2020 INSTAGRAM FROM FACEBOOK</b>
		</div>
	</div>
	<div id="maindiv">
		<div style="border: 1px solid gray;width:95%;background-color:white;padding:3%;overflow:scroll;" id="storybox">
			<div style="width:64px;height:64px;overflow:hidden;border-radius: 30px 30px 30px 30px;float:left;margin-right:5%;">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/my1.jpg" style="width:100%;height:100%">
			</div>
			<div style="width:64px;height:64px;overflow:hidden;border-radius: 30px 30px 30px 30px;float:left;margin-right:5%;">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/my1.jpg" style="width:100%;height:100%">
			</div>
			<div style="width:64px;height:64px;overflow:hidden;border-radius: 30px 30px 30px 30px;float:left;margin-right:5%;">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/my1.jpg" style="width:100%;height:100%">
			</div>
		</div>
		
		<div style="border: 1px solid gray;width:100%;background-color:white;margin-top:5%;margin-bottom:5%;">
			<div style="width:100%;margin-top:20px;border-bottom:1px solid gray;">
				&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="${pageContext.request.contextPath}/resources/images/my1.jpg" style="width:50px;height:50px;border-radius: 30px 30px 30px 30px;vertical-align:middle;" >
				&nbsp;&nbsp;<b style="font-size:20px;">park_ns</b>
				<img alt="" src="${pageContext.request.contextPath}/resources/images/index/dot.png" style="width:50px;height:50px;vertical-align:middle;margin-left:520px;" onclick="openContentPop()">
				<br><br>
			</div>
			<div style="width:100%;height:600px;">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/index/busan.jpg" style="width:100%;height:100%;">
			</div>
			<div style="width:100%;">
				<br>&nbsp;&nbsp;
				<img alt="" src="${pageContext.request.contextPath}/resources/images/index/heart2.png" style="width:45px;height:45px;">&nbsp;&nbsp;
				<img alt="" src="${pageContext.request.contextPath}/resources/images/dm.png" style="width:45px;height:45px;">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/index/star.png" style="width:45px;height:45px;margin-left:590px;">
			</div>
			<div style="width: 90%;margin-left:20px;">
				<br>
				<p style="font-weight:bold;">좋아요 100개</p>
			</div>
			<div style="margin-left:20px;width:90%;">
				<br>
				<b style="font-weight:bold;">user</b>&nbsp;<b>comments</b><br><br>
				<b style="font-weight:bold;">user2</b>&nbsp;<b>comments2</b><br><br>
				<b style="font-weight:bold;">user3</b>&nbsp;<b>comments3</b><br><br>
				<a style="" onclick="openPost()">댓글 20개 모두 보기</a><br><br>
				<p style="color:gray;">2020/09/01</p>
			</div><hr>
			<div style="width:100%;padding:2%;">
				<form action="">
					<input id="searchbox" type="text" style="width:85%;height:100%;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;font-size:25px;" placeholder="댓글달기..">
					<input type="submit" style="border:0;outline:0;background-color:white;color:skyblue;font-size:25px;" value="입력">
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var openContentPop = function(){
		$(".overlay").css("visibility","visible");
		$(".overlay").css("opacity","1");
	}
	var closeContentPop = function(){
		$(".overlay").css("visibility","hidden");
		$(".overlay").css("opacity","0");
	}
	var openPost = function(){
		$("#popup2").css("visibility","visible");
		$("#popup2").css("opacity","1");
	}
	var closePost = function(){
		$("#popup2").css("visibility","hidden");
		$("#popup2").css("opacity","0");
	}
</script>
</html>