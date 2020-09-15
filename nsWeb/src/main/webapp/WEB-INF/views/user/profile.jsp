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
@media ( max-width : 900px) {
	#maindiv{
		margin-top:0%;
		margin-left:0%;
	}

}
#profileimg {
	width: 200px;
	height: 200px;
	border-radius: 70%;
}.overlay {
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
				<c:choose>
					<c:when test="${customer.profile_img == null || customer.profile_img == ''}">
						<img id="profileimg"  alt="" src="${pageContext.request.contextPath}/resources/images/index/human.png">
					</c:when>
					<c:otherwise>
						<img id="profileimg" alt="" src="/web/images/${customer.profile_img}">
					</c:otherwise>
				</c:choose>
				
			</div>
			<div style="float:left;margin-left:10%;width:500px;">
				<div style="font-size:35px;">
					<b>${customer.nick_name }(${customer.name })</b>
				</div><br><br>
				<div style="font-size:20px;">
					<b>게시물 ${postnum }</b>&nbsp;&nbsp;<b onclick="openfollower('${customer.email}')" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">팔로워 ${customer.follow_num}</b>&nbsp;&nbsp;<b onclick="openfollowing('${customer.email}')" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">팔로잉 ${customer.following_num}</b><br><br>
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
						&nbsp;&nbsp;<button style="font-size:20px;color:black;" class="btn btn-outline-secondary" onclick="gotoMessage('${customer.email}','${login_id }')">메세지</button>
					</c:if>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
		<div id="popup1" class="overlay" style="z-index:10;">
			<div class="popup" style="z-index:10;">
				<a class="close" href="#" onclick="closeContentPop()">&times;</a>
				<hr>
				<div class="content" id="unfw" onclick="" onmouseover="$(this).css('color','red')" onmouseout="$(this).css('color','black')">
				</div>
				<hr>
				<div class="content" onclick="" onmouseover="$(this).css('color','red')" onmouseout="$(this).css('color','black')">
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
				<div style="width:40%;float:left;height:700px;" >
					<div style="height:600px;overflow:scroll;" id="commentdiv">
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
					<div style="height:50px;">
						<img alt="" id="heart" src="${pageContext.request.contextPath}/resources/images/index/heart2.png" style="width:45px;height:45px;" onclick="">&nbsp;&nbsp;
						<img alt="" src="${pageContext.request.contextPath}/resources/images/dm.png" style="width:45px;height:45px;">&nbsp;&nbsp;
						<img alt="" src="${pageContext.request.contextPath}/resources/images/index/star.png" style="width:45px;height:45px;">
					</div>
					<div style="height:50px;">
					<form action="" id="opencomments_form">
						<input type="hidden" value="" name="post_seq_str" id="openSeq">
						<input type="hidden" value="${login_id}" name="comments_email">
						<input id="openComments" name="comment_content" type="text" style="width:70%;height:100%;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;font-size:20px;" placeholder="댓글달기..">
						<input id="openCBtn"type="button" onclick="insertCommnet_open($('#openComments'))" onmouseover="$(this).css('color','skyblue')" onmouseout="$(this).css('color','#00BFFF')" style="border:0;outline:0;background-color:white;color:#00BFFF;font-size:20px;" value="입력">
					</form>
				</div>
				</div>
				<div style="clear: both;"></div>
			</div>
		</div>
		<div id="popup3" class="overlay" style="z-index:10;">
			<div class="popup" id="followdiv" style="z-index:10;padding-top:2%;">
				<a class="close" href="#" onclick="closeFollowPop()">&times;</a>
			</div>
		</div>
		<br><br><hr>
		<div style="margin-left:40%;">
			<c:choose>
			<c:when test="${type == 'my' }">
				<div style="float:left;margin-right:100px;border-top:solid 1px;" id="board">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/board.png" style="width:50px;height:50px;" onclick="">			
				</div>
				<c:choose>
					<c:when test="${customer.email == login_id }">
					<div style="float:left;" id="save" onclick="location.href='profile.do?type=save'">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/index/star.png" style="width:50px;height:50px;" onclick="">
					</div>
					</c:when>
					<c:otherwise>
					<div style="float:left;" id="save" onclick="userProfile('${customer.email}','save')">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/index/star.png" style="width:50px;height:50px;">
					</div>
					</c:otherwise>
				</c:choose>	
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${customer.email == login_id }">
					<div style="float:left;margin-right:100px;" id="board" onclick="location.href='profile.do?type=my'">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/board.png" style="width:50px;height:50px;" onclick="">			
					</div>
					</c:when>
					<c:otherwise>
					<div style="float:left;margin-right:100px;" id="board" onclick="userProfile('${customer.email}','my')">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/board.png" style="width:50px;height:50px;" onclick="">			
					</div>
					</c:otherwise>
				</c:choose>

				<div style="float:left;border-top:solid 1px;" id="save">
					<img alt="" src="${pageContext.request.contextPath}/resources/images/index/star.png" style="width:50px;height:50px;" onclick="">
				</div>	
			</c:otherwise>
			</c:choose>
		</div>
		<div style="clear:both;"></div>
		<br><br>
		<div>
			<c:forEach items="${post }" var="post">
				<div style="width:32%;height:280px;float:left;margin-right:1%;margin-bottom:1%;" onmouseover="$(this).children().first().css('display','initial')" onmouseout="$(this).children().first().css('display','none')">
					<img src="${pageContext.request.contextPath}/resources/images/index/dot.png" style="width:32px;height:32px;position:absolute;z-index:2;margin-left:1%;display:none;margin-bottom:1%;" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)" onclick="openContentPop(${post.post_seq},'${post.post_uploader }','${login_id }')">
					<img src="/web/images/${post.imageList[0] }" style="width:100%;height:100%" onclick="openPost('${post.imageList[0]}','${customer.profile_img}','${customer.nick_name}','${post.post_content }','${post.post_uploader}',${post.post_seq})" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">
					<input type="hidden" id="likeStatus${post.post_seq }" value="${post.is_like }">			
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
	var openPost = function(image,profile,nick_name,content,uploader,seq){
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
		$("#openSeq").val(seq)
		if(Number($("#likeStatus"+seq).val()) == 0){
			$("#heart").attr("src","${pageContext.request.contextPath}/resources/images/index/heart2.png")
			$("#heart").attr("onclick","belike('${login_id}',"+seq+")")
		}else if(Number($("#likeStatus"+seq).val()) == 1){
			$("#heart").attr("src","${pageContext.request.contextPath}/resources/images/index/heart.png")
			$("#heart").attr("onclick","unlike('${login_id}',"+seq+")")
		}
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
				location.reload(true);
			}
		})
	}
	var openContentPop = function(seq,email,myid){
		$("popup1").css("visibility","visible");
		$("popup1").css("opacity","1");
		if(myid == email){
			$("#unfw").html("게시물 삭제")
			$("#unfw").attr("onclick","deletePost("+seq+")")
		}else{
			$("#unfw").html("게시물 신고")
			$("#unfw").attr("onclick",'blamePost("'+email+'","'+myid+'",'+seq+')')
		}
	}
	var closeContentPop = function(){
		$("popup1").css("visibility","hidden");
		$("popup1").css("opacity","0");
	}
	var blamePost = function(email,myid,seq){
		
	}
	var unlike = function(email,seq){
		$.ajax({
			type:"POST",
			url:"unlike.do",
			dataType:"text",
			data:{
				postlike_post_seq:seq,
				postlike_email:email
			},
			success:function(data){
				$("#heart").css('width',50).css('height',50).attr("src","${pageContext.request.contextPath}/resources/images/index/heart2.png").animate({width:45,height:45},500)
				$("#heart").attr("onclick","belike('"+email+"',"+seq+")")
				$("#likeStatus"+seq).val(0)
			},
			error:function(){
				alert("error")
			}
		})
	}
	var belike = function(email,seq){
		$.ajax({
			type:"POST",
			url:"belike.do",
			dataType:"text",
			data:{
				postlike_post_seq:seq,
				postlike_email:email
			},
			success:function(data){
				$("#heart").css('width',50).css('height',50).attr("src","${pageContext.request.contextPath}/resources/images/index/heart.png").animate({width:45,height:45},500)
				$("#heart").attr("onclick","unlike('"+email+"',"+seq+")")
				$("#likeStatus"+seq).val(1)
			},
			error:function(){
				alert("error")
			}
		})
	}
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
	var gotoMessage = function(user, my){
		var form = document.createElement("form");
		var input = new Array()
		var names = ["room_user","room_user2"]
		var values = [my,user]
        form.action = "messageRoom.do";
        form.method = "post";   
        for (var i = 0; i < 3; i++) {            
        	input[i] = document.createElement("input");
            input[i].setAttribute("type", "hidden");
            input[i].setAttribute('name', names[i]);
            input[i].setAttribute("value", values[i]);
            form.appendChild(input[i]);
        }
        document.body.appendChild(form);
		form.submit();
	}
	var userProfile = function(email,type){
		var form = document.createElement("form");
		var input = new Array()
		var names = ["email","type"]
		var values = [email,type]
        form.action = "userProfile.do";
        form.method = "post";   
        for (var i = 0; i < 2; i++) {            
        	input[i] = document.createElement("input");
            input[i].setAttribute("type", "hidden");
            input[i].setAttribute('name', names[i]);
            input[i].setAttribute("value", values[i]);
            form.appendChild(input[i]);
        }
        document.body.appendChild(form);
		form.submit();
	}
	var openfollower = function(email){
		$("#popup3").css("visibility","visible");
		$("#popup3").css("opacity","1");
		$.ajax({
			type:"POST",
			url:"getfollower.do",
			dataType:"json",
			data:{
				email:email
			},
			success:function(data){
				var getData = data;
				var type = 'my';
				for(var i=0;i<getData.length;i++){
					$("#followdiv").append("<div style='padding:5%;' onclick='userProfile("+'"'+getData[i].email+'"'+","+'"'+type+'"'+")' onmouseover='$(this).css("+'"'+"opacity"+'"'+",0.5)' onmouseout='$(this).css("+'"'+"opacity"+'"'+",1)'>"
					+"<div style='float:left'><img src='/web/images/"+getData[i].profile_img+"' style='width:64px;height:64px;border-radius:70%;'></div>"
					+"<div style='float:left;margin-left:5%;'><p>"+getData[i].name+"</p><br><p style='color:gray;'>"+getData[i].nick_name+"</p></div>"
					+"<div style='clear:both;'></div>"
					+"</div>"
					);
				}
			},
			error:function(){
				error
			}
		})
	}
	var openfollowing = function(email){
		$("#popup3").css("visibility","visible");
		$("#popup3").css("opacity","1");
		$.ajax({
			type:"POST",
			url:"getfollowing.do",
			dataType:"json",
			data:{
				email:email
			},
			success:function(data){
				var getData = data;
				var type = 'my';
				for(var i=0;i<getData.length;i++){
					$("#followdiv").append("<div style='padding:5%;' onclick='userProfile("+'"'+getData[i].email+'"'+","+'"'+type+'"'+")' onmouseover='$(this).css("+'"'+"opacity"+'"'+",0.5)' onmouseout='$(this).css("+'"'+"opacity"+'"'+",1)'>"
					+"<div style='float:left'><img src='/web/images/"+getData[i].profile_img+"' style='width:64px;height:64px;border-radius:70%;'></div>"
					+"<div style='float:left;margin-left:5%;'><p>"+getData[i].name+"</p><br><p style='color:gray;'>"+getData[i].nick_name+"</p></div>"
					+"<div style='clear:both;'></div>"
					+"</div>"
					);
				}
			},
			error:function(){
				error
			}
		})
	}
	var closeFollowPop = function(){
		$("#followdiv").empty();
		$("#followdiv").append('<a class="close" href="#" onclick="closeFollowPop()">&times;</a>');
		$("#popup3").css("visibility","hidden");
		$("#popup3").css("opacity","0");
	}

</script>
</html>