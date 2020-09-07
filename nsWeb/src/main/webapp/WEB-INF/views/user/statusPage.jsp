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
	border:solid gray 1px;
	
}
</style>
</head>
<body>
		<div id="maindiv">
			<p style="margin-top:50px;margin-left:50px;font-size:30px;">계정 활성화</p>
			<div style="margin-top:50px;margin-left:50px;margin-right:50px;line-height:30px;font-size:20px;">
				<nav>
					<span style="font-weight:bold;font-size:20px;">${customer.name }</span>님, 안녕하세요.
					현재 계정이 비활성화 상태입니다. 활성화 하시려면 아래 버튼을 눌러주세요.
				</nav>
				<br><hr>
			</div>
			<div style="width:900px;margin-top:50px;margin-left:50px;margin-right:50px;line-height:30px;font-size:20px;">
				<div style="float:left;width:30%;font-weight:bold;"><b>비밀번호를 입력하세요</b></div>
				<div style="float:left;width:70%;"><form action=""><input type="password" class="form-control" id="password"></form></div>
				<a href="#" style="font-size:15px;">비밀번호를 잊으셨나요?</a>
				<div style="clear:both;"></div>
				<br><hr><br>
				<nav style="line-height:30px;font-size:20px;">
				아래 버튼을 누르면 다시 oracle 서비스를 이용하실 수 있습니다.
				</nav><br><br>
				<button class="btn btn-secondary" style="font-size:25px;margin-bottom:10%;" onclick="valAccount()">계정 활성화</button>
			</div>
		</div>
</body>
<script type="text/javascript">
	var valAccount = function(){
		$.ajax({
			type:"POST",
			url:"changeStatus.do",
			dataType:"text",
			data:{
				password:document.getElementById("password").value
			},
			success:function(data){
				if(data == "success"){
					alert("계정이 활성화 되었습니다.")
					location.href="loginPage.do"
				}else{
					alert("비밀번호가 잘못되었습니다.")
					document.getElementById("password").value = "";
					document.getElementById("password").focus();
				}
			},
			error:function(){
				
			}
		})
	}

</script>
</html>