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
	margin-top: 2%;
	margin-left: 28%;
	
}

</style>
</head>
<body style="background-color:#FAFAFA;">
	<c:if test="${login_id == null }">
	<script type="text/javascript">
	location.href='loginPage.do'
	</script>
	</c:if>
	<header>
		<%@ include file="../element/header.jsp" %>
	</header>

	<div id="maindiv">
		<div style="float:left;font-size:25px;width:300px;border:solid gray 1px;height:900px;">
			<div style="padding:10%;padding-right:20%;border-left:solid;"><a href="profileset.do">프로필 편집</a></div>
			<div style="padding:10%;padding-right:20%;"><a href="changePw.do">비밀번호 변경</a></div>
			<div style="padding:10%;padding-right:20%;"><a href="invalAccount.do">계정 비활성화</a></div>
		</div>
		<div style="float:left;width:700px;height:900px;border:solid gray 1px;">
			<div style="float:left;width:160px;text-align:right;font-size:25px;padding-top:50px;font-weight: bold;">
				<div><img id="profileimg" alt="" src="http://localhost:8080/web/images/${customer.profile_img}" style="width:64px;height:64px;border-radius:70%;"></div>
				<br><br>
				<div style="margin-bottom:50px;"><b>이름</b></div>
				<div style="margin-bottom:50px;"><b>사용자 이름</b></div>
				<div style="margin-bottom:83px;"><b>소개</b></div>
				<div style="margin-bottom:50px;"><b>성별</b></div>
			</div>
			<div style="float:left;width:450px;margin-left:80px;padding-top:50px;">
				<div>
					<p style="font-size:30px;">${customer.nick_name }</p><br>
					<a style="font-size:20px;color:skyblue;" onclick="openProfileImg()">프로필 이미지 변경</a>
				</div><br><br><br>
				<div style="width:400px;">
					<form action="updateProfile.do" id="changeForm">
						<input type="text" class="form-control" style="margin-bottom:41px;" id="name" name="name" value="${customer.name }">
						<input type="text" class="form-control" style="margin-bottom:41px;" id="nick_name" name="nick_name" value="${customer.nick_name }">
						<textarea class="form-control" style="margin-bottom:41px;" name="introduce" id="introduce">${customer.introduce }</textarea>	
						<select class="form-control" style="margin-bottom:41px;" name="gender">
							<option value="m">남자</option>
							<option value="f">여자</option>
						</select>
						<input type="button" class="btn btn-secondary" value="수정" style="font-size:25px;" onclick="changeProfile()">					
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var openProfileImg = function(){
		window.open("changeProfileImg.do","img_pop","location=0,menubar=no,status=no,toolbar=no,scrollbas=no,top=300,left=500,width=600,height=400");
	}
	var changeProfile =function(){
		var nameRegExp = /^[a-zA-z가-힣]{2,12}$/;
		var name = document.getElementById("name").value;
		var nick_name = document.getElementById("nick_name").value;
		 if(!nameRegExp.test(name)){
			 alert("이름은 한글 또는 영문으로 2~12자리여야 합니다.")
			 document.getElementById("name").value="";
			 document.getElementById("name").focus();
			 return false;
		 }
		 if(nick_name.length<4){
			 alert("닉네임은 4글자 이상이어야 합니다.");
			 document.getElementById("nick_name").value="";
			 document.getElementById("nick_name").focus();
			 return false
		 }
		 document.getElementById("changeForm").submit();
	}
</script>
</html>