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
	width: 1000px;
	margin-top: 8%;
	margin-left: 28%;

}
@media ( max-width : 1500px){
	#imgdiv{
		display:none;
	}
	#maindiv{
		margin-left:0%;
		margin-top: 0%;
	}
}
</style>
</head>
<body style="background-color:#FAFAFA;">
	<c:if test="${createCheck == 'true'}">
	<script type="text/javascript">
		alert("회원가입이 완료되었습니다.")
	</script>
	</c:if>
	<div id="maindiv">
		<div id="imgdiv" style="float:left;width:40%;position:relative;">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/phone2.png" style="width:400px;height:700px;z-index:10;position:absolute;">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/index/busan.jpg" style="width:330px;height:600px;margin-left:40px;margin-top:20px;border-radius:25px;" id="phoneimg">		
		</div>
		<div id="logindiv" style="float:left;width:60%;">
			<div style="background:white;border:solid gray 1px;padding-left:20%;padding-right:20%;">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/logo.png" style="width:250px;height:200px;margin-left:10%;">
				<form action="loginSuccess.do" class="form-inline" id="loginForm" method="post">
					<input type="text" placeholder="email" class="form-control" id="email" name="email" style="width:350px;"><br>
					<input type="password" placeholder="password" class="form-control" id="password" name="password" style="width:350px;"><br><br><br><br>
					<input type="button" value="로그인"  class="btn btn-secondary" onclick="loginSubmit()" style="width:350px;">
				</form>
				<br><hr><br>
				<a style="margin-left:25%;" onclick="getTempPass()">비밀번호를 잊으셨나요?</a><br><br>
			</div>
			<div style="background:white;border:solid gray 1px;padding-left:28%;margin-top:5%;padding-top:8%;padding-bottom:8%;">
				<b style="font-size:20px;">계정이 없으신가요?</b>&nbsp;&nbsp;&nbsp;<a style="font-size:20px;color:skyblue;" href="signup.do">가입하기</a>
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
	var imgList = ["busan.jpg","dog.jpg","family.jpg","love.jpg"]
	var imgSrc = "${pageContext.request.contextPath}/resources/images/login/";
	var imgIndex = 0;
	$(function(){
		setInterval(function() {
			imgIndex +=1;
			if(imgIndex == imgList.length){
				imgIndex = 0;	
			}
			$("#phoneimg").css('opacity','0.5').stop().attr("src",imgSrc+imgList[imgIndex]).animate({opacity:1},500);
		}, 5000);

	})
	var loginSubmit = function(){
	     var email = document.getElementById("email").value;
	     var password = document.getElementById("password").value;
		 var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		 var passwordRegExp = /^[a-zA-z0-9]{8,16}$/;
		 if(!emailRegExp.test(email)){
			 alert("이메일 형식이 올바르지 않습니다.");
			 document.getElementById("email").value = "";
			 document.getElementById("email").focus();
			 return false;
		 }
		 if(password.length <8 || password.length>16){
			 alert("비밀번호는 영문 대소문자와 숫자로 8~16자리여야 합니다.")
			 document.getElementById("password").value="";
			 document.getElementById("password").focus();
			 return false;
		 }
		 $.ajax({
			 type:"POST",
			 url:"loginProcess.do",
			 dataType:"text",
			 data:$("#loginForm").serialize(),
			 success: function(data){
				 if(data == "success"){
					 alert("로그인  성공")
					 document.getElementById("loginForm").submit();
				 }else if(data == "idfail"){
					 alert("이메일주소가 일치하지 않습니다.")
				 }else if(data == "passfail"){
					 alert("비밀번호가 일치하지 않습니다.")
				 }else if(data == "statusfail"){
					 location.href='statusChange.do?email='+document.getElementById("email").value
				 }
			 },
			 error: function(){
				 alert("error");
			 }
		 })
		 
	}
	var getTempPass = function(){
		var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		var prom = prompt('이메일을 입력하세요', 'email@xxx.com');
		if(!emailRegExp.test(prom)){
			alert("이메일 형식이 잘못되었습니다.")
		}else{
			 $.ajax({
				 type:"POST",
				 url:"getTempPass.do",
				 dataType:"text",
				 data:{
					 email:prom
				 },
				 success:function(data){
					 if(data == "success"){
						 alert("임시 비밀번호가 발급되었습니다.")	 
					 }else{
						 alert("존재하지 않는 이메일입니다.")
					 }
					 
				 },
				 error:function(data){
					 alert("error")
				 }
			 });
		}

	}
</script>
</html>