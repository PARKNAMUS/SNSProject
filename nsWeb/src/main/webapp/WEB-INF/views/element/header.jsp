<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#searchbox:focus {outline:none;}
	#headdiv {
		position: absolute;
		margin-left: 68%;
		z-index: 11;
		background-color:white;
		border-radius: 15px;
		width:200px;
		box-shadow: 2px 2px 2px 2px gray;
		font-size:20px;
		padding:1%;
		display:none;
	}
	#searchdiv{
		position: absolute;
		background-color:white;
		border-radius: 15px 15px 15px 15px;
		box-shadow: 2px 2px 2px 2px gray;
		width:100%;
		z-index:11;
		overflow:scroll;
		display: none;
	}
	#searchdiv::-webkit-scrollbar {
	  width: 15px;
	}
	#searchdiv::-webkit-scrollbar-track {
	  background-color: transparent;
	}
	#searchdiv::-webkit-scrollbar-thumb {
	  border-radius: 5px;
	  background-color: #bebebe;
	}
	#searchdiv::-webkit-scrollbar-button {
	  width: 0;
	  height: 0;
	}
	.sdiv{
	    -ms-overflow-style: none; /* IE and Edge */
	    scrollbar-width: none; /* Firefox */
	}
	.sdiv::-webkit-scrollbar {
	    display: none; /* Chrome, Safari, Opera*/
	}
	#himgdiv{
	float:left;width:350px;height:60%;margin-left:10%;margin-top:0.7%;
	}
	#hsearchdiv{
	float:left;width:300px;margin-left:30%;height:50%;margin-top:0.7%;
	}
	.himg{
		margin-left:30px;
	}
	@media ( max-width : 1200px){
		#logodiv{
			display: none;
		}
		#himgdiv{
			margin-left:100px;
			width:200px;
		}
		#hsearchdiv{
			margin-left:0px;
		}
		.himg{
			margin-left:10px;

		}
	}
	</style>
</head>
<body>
	<div style="width:100%;height:80px;border-top:1px solid #dcdcdc;border-bottom:1px solid #dcdcdc;position: sticky;z-index:100;background-color:white;">
		<div>
		<div style="width:100px;height:100%;margin-left:3%;float:left;" id="logodiv" onclick="location.href='loginSuccess.do'">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/logo.png" style="vertical-align:top;width:100%;height:100%">
		</div>
		<div style="" id="hsearchdiv">
			<div style="float:left;width:40px;height:40px;">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/mglass.png" style="width:100%;height:100%;">
			</div>
			<div style="float:left;width:230px;height:100%;box-shadow: 2px 2px 2px 2px gray;">
				<form action="">
					<input autocomplete="off" id="searchbox" type="text" style="width:230px;height:100%;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;font-size:2.8ex;" onkeyup="finduser(this)" onblur="blursearch()">
				</form>
				<div id="searchdiv" style="width:13%;">
	
				</div>
			</div>
		</div>
		<div style="" id="himgdiv">
			<div style="float:left;width:50px;height:50px;" onclick="location.href='loginSuccess.do'" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/home.png" style="width:100%;height:100%;">
			</div>
			<div class="himg" style="float:left;width:50px;height:50px;" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/dm.png" style="width:100%;height:100%;" onclick="chatlist('${login_id}')">
			</div>
			<div class="himg" style="float:left;width:50px;height:50px;border-radius:70%;overflow:hidden;" id="myimg" onmouseover="$(this).css('border','solid gray')" onmouseout="$(this).css('border','none')">
				<c:choose>
					<c:when test="${myimg == null || myimg == '' }">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/index/human.png" style="width:100%;height:100%;">
					</c:when>
					<c:otherwise>
						<img alt="" src="/web/images/${myimg}" style="width:100%;height:100%;">
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
	</div>
		<div style="clear:both;"></div>
	<div id="headdiv">
		<div style="" onclick="location.href='profile.do?type=my'" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)"> 
			<img alt="" src="${pageContext.request.contextPath}/resources/images/index/user.png" style="width:30px;height:30px;vertical-align:middle;">
			<b>프로필</b>
		</div><br>
		<div style="" onclick="location.href='profileset.do'" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/index/setting.png" style="width:30px;height:30px;vertical-align:middle;">
			<b>설정</b>
		</div><br>
		<div style="" onclick="location.href='profile.do?type=save'" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/index/star.png" style="width:30px;height:30px;vertical-align:middle;">
			<b>저장됨</b>
		</div><hr>
		<div style="" onclick="location.href='logout.do'" onmouseover="$(this).css('opacity',0.5)" onmouseout="$(this).css('opacity',1)">
			<b>로그아웃</b>
		</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#myimg").click(function(){
				$("#headdiv").fadeToggle("slow");
			})
		})
		var finduser = function(target){
			var search = target.value;
			if(search != ""){
				$.ajax({
					type:'GET',
					dataType:'Json',
					url:'searchUser.do',
					data:{
						searchKeyWord:search
					},
					success:function(data){
						$("#searchdiv").empty();
						$("#searchdiv").css("display","initial")
						var getdata = data
						if(getdata.length >0){
							for(var i =0; i<getdata.length; i++){
								var pf_img;
								if(getdata[i].profile_img == null){
									pf_img = "${pageContext.request.contextPath}/resources/images/index/human.png";
								}else{
									pf_img = "/web/images/"+getdata[i].profile_img;
								}
								$("#searchdiv").append("<div style='width:100%;overflow: auto;' id='sdiv"+i+"' class='sdiv' >"
								+"<div style='float:left;'><img src='"+pf_img+"' style='border-radius:70%;vertical-align:middle;width:50px;height:50px;'></div>"
								+"<div style='float:left;margin-left:10%;'><p style='font-size:20px;'>"+getdata[i].nick_name+"</p><br><p style='font-size:15px;'>"+getdata[i].name+"</p></div>"
								+"</div><div style='clear:both;'></div><hr>")
								$("#sdiv"+i).attr("onclick","userProfile('"+getdata[i].email+"','my')")
								$("#sdiv"+i).attr("onmouseover","$(this).css('opacity',0.5)")
								$("#sdiv"+i).attr("onmouseout","$(this).css('opacity',1)")
							}
						}else{
							$("#searchdiv").append("<h3 style='margin-top:5%;margin-bottom:5%;margin-left:5%;'>검색결과가 없습니다.</h3>")
						}
					},
					error:function(){
						alert("error")
					}
				})
			}
		}
		async function blursearch(){
			await sleep(1000);
			$("#searchdiv").css("display","none");
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
		function sleep(ms) {
			return new Promise(resolve => setTimeout(resolve, ms));
		}
		
		var chatlist = function(email){
			location.href='chatlist.do?email='+email;
			
		}
	</script>
</body>
</html>