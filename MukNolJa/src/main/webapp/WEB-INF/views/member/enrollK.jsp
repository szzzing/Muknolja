<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
    	@font-face {
	    font-family: 'OTWelcomeRA';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}

    </style>
  </head>
  <body style="background: rgb(185, 224, 255,0.1); float: left;">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>
  
     <div class="container-fluid text-center" style="font-family: 'OTWelcomeRA';  float: left;">
	  	<div class="row justify-content-center" >
            <div class="col" style="width:100vw; height:80px; display:inLine-block; background: white; border-bottom:2px solid #F2F2F2" >
            	<div style="width:800px; height:80px; display:inLine-block; ">
            		
            			<div style="margin-top: 20px; font-size: 40px; font-weight:600; text-align:center;">카카오톡 가입<img src="${contextPath }/resources/img/kakao.png" width=50px; height=50px; style="margin-left: 20px" ></div>
            		
            	</div>
            </div>
          </div>
          	 <div class="row justify-content-center" >
            	<div class="col"style="left:0">
          			<div style="width:800px; height:100%; display:inLine-block; background: white">
          				<div style=" margin-top:5vh; font-size: 50px; color:#6BB6EC; width: 800; " onclick= "location.href='${contextPath }/home.do'">MUKNOLJA</div>
            				<div style="float:left; margin-left: 150px; margin-top: 4vh;">
		            			<form action="${ contextPath }/enrollkko.me" method="POST" enctype="multipart/form-data" id="attmForm">
		            			
		            			<input name="id" id="inputId" class="id" style="display:none">
		            			
		            			<div style="margin-top:20px;">
		            				<label for="name" style="float:left; font-size:15px; font-weight:600">이름</label>
		            				<br>
		            				<input type="text" name="name" id="name" class="name" style="width:500px; font-size:20px; padding:10px 10px; padding-top:15px; border: 1px solid lightgrey" required>
		            			</div>
		            			<div style="margin-top:50px;">
		            				<div style="display:flex"><label for="nickName" style="float:left; font-size:15px; font-weight:600">닉네임</label><div id="nickNamesol"style="margin-left:10px; float:left; font-size:15px; color:red; font-weight:100"></div></div>
		            				<br>
		            				<input type="text" name="nickName" id="nickName" class="nickName" style="width:500px; font-size:20px; padding:10px 10px; margin-top:-20px;"padding-top:15px; border: 1px solid lightgrey" required>
		            				
		            			</div>
		            			<div style="margin-top:40px;">
		            				<label for="phone" style="float:left;font-weight:600; font-size:15px;">전화번호</label>
		            				<br>
		            				<input type="text" name="phone" id="phone" class="phone" style="width:500px; font-size:20px; padding:10px 10px; padding-top:15px; border: 1px solid lightgrey" required>
		            			</div>
		            			<div style="margin-top:40px;">
		            				<label for="email" style="float:left; font-weight:600; font-size:15px;">이메일</label>
		            			<br>
		            				<input type="text" name="email" id="email" class="email" style="width:500px; font-size:20px; padding:10px 10px; padding-top:15px; border: 1px solid lightgrey" required>
		            			</div>
		            			<div style="margin-top:40px;">
		            				<label for="address" style="float:left; font-weight:600; font-size:15px;">주소</label>
		            				<br>
		            				<input type="text" name="address" id="address" class="address" style="width:500px; font-size:20px; padding:10px 10px; padding-top:15px; border: 1px solid lightgrey" required>
		            			</div>
		            			<div style="margin-top:40px;">
		            				<label for="gender" style="float:left; font-weight:600; font-size:15px; ">성별</label>
		            				<br>
				 					<select id="gender" name="gender" style="width:500px; font-size:20px; height:57px; padding:5px; font-weight:500; border: 1px solid lightgrey; font-family:Georgia;"  required>
									<option style=height:30px;>성별</option>
									<option style=height:30px;>남자</option>
									<option style=height:30px;>여자</option>
									</select>
					            	</div>
		            			
		            			
			            	
			            			
			            			<button type="button" style="width:500px; margin-top:50px; border-radius:10px; height:51px; border: 1px solid lightgrey;padding-top:8px;">다음</button>
			            		
		            			</form>
		            		</div>
            		
            		</div>
            	</div>
            	
            </div>
        </div>
  	<script>
  	
$( "#nickName").on("blur",function () {

		const idResult = document.getElementById('nickNamesol');
		
		var reg =  /^[a-z][a-z0-9]{6,12}$/;
		var value = $('#nickName').val().trim();
		if (!reg.test(value)) {
			idResult.innerText = "6~12자리 사이의 글자를 입력해주세요"
				idResult.style.color= "red"
					okNickName = false;
		}else{

		$.ajax({
		url: '${ contextPath}/checkNickName.me',
		data: {"nickName" : document.getElementById("nickName").value},
		success: (data)=>{
			
			console.log(data);
			if(data.trim() == 'yes'){
				idResult.innerText = "사용가능한 아이디 입니다.";
				idResult.style.color= "#6BB6EC"
					okNickName = true;
			}else if (data.trim() == 'no'){
				
				idResult.innerText = "중복된 닉네임 입니다."
					idResult.style.color= "red"
						okNickName = false;
			}
		},
		error: (data)=>{
			console.log(data);
		}
		
	});
		}
	});
	const gender = document.getElementById('gender');
	var id = ${ id };
	console.log(id);
	
	$("#inputId").innerHtml = id;
	$("#inputId").val(id);
	console.log($('.id').val());
	$('button').click(function(){
		if( gender.value.trim() == "성별" ){
			console.log("1");
			alert("성별을 선택해주세요");
		}else{
			console.log("눌림");
			$('form').submit();
		}
	});

	
  	</script> 
    
  </body>
</html>