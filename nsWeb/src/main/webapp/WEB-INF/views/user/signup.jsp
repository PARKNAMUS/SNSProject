<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	width: 600px;
	margin-top: 5%;
	margin-left: 35%;

}
</style>
</head>
<body style="background-color:#FAFAFA;">
	<div id="maindiv">
		<div style="background:white;border:solid gray 1px;padding-left:20%;padding-right:20%;">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/logo.png" style="width:250px;height:200px;margin-left:10%;">
			<p style="font-size:30px;color:gray;">친구들과 사진 및 동영상을 공유하려면 가입하세요!</p><br><br>
				<form action="signupSuccess.do" class="form-inline" id="signupForm">
					<input type="text" placeholder="email" id="email" class="form-control" style="width:350px;" name="email"><br><br>
					<input type="password" placeholder="password" id="password" class="form-control" style="width:350px;" name="password"><br><br>
					<input type="text" placeholder="name" id="name" class="form-control" style="width:350px;" name="name"><br><br>
					<input type="text" placeholder="nickname" id="nickname" class="form-control" style="width:350px;" name="nick_name"><br><br>
					<select class="form-control" style="width:350px;margin-bottom:10%; " name="gender">
						<option value="m">남자</option>
						<option value="f">여자</option>
					</select>
					<input type="button" value="회원가입"  onclick="submitForm()" class="btn btn-secondary" style="width:350px;margin-bottom:10%;">
				</form>
				<p style="margin-bottom:10%;">가입하면 Oracle의 약관, 데이터 정책 및 쿠키 정책에 동의하게 됩니다.</p>
		</div>
		<div style="background:white;border:solid gray 1px;padding-left:28%;margin-top:5%;padding-top:8%;padding-bottom:8%;">
			<b style="font-size:20px;">계정이 있으신가요?</b>&nbsp;&nbsp;&nbsp;<a style="font-size:20px;color:skyblue;" href="loginPage.do">로그인하기</a>
		</div>
	</div>
</body>
<script type="text/javascript">
	
	 var submitForm = function(){
		 var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		 var passwordRegExp = /^[a-zA-z0-9]{8,16}$/;
		 var nameRegExp = /^[a-zA-z가-힣]{2,12}$/;
		 var email = document.getElementById("email").value;
		 var password = document.getElementById("password").value;
		 var name = document.getElementById("name").value;
		 var nickname = document.getElementById("nickname").value;
		 
		 if(!emailRegExp.test(email)){
			 alert("이메일 형식이 올바르지 않습니다.");
			 document.getElementById("email").value = "";
			 document.getElementById("email").focus();
			 return false;
		 }
		 if(!passwordRegExp.test(password)){
			 alert("비밀번호는 영문 대소문자와 숫자로 8~16자리여야 합니다.")
			 document.getElementById("password").value="";
			 document.getElementById("password").focus();
			 return false;
		 }
		 if(!nameRegExp.test(name)){
			 alert("이름은 한글 또는 영문으로 2~12자리여야 합니다.")
			 document.getElementById("name").value="";
			 document.getElementById("name").focus();
			 return false;
		 }
		 if(document.getElementById("nickname").value.length<4){
			 alert("닉네임은 4글자 이상이어야 합니다.")
			 document.getElementById("nickname").value ="";
			 document.getElementById("nickname").focus();
			 return false;
		 }		 
		 $.ajax({
			 type:"POST",
			 url:"signupProcess.do",
			 dataType:"text",
			 data:{
				 email:document.getElementById("email").value
			 },
			 success:function(data){
				 if(data == "fail"){
					 alert("이미 등록된 이메일입니다.")
					 document.getElementById("email").value = "";
					 document.getElementById("email").focus();
				 }else{
					 var iden = prompt("인증번호를 입력해주세요");
					 if(iden == data){
						 document.getElementById("signupForm").submit();
					 }else{
						 alert("인증번호가 일치하지 않습니다.")
					 }
				 }
				 
				 
			 },
			 error: function(){
				 alert("error");
			 }
		 })
	 }
</script>
</html>