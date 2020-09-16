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
	border:solid gray 1px;
	height:900px;
}
@media ( max-width : 900px) {
	#maindiv{
		margin-top:0%;
		margin-left:0%;
	}

}
#messagediv::-webkit-scrollbar {
	width: 15px;
}

#messagediv::-webkit-scrollbar-track {
	background-color: transparent;
}

#messagediv::-webkit-scrollbar-thumb {
	border-radius: 5px;
	background-color: #bebebe;
}

#messagediv::-webkit-scrollbar-button {
	width: 0;
	height: 0;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../element/header.jsp" %>
	</header>
	<div id="maindiv">
		<div style="width:100%;height:150px;box-shadow: 2px 2px 2px 2px gray;padding:3%;" onclick="userProfile('${user.email}','my')" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">
			<c:choose>
				<c:when test="${user.profile_img == null ||user.profile_img == '' }">
					<img src="${pageContext.request.contextPath}/resources/images/index/human.png" style="width:90px;height:90px;border-radius:70%;margin-right:5%;vertical-align:middle;">
				</c:when>
				<c:otherwise>
					<img src="getimg.do?img=${user.profile_img }" style="width:90px;height:90px;border-radius:70%;margin-right:5%;vertical-align:middle;">
				</c:otherwise>
			</c:choose>
			<b style="font-size:30px;">${user.nick_name}</b>
		</div>
		<div style="width:100%;height:670px;overflow:scroll;padding-bottom:5%;" id="messagediv">
			<c:if test="${message != null }">
			<c:forEach begin="0" end="${message.size()-1}" var="i">
			<c:choose>
				<c:when test="${i == 0 }">
					<div style="width:100%;margin-top:5%;" >
						<p style="font-size:15px;color:gray;margin-left:40%;font-weight:bold;">${message.get(i).message_regdate }</p>
					</div>
					<c:if test="${message.get(i).senduser == login_id }">
							<div id="messag${i}" style="word-break:break-all;margin-right:5%;font-size:20px;border-radius:10%;box-shadow: 2px 2px 2px 2px gray;padding:2%;display:inline-block;max-width:40%;float:right;margin-top:5%;">
								<b>${message.get(i).message_content}</b>
							</div>
							<div style="clear: both;"></div>	
					</c:if>
					<c:if test="${message.get(i).senduser != login_id }">
						<div style="width:100%;margin-top:5%;" id="messag${i}">
							<div style="float:left;margin-left:5%;">
							<img src="getimg.do?img=${user.profile_img }" style="width:90px;height:90px;border-radius:70%;margin-right:5%">
							</div>
							<div style="word-break:break-all;margin-left:5%;font-size:20px;border-radius:10%;box-shadow: 2px 2px 2px 2px gray;padding:2%;display:inline-block;max-width:40%;float:left;margin-top:5%;">
								<b>${message.get(i).message_content}</b>
							</div>
							<div style="clear: both;"></div>								
						</div>
					</c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${message.get(i-1).message_regdate != message.get(i).message_regdate  }">
						<div style="width:100%;margin-top:5%;" >
							<p style="font-size:15px;color:gray;margin-left:40%;font-weight:bold;">${message.get(i).message_regdate }</p>
						</div>
					</c:if>
					<c:choose>
						<c:when test="${message.get(i-1).senduser == login_id }">
							<div id="messag${i}" style="word-break:break-all;margin-top:5%;;margin-right:5%;font-size:20px;border-radius:10%;box-shadow: 2px 2px 2px 2px gray;padding:2%;display:inline-block;max-width:40%;float:right;">
								<b>${message.get(i).message_content}</b>
							</div>
							<div style="clear: both;"></div>	
						</c:when>
						<c:otherwise>
							<div style="width:width:100%;margin-top:5%;" id="messag${i}" >
								<div style="float:left;margin-left:5%;">
								<img src="getimg.do?img=${user.profile_img }" style="width:90px;height:90px;border-radius:70%;margin-right:5%">
								</div>
								<div style="word-break:break-all;margin-left:5%;font-size:20px;border-radius:10%;box-shadow: 2px 2px 2px 2px gray;padding:2%;display:inline-block;max-width:40%;float:left;margin-top:5%;">
									<b>${message.get(i).message_content}</b>
								</div>
								<div style="clear: both;"></div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			</c:forEach>
			</c:if>
		</div>
			<div style="width:100%;padding:2%;height:100px;">
				<form action="" id="">
					<input type="hidden" value="${login_id }" name="comments_email">
					<input id="content" name="comment_content" type="text" style="width:85%;height:100%;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;font-size:25px;" placeholder="메세지">
					<input type="button" onclick="sendMsg('${login_id}','${user.email }',${roomNum})" onmouseover="$(this).css('color','skyblue')" onmouseout="$(this).css('color','#00BFFF')" style="border:0;outline:0;background-color:white;color:#00BFFF;font-size:25px;" value="입력">
				</form>
			</div>
	</div>
</body>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript">
	var ws;
	var code = 0;
	$(function(){
		$("#messagediv").animate({
			scrollTop:$("#messag"+${message.size()-1}).offset().top,
			duration:400});
	})
	
	$(function(){
		connect()
		ws.onclose = function(){
			console.log("close ws")
		}
		ws.onerror = function(){
			console.log("error ws")
		}
	})
	
	var connect = function(){
	    var url = window.location.host;//웹브라우저의 주소창의 포트까지 가져옴
	    var pathname = window.location.pathname; /* '/'부터 오른쪽에 있는 모든 경로*/
	    var appCtx = pathname.substring(0, pathname.indexOf("/",2));
	    var root = url+appCtx;
		ws = new WebSocket("ws://"+root+"/ws")
		var msg = {
			regist:"y",
			senduser:"${login_id}"
		}
		
		ws.onopen = function(){
			console.log("open ws")
			ws.send(JSON.stringify(msg));
		}
		ws.onmessage = function(e){
			var data = e;
			var img;
			if("${user.profile_img }" == null ||"${user.profile_img }" == ""){
				img = "${pageContext.request.contextPath}/resources/images/index/human.png";
			}else{
				img = "getimg.do?img=${user.profile_img}"
			}
			$("#messagediv").append('<div id="'+(e.data+code)+'" style="margin-top:5%;width:width:100%;">'
			+'<div style="float:left;margin-left:5%;"><img src="'+img+'" style="width:90px;height:90px;border-radius:70%;margin-right:5%"></div>'
			+'<div style="word-break:break-all;margin-left:5%;font-size:20px;border-radius:10%;box-shadow: 2px 2px 2px 2px gray;padding:2%;display:inline-block;max-width:40%;float:left;margin-top:5%;">'
			+'<b>'+e.data+'</b>'
			+'</div>'
			+'<div style="clear: both;"></div>'							
		+'</div>')
		$("#messagediv").animate({
			scrollTop:$("#"+e.data+code).offset().top,
			duration:400});
			code = code+1;
		
		}
	}
	var sendMsg = function(send,get,seq){
		$.ajax({
			type:"POST",
			url:"addMessage.do",
			dataType:"text",
			data:{
				senduser:send,
				getuser:get,
				message_content:$("#content").val(),
				message_room_seq:seq,
			},
			success:function(data){
				
			},
			error:function(){
				console.log("error")
			}
		})
		var msg = {
			senduser:send,
			getuser:get,
			message_content:$("#content").val(),
			message_room_seq:seq,
			regist:'n'
		}
		ws.send(JSON.stringify(msg));
		var val = $("#content").val()
		$("#messagediv").append('<div id="'+(val+code)+'" style="word-break:break-all;margin-top:5%;margin-right:5%;font-size:20px;border-radius:10%;box-shadow: 2px 2px 2px 2px gray;padding:2%;display:inline-block;max-width:40%;float:right;">'
				+'<b>'+$("#content").val()+'</b>'
				+'</div><div style="clear:both;"></div>')
		
		$("#messagediv").animate({
			scrollTop:$("#"+val+code).offset().top,
			duration:400});
		document.getElementById("content").value = "";
		code = code+1;
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
</script>
</html>