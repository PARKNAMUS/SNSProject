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
#roomdiv{
	overflow:scroll;
}
#roomdiv::-webkit-scrollbar {
	width: 15px;
}

#roomdiv::-webkit-scrollbar-track {
	background-color: transparent;
}

#roomdiv::-webkit-scrollbar-thumb {
	border-radius: 5px;
	background-color: #bebebe;
}

#roomdiv::-webkit-scrollbar-button {
	width: 0;
	height: 0;
}
</style>
</head>
<body style="background-color:#FAFAFA;">
	<header>
		<%@ include file="../element/header.jsp"%>
	</header>
	
	<div id="maindiv">
		<div style="width:100%;box-shadow: 2px 2px 2px 2px gray;height:100px;padding:5%;">
		<h1 style="font-size:30px;margin-left:10%;margin-bottom:5%;">메세지</h1>
		</div>
		<div id="roomdiv">
		<c:forEach items="${room }" var="room">
		<div style="width:100%;padding-left:10%;padding-bottom:5%;border-bottom: solid gray 1px;margin-top:5%;" 
			onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)" onclick="getMessage(${room.room_seq},'${room.room_user }','${login_id }')">
			<div style="width:20%;float:left;">
				<c:choose>
					<c:when test="${room.user_img == null || room.user_img == '' }">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/index/human.png" style="width:90px;height:90px;border-radius:70%;vertical-align:middle;">
					</c:when>
					<c:otherwise>
						<img alt="" src="getimg.do?img=${room.user_img }" style="width:90px;height:90px;border-radius:70%;vertical-align:middle;">
					</c:otherwise>
				</c:choose>
				
				<br><br>
				<p style="font-size:20px;">${room.user_nick_name }</p>
			</div>
			<div style="width:50%;margin-left:5%;float:left;word-break:break-all;">
				<br><br>
				<p style="font-size:20px;color:gray;">
				<c:choose>
					<c:when test="${room.message == null || room.message == '' }">
						${room.user_nick_name}님과 채팅을 시작하세요!
					</c:when>
					<c:otherwise>
						${room.message }
					</c:otherwise>
				</c:choose>
				</p>
			</div>
			<div style="clear:both;"></div>
		</div>
		</c:forEach>
		</div>
	</div>
</body>
<script type="text/javascript">
	var getMessage = function(seq,user,my){
		var form = document.createElement("form");
		var input = new Array()
		var names = ["room_seq","room_user","room_user2"]
		var values = [seq,my,user]
        form.action = "messageRoomForNum.do";
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
</script>
</html>