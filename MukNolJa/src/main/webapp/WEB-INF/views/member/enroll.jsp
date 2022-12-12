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
            		
            			<div style="margin-top: 20px; font-size: 40px; font-weight:600; text-align:center;">회원가입(2/2)</div>
            		
            	</div>
            </div>
          </div>
          	 <div class="row justify-content-center" >
            	<div class="col"style="left:0">
          			<div style="width:800px; height:100%; display:inLine-block; background: white">
          				<div style=" margin-top:5vh; font-size: 50px; color:#6BB6EC; width: 800; ">MUKNOLJA</div>
            				<div style="float:left; margin-left: 150px; margin-top: 4vh;">
		            			<form action="" >
		            			<div style="margin-top:20px;">
		            				<label for="id" style="float:left; font-size:15px; font-weight:600">아이디</label>
		            				<br>
		            				<div><input type="text" name="id" id="id" class="id" style="width:500px; font-size:20px; padding:10px 10px; padding-top:15px; border: 1px solid lightgrey" required></div>
		            					<div id="idsol"style="margin-top:10px; float:left; font-size:15px; color:red; font-weight:100"></div>
		            				
		            			</div>
		            			
		            			<div style="margin-top:40px;">
		            				<label for="password" style="float:left; font-size:15px;">패스워드</label>
		            				<br>
		            				<div><input type="password" name="password" id="password" class="password" style="width:500px; font-size:20px; padding:10px 10px; padding-top:15px;border: 1px solid lightgrey" required></div>
		            				<div id="passwordsol"style="margin-top:10px; float:left; font-size:15px; color:red; font-weight:100"></div>
		            			</div>
		            			<div style="margin-top:40px;">
		            				<label for="password1" style="float:left; font-weight:600; font-size:15px;">패스워드 확인</label>
		            				<br>
		            				<input type="text" name="password1" id="" class="password1" style="width:500px; font-size:20px; padding:10px 10px; padding-top:15px; border: 1px solid lightgrey" required>
		            				<div id="passwordsol1"style="margin-top:10px; float:left; font-size:15px; color:red; font-weight:100"></div>
		            			</div>
		            			<div style="margin-top:40px;">
		            				<label for="name" style="float:left; font-size:15px; font-weight:600">이름</label>
		            				<br>
		            				<input type="text" name="name" id="name" class="name" style="width:500px; font-size:20px; padding:10px 10px; padding-top:15px; border: 1px solid lightgrey" required>
		            			</div>
		            			<div style="margin-top:40px;">
		            				<label for="nickName" style="float:left; font-size:15px; font-weight:600">닉네임</label>
		            				<br>
		            				<input type="text" name="nickName" id="nickName" class="nickName" style="width:500px; font-size:20px; padding:10px 10px; padding-top:15px; border: 1px solid lightgrey" required>
		            				<div id="nickNamesol"style="margin-top:10px; float:left; font-size:15px; color:red; font-weight:100"></div>
		            			</div>
		            			<div style="margin-top:40px;">
		            				<label for="phone" style="float:left;font-weight:600; font-size:15px;">휴대폰</label>
		            				<br>
		            				<input type="text" name="phone" id="phone" class="phone" style="width:500px; font-size:20px; padding:10px 10px; padding-top:15px; border: 1px solid lightgrey" required>
		            			</div>
		            			<div style="margin-top:40px;">
		            				<label for="email" style="float:left; font-weight:600; font-size:15px;">이메일</label>
		            			<br>
		            				<input type="text" name="email" id="email" class="email" style="width:500px; font-size:20px; padding:10px 10px; padding-top:15px; border: 1px solid lightgrey" readonly value="${ email }">
		            			</div>
		            			<div style="margin-top:40px;">
		            				<label for="address" style="float:left; font-weight:600; font-size:15px;">주소</label>
		            				<br>
		            				<input type="text" name="address" id="address" class="address" style="width:500px; font-size:20px; padding:10px 10px; padding-top:15px; border: 1px solid lightgrey" required>
		            			</div>
		            			<div style="margin-top:40px;">
		            				<label for="gender" style="float:left; font-weight:600; font-size:15px;">성별</label>
		            				<br>
				 					<select id="gender" name="gender" style="width:500px; font-size:40px; height:200px; border: 1px solid lightgrey" required>
									<option style=height:30px;>성별</option>
									<option style=height:30px;>남자</option>
									<option style=height:30px;>여자</option>
									</select>
					            	</div>
		            			
			            				
			            			
			            			
			            			<button style="width:500px; margin-top:50px; border-radius:10px; height:51px; border: 1px solid lightgrey;padding-top:8px;">다음</button>
			            		
		            			</form>
		            		</div>
            		
            		</div>
            	</div>
            	
            </div>
        </div>
  	<script>
  	$( "#id").blur(function(){
  		$.ajax({
			url: '${ contextPath}/checkId.me',
			data: {"id" : document.getElementById("id").value},
			success: (data)=>{
				const idResult = document.getElementById('idsol');
				console.log(data);
				if(data.trim() == 'yes'){
					idResult.innerText = "사용가능한 아이디 입니다.";
					idResult.style.color= "#6BB6EC"
				}else if (data.trim() == 'no'){
					
					idResult.innerText = "중복된 아이디 입니다."
				}
			},
			error: (data)=>{
				console.log(data);
			}
			
		});
  	});
  	
 
		
  	</script> 
    
  </body>
</html>