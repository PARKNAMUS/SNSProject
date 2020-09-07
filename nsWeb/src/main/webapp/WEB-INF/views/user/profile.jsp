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
</style>
</head>
<body style="background-color:#FAFAFA;">
	<header>
		<%@ include file="../element/header.jsp" %>
	</header>
	<div id="maindiv">
		<div style="width:100%;"> 
			<div style="float:left;">
				<img id="profileimg" alt="" src="http://localhost:8080/web/images/${customer.profile_img}">
			</div>
			<div style="float:left;margin-left:10%;width:500px;">
				<div style="font-size:35px;">
					<b>${customer.nick_name }(${customer.name })</b>
				</div><br><br>
				<div style="font-size:20px;">
					<b>게시물 1</b>&nbsp;&nbsp;<b>팔로워 100</b>&nbsp;&nbsp;<b>팔로잉 120</b><br><br>
					<b>${customer.introduce }</b>
				</div><br><br>
				<div>
					<c:if test="${login_id == customer.email }">
						<button style="font-size:20px;color:black;" class="btn btn-outline-secondary" onclick="location.href='profileset.do'">프로필 편집</button>&nbsp;&nbsp;<button style="font-size:20px;color:black;" class="btn btn-outline-secondary">게시물 업로드</button>
					</c:if>
					<c:if test="${login_id != customer.email }">
						<button style="font-size:20px;color:black;" class="btn btn-outline-secondary" onclick="">팔로우</button>
					</c:if>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
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
			<div style="width:32%;height:280px;float:left;margin-right:1%;margin-bottom:1%;">
				<img src="${pageContext.request.contextPath}/resources/images/index/busan.jpg" style="width:100%;height:100%">			
			</div>
			<div style="width:32%;height:280px;float:left;margin-right:1%;margin-bottom:1%;">
				<img src="${pageContext.request.contextPath}/resources/images/index/busan.jpg" style="width:100%;height:100%">			
			</div>
			<div style="width:32%;height:280px;float:left;margin-right:1%;margin-bottom:1%;">
				<img src="${pageContext.request.contextPath}/resources/images/index/busan.jpg" style="width:100%;height:100%">			
			</div>
			<div style="width:32%;height:280px;float:left;margin-right:1%;margin-bottom:1%;">
				<img src="${pageContext.request.contextPath}/resources/images/index/busan.jpg" style="width:100%;height:100%">			
			</div>
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
</script>
</html>