<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1" >
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
		width: 650px;
		margin-left: 0%;
	}
}

@media ( max-width : 1500px) {
	#sidediv {
		display: none;
	}
	#bdiv {
		display: none;
	}
	#recommenddiv {
		display: none;
	}

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
	margin-top: 25%;
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

.content {
	font-size: 20px;
	padding: 20px;
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
@media ( max-width : 900px) {
	.post{
		width: 650px;
	}
}
.post {
	margin: 70px auto;
	margin-bottom: 30%;
	background: #fff;
	width: 900px;
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

.tri1 {
	display: none;
	position: absolute;
	z-index: 2;
	width: 32px;
	height: 32px;
	opacity: 0.5;
	margin-top: 300px;
}

.tri2 {
	position: absolute;
	z-index: 2;
	width: 32px;
	height: 32px;
	opacity: 0.5;
	margin-top: 300px;
	margin-left: 760px;
}
@media ( max-width : 900px) {
	.tri2 {
			margin-left:630px;
	}
}
</style>
<title>Insert title here</title>
</head>
<body style="background-color:#FAFAFA;">
	<header>
		<%@ include file="../element/header.jsp" %>
	</header>
	<div id="popup1" class="overlay" style="z-index:10;">
		<div class="popup" style="z-index:10;">
			<a class="close" href="#" onclick="closeContentPop()">&times;</a>
			<div class="content" style="color:red;" onclick="blameContent(document.getElementById('contentEmail'))">
				콘텐츠 신고<input type="hidden" value="" id="contentEmail" >
			</div>
			<hr>
			<div class="content" id="unfw" onclick="">
				팔로우 취소
			</div>
			<hr>
			<div class="content" onclick="">
				게시물로 이동<input type="hidden" value="" id="contentSeq">
			</div>
		</div>
	</div>
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
	<div id="sidediv" style="position:absolute;width:400px;margin-left:75%;margin-top:2%;padding:1%;">
		<div>
			<div style="float:left;">
				<img alt="" src="/web/images/${customer.profile_img}" style="width:64px;height:64px;border-radius: 30px 30px 30px 30px;" >
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
		
		<c:forEach items="${post}" var="post" varStatus="i">
		<div style="border: 1px solid gray;width:100%;background-color:white;margin-top:5%;margin-bottom:5%;">
			<div style="width:100%;margin-top:20px;border-bottom:1px solid gray;">
				&nbsp;&nbsp;&nbsp;&nbsp;<img alt="" src="/web/images/${post.profile_img }" style="width:50px;height:50px;border-radius: 30px 30px 30px 30px;vertical-align:middle;" >
				&nbsp;&nbsp;<b style="font-size:20px;" onclick="userProfile('${post.post_uploader}')" onmouseover="$(this).css('color','gray')" onmouseout="$(this).css('color','black')" >${post.nick_name }</b>
				<img alt="" src="${pageContext.request.contextPath}/resources/images/index/dot.png" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)" style="width:50px;height:50px;vertical-align:middle;margin-left:520px;" onclick="openContentPop(${post.post_seq},'${post.post_uploader}','${login_id}')">
				<br><br>
			</div>
			<div style="width:100%;height:600px;">
				<input type="hidden" value="0" id="imageIndex${i.index}">
				<img id="ltri${i.index}" onmouseover="$(this).css('opacity',1)" onmouseout="$(this).css('opacity',0.5)" class="tri1" src="${pageContext.request.contextPath}/resources/images/tri.png" onclick="beforeImage(document.getElementById('imageIndex${i.index}'),${i.index},${post.post_seq })">
				<c:if test="${ fn:length(post.imageList) > 1 }">
					<img id="rtri${i.index}" onmouseover="$(this).css('opacity',1)" onmouseout="$(this).css('opacity',0.5)" class="tri2"  src="${pageContext.request.contextPath}/resources/images/tri2.png"  onclick="changeImage(document.getElementById('imageIndex${i.index}'),${i.index},${post.post_seq })">
				</c:if>
				<img alt="" src="/web/images/${post.imageList[0]}" style="width:100%;height:100%;" id="postImg${i.index}">
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
			<div style="width: 90%;margin-left:20px;">
				<br>
				<p style=""><strong style="font-weight:bold;">${post.nick_name}</strong>&nbsp;&nbsp;${post.post_content }</p>
			</div>
			<div style="margin-left:20px;width:90%;">
				<br>
				<a style="" onclick="openPost('${post.profile_img}',
				'${post.nick_name}','${post.post_content}',${post.post_seq},
				'${post.imageList[0]}')" onmouseover="$(this).css('color','skyblue')" onmouseout="$(this).css('color','black')" >댓글 ${post.comments_num }개 모두 보기</a><br><br>
				<p style="color:gray;">${post.post_regdate}</p>
			</div><hr>
			<div style="width:100%;padding:2%;">
				<form action="" id="comments_form${i.index }">
					<input type="hidden" value="${post.post_seq }" name="post_seq_str">
					<input type="hidden" value="${login_id }" name="comments_email">
					<input id="comment_content${i.index}" name="comment_content" type="text" style="width:85%;height:100%;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;font-size:25px;" placeholder="댓글달기..">
					<input type="button" onclick="insertComment(${i.index})" onmouseover="$(this).css('color','skyblue')" onmouseout="$(this).css('color','#00BFFF')" style="border:0;outline:0;background-color:white;color:#00BFFF;font-size:25px;" value="입력">
				</form>
			</div>
		</div>
		</c:forEach>
		
	</div>
</body>
<script type="text/javascript">
	var openContentPop = function(seq,email,myid){
		document.getElementById("contentEmail").value = email
		document.getElementById("contentSeq").value = seq
		$(".overlay").css("visibility","visible");
		$(".overlay").css("opacity","1");
		if(myid == email){
			$("#unfw").html("게시물 삭제")
			$("#unfw").attr("onclick","deletePost("+seq+")")
		}else{
			$("#unfw").html("팔로우 취소")
			$("#unfw").attr("onclick",'unfollow("'+email+'","'+myid+'")')
		}
	}
	var deletePost = function(target){
		var result = confirm("정말로 삭제하시겠습니까?")
		if(result){
			$.ajax({
				type:"POST",
				url:"deletePost.do",
				dataType:"text",
				data:{
					post_seq:target
				},
				success:function(data){
					location.reload(true)
				},
				error:function(){
					alert("error")
				}
			})
		}
	}
	var closeContentPop = function(){
		$(".overlay").css("visibility","hidden");
		$(".overlay").css("opacity","0");
	}
	var openPost = function(profileImg,nick_name,content,seq,image){
		$("#postImg").attr("src","/web/images/"+image)
		$("#openProfile").attr("src","/web/images/"+profileImg)
		$("#openNick_name").text(nick_name)
		$("#openProfile2").attr("src","/web/images/"+profileImg)
		$("#openNick_name2").text(nick_name)
		$("#openContent").text(content)
		$("#popup2").css("visibility","visible");
		$("#popup2").css("opacity","1");
		$("#commentsub").empty();
		$.ajax({
			type:"POST",
			url:"getComments.do",
			dataType:"json",
			data:{
				post_seq:seq
			},
			success:function(data){
				if(data != "none"){
					var getData = data
					if(data.length >0){
						for(var i=0;i<getData.length;i++){
							var html = "<div style='padding:2%;'>"
							+"<div style='float:left;width:40%;margin-bottom:5%;'>"
							+"<img src='/web/images/" +getData[i].comments_profile+ "' style='width:50px;height:50px;border-radius:70%;vertical-align:middle;margin-right:20px;' >"
							+"<b>"+getData[i].comments_nick_name+"</b></div><br>"
							+"<div style='float:left;width:50%;word-break:break-all;'><b>"+getData[i].comment_content+"</b><br><br>"
							+"<a style='color:gray;margin-right:20px;' onclick=''>신고</a><a style='color:gray;' onclick=''>답글달기</a></div>"
							+"<div style='clear:both;'></div></div>";
							$("#commentsub").append(html)
						}
					}
				}
			},
			error:function(){
				alert("error")
			}
		})
	}
	var closePost = function(){
		$("#popup2").css("visibility","hidden");
		$("#popup2").css("opacity","0");
	}
	var changeImage = function(index,img,post_seq){
		var inx = Number(index.value);
		var images;
		inx += 1;
		index.value = inx;
		$.ajax({
			 type:"POST",
			 url:"getImage.do",
			 dataType:"text",
			 data:{
				 post_seq:post_seq
			 },
			 success:function(data){
				 images = data.split(',');
					$("#ltri"+img).css("display","initial")
					$("#postImg"+img).css('opacity','0.5').stop().attr("src", "/web/images/"+images[inx]).animate({opacity:1},500);
					if(images.length-1 == inx){
						$("#rtri"+img).css("display","none")
					}
			 },
			 error:function(){
				 alert("error")
			 }
		})

	}
	var beforeImage = function(index,img,post_seq){
		var inx = Number(index.value);
		var images;
		inx -=1;
		index.value = inx;
		$.ajax({
			 type:"POST",
			 url:"getImage.do",
			 dataType:"text",
			 data:{
				 post_seq:post_seq
			 },
			 success:function(data){
				 images = data.split(',');
					$("#rtri"+img).css("display","initial")
					$("#postImg"+img).css('opacity','0.5').stop().attr("src", "/web/images/"+images[inx]).animate({opacity:1},500);
					if(inx == 0){
						$("#ltri"+img).css("display","none")
					}
			 },
			 error:function(){
				 alert("error")
			 }
		})
	}
	var blameContent = function(target){
		alert(target.value)
	}
	var unfollow = function(following,follower){
		if(following != follower){
			$.ajax({
				type:"POST",
				url:"unfollow.do",
				dataType:"text",
				data:{
					following:following,
					follower:follower
				},
				success:function(data){
					location.reload(true)
				},
				error:function(){
					alert("error")
				}
			})
			
		}else{
			alert("자신의 계정은 언팔로우할 수 없습니다.")
		}
	}
	var insertComment = function(index){
		if(document.getElementById('comment_content'+index).value.length < 1){
			alert("내용을 입력하세요")
		}else{
			$.ajax({
				type:"POST",
				url:"insertComment.do",
				dataType:"text",
				data:$("#comments_form"+index).serialize(),
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