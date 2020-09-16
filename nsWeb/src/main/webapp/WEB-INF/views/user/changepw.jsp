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
	width: 1000px;
	margin-top: 2%;
	margin-left: 28%;
	
}

</style>
</head>
<body style="background-color:#FAFAFA;">
	<header>
		<%@ include file="../element/header.jsp" %>
	</header>

	<div id="maindiv">
		<div style="float:left;font-size:25px;width:300px;border:solid gray 1px;height:900px;">
			<div style="padding:10%;padding-right:20%;"><a href="profileset.do">프로필 편집</a></div>
			<div style="padding:10%;padding-right:20%;border-left:solid"><a href="changePw.do">비밀번호 변경</a></div>
			<div style="padding:10%;padding-right:20%;"><a href="invalAccount.do">계정 비활성화</a></div>
		</div>
		<div style="float:left;width:700px;height:900px;border:solid gray 1px;">
			<div style="float:left;width:160px;text-align:right;font-size:25px;padding-top:50px;font-weight: bold;">
				<c:choose>
					<c:when test="${customer.profile_img == null || customer.profile_img == ''}">
						<div><img id="profileimg" alt="" src="${pageContext.request.contextPath}/resources/images/index/human.png" style="width:64px;height:64px;border-radius:70%;"></div>
					</c:when>
					<c:otherwise>
						<div><img id="profileimg" alt="" src="getimg.do?img=${customer.profile_img }" style="width:64px;height:64px;border-radius:70%;"></div>				
					</c:otherwise>
				</c:choose>
				<br><br>
				<div style="margin-bottom:50px;"><b>이전 비밀번호</b></div>
				<div style="margin-bottom:50px;"><b>새 비밀번호</b></div>
				<div style="margin-bottom:83px;"><b>새 비밀번호 확인</b></div>
			</div>
			<div style="float:left;width:450px;margin-left:80px;padding-top:50px;">
				<div>
					<p style="font-size:30px;">${customer.nick_name }</p><br>
					<a style="font-size:20px;color:skyblue;">프로필 이미지 변경</a>
				</div><br><br><br>
				<div style="width:400px;">
					<form action="">
						<input type="password" class="form-control" style="margin-bottom:41px;" name="oldpw" id="oldpw">
						<input type="password" class="form-control" style="margin-bottom:41px;" name="newpw" id="newpw">
						<input type="password" class="form-control" style="margin-bottom:41px;" name="newpwck" id="newpwck">
						<input type="button" class="btn btn-secondary" value="수정" style="font-size:25px;" onclick="changepw()">					
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var changepw = function(){
		var passwordRegExp = /^[a-zA-z0-9]{8,16}$/;
		var oldpw = document.getElementById("oldpw").value;
		var newpw = document.getElementById("newpw").value;
		var newpwck = document.getElementById("newpwck").value;
		if(!passwordRegExp.test(newpw)){
			 alert("비밀번호는 영문 대소문자와 숫자로 8~16자리여야 합니다.")
			 document.getElementById("newpw").value="";
			 document.getElementById("newpw").focus();
			 return false;
		}
		if(newpw != newpwck){
			alert("비밀번호가 일치하지 않습니다.")
			document.getElementById("newpwck").value="";
			document.getElementById("newpwck").focus();
			return false;
		}
		if(newpw == oldpw){
			alert("현재 비밀번호와 일치합니다.");
			 document.getElementById("newpw").value="";
			 document.getElementById("newpwck").value="";
			 document.getElementById("newpw").focus();
			return false;
		}
		$.ajax({
		     type:"POST",
		     url:"changePassword.do",
		     dataType:"text",
			 data:{
				 oldpw:document.getElementById("oldpw").value,
				 newpw:document.getElementById("newpw").value
			 },
			 success:function(data){
				 if(data == "success"){
					 alert("비밀번호가 변경되었습니다.")
				 }else{
					 alert("비밀번호가 일치하지 않습니다.")
				 }
			 },
			 error:function(){
				 alert("error")
			 }
		})
	}
</script>
</html>