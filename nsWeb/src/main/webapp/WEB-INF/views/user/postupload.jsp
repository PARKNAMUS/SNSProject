<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#maindiv {
	width: 1000px;
	margin-top: 2%;
	margin-left: 28%;
	border: solid gray 1px;
}
.tri{
	display: none;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../element/header.jsp"%>
	</header>
	<div id="maindiv">
		<p style="margin-top: 50px; margin-left: 50px; font-size: 30px;">게시물
			등록</p>
		<div
			style="margin-top: 50px; margin-left: 50px; margin-right: 50px; line-height: 30px; font-size: 20px;">
			<nav>새 게시물을 등록해 보세요!</nav>
			<br>
			<hr>
		</div>
		<div
			style="width: 900px; margin-top: 50px; margin-left: 50px; margin-right: 50px; line-height: 30px; font-size: 20px;">
			<div>
			<div style="width:40%;float:left;">
				<form action="postUpload.do" id="postForm" method="post" enctype="multipart/form-data" class="filebox">
					<label>이미지 업로드</label>
					<input type="file" multiple="multiple" id="postimg" name="postimg"  class="form-control-file border" accept=".gif, .jpg, .png" ><br>
					<label>게시글 입력</label>
					<textarea rows="5" cols="" class="form-control" id="post_content" name="post_content" ></textarea><br>
					<input type="button" class="btn btn-secondary" onclick="postSubmit()" style="font-size:25px;margin-bottom:10%;" value="공유">
					<input type="button" class="btn btn-secondary" onclick="history.go(-1)" style="font-size:25px;margin-bottom:10%;" value="취소">
				</form>
			</div>
			<div style="float:left;width:50%;margin-left:5%;">
				<img id="tri1" class="tri" alt="" src="${pageContext.request.contextPath}/resources/images/trileft.png" style="position:absolute;z-index:10;width:32px;height:32px;opacity:0.5;margin-top:5%;">
				<img alt="" src="" id="tempimg" style="width:80%;border-radius:5%;margin-left:8%;">
				<img id="tri2" class="tri" alt="" src="${pageContext.request.contextPath}/resources/images/triright.png" style="position:absolute;z-index:10;width:32px;height:32px;opacity:0.5;margin-top:5%;">
			</div>
			<div style="clear:both;"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var index = 0;
	var images;
	var reader = new FileReader();
	var direct;
	reader.onload = function(e){
		$("#tempimg").hide().attr("src",e.target.result).toggle("slide",{direction:direct});
	}
	$(function(){
		$("#postimg").change(function(){
			if(this.files && this.files[0]){
				images = this.files;
				if(images.length >1){
					$("#tri2").css("display","initial")
				}else{
					$("#tri2").css("display","none")
				}
				$("#tri1").css("display","none")
				index = 0;
				reader.readAsDataURL(images[index]);
			}
		}),
		$("#tri2").click(function(){
			index++;
			direct = 'right'
			$("#tri1").css("display","initial")
			reader.readAsDataURL(images[index]);
			if(index == images.length-1){
				$("#tri2").css("display","none")
			}
		}),
		$("#tri1").click(function(){
			index--;
			direct = 'left'
			$("#tri2").css("display","initial")
			reader.readAsDataURL(images[index]);
			if(index == 0){
				$("#tri1").css("display","none")
			}
		})
	})
	
	var postSubmit = function(){
		if(document.getElementById("post_content").value == null ||document.getElementById("post_content").value == ""){
			alert("게시물을 입력해 주세요")
			console.log(document.getElementById("postimg").value)
			return false;
		}
		if(document.getElementById("postimg").value == null || document.getElementById("postimg").value == ""){
			alert("사진을 등록해 주세요")
			return false;
		}
		document.getElementById("postForm").submit();
	}
</script>
</html>