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
</head>
<body>
	<div>
	<form action="" method="post" id="profileForm" enctype="multipart/form-data">
		<input type="file" name="uploadProfile" id="file" class="btn btn-secondary" accept=".gif, .jpg, .png" />
		<input type="button" value="제출" id="btn" class="btn btn-secondary" />
		<input type="button" value="취소" class="btn btn-secondary" id="cancel">
	</form><br><br>
	</div>
	<div style="margin-left:100px;">
		<img alt="" src="" style="width:256px;height:256px;border-radius:70%;" id="myimg">
	</div>
</body>
<script type="text/javascript">
	var fileName;
	$(function(){
		$("#file").change(function(){
			var prodata = new FormData($('#profileForm')[0]);
			alert(prodata)
			$.ajax({
				 type:"POST",
				 enctype: 'multipart/form-data',
				 url:"uploadProfileImg.do",
				 dataType:"text",
				 data:prodata,
		         processData: false,
		         contentType: false,
				 success:function(data){
					 fileName = data;
					 alert(fileName);
					 $("#myimg").attr("src","getimg.do?img="+fileName);
				 },
				 error: function(){
					 alert("error");
				 }
			})
		}),
		$("#btn").click(function(){
			if(fileName.length > 2){
				var result = confirm("프로필 사진으로 사용하시겠습니까?");
				if(result){
					$.ajax({
						 type:"POST",
						 url:"FinaluploadProfileImg.do",
						 dataType:"text",
						 data:{
							 profile_img:fileName
						 },
						 success:function(data){
							 alert("프로필 이미지가 변경되었습니다.")
							 opener.location.reload(true);
							 self.close();
						 },
						 error:function(){
							 alert("에러");
						 }
					})
				}else{
					$.ajax({
						type:"GET",
						url:"deleteUploadFile.do",
						dataType:"text",
						data:{
							fileNames:fileName
						},
						 success:function(data){
							 fileName = "";
							 document.getElementById("file").value = "";
							 $("#myimg").attr("src","");
						 },
						 error:function(){
							 alert("에러");
						 }
					})
				}
			}
		}),
		$("#cancel").click(function(){
			if(fileName != null || fileName != ""){
				$.ajax({
					type:"GET",
					url:"deleteUploadFile.do",
					dataType:"text",
					data:{
						fileNames:fileName
					},
					 success:function(data){
						 self.close();
					 },
					 error:function(){
						 alert("에러");
					 }
				})
			}
			
		})
	});
	
</script>
</html>