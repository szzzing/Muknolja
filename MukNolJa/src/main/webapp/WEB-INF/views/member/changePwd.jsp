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
  <body style="background: white; float: left; ">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>
  
     <div class="container-fluid text-center" style="font-family: 'OTWelcomeRA';  float: left;">
	  	<div class="row justify-content-center" >
            <div class="col" style="width:100vw; height:80px; display:inLine-block; background: white; border-bottom:2px solid lightgrey;" >
            	<div style="width:height:80px; display:inLine-block; ">
            		
            			<div style="margin-top: 20px; font-size: 35px; font-weight:600; text-align:center;">비밀번호 변경</div>
            		
            	</div>
            </div>
          </div>
          	 <div class="row justify-content-center" >
            	<div class="col"style=" height:100%; ">
            		<div style=" height:100%; background:white;display:inLine-block;">
          			<div style=" height:100%; display:inLine-block; ">
          				<div style=" margin-top:5vh; font-size: 50px; font-weight:700; color:#6BB6EC; width: 800; height:100" onclick= "location.href='${contextPath }/home.do'">MUKNOLJA</div>
            				<div style="float:left;  margin-top: 4vh;">
		            			<form action="${ contextPath }/changePassword.me?=${id}">
		            				<label for="pwd" style="float:left; font-size:20px;">비밀번호</label>
		            				<br>
		            				<input type="password" name="pwd" id="password" class="password" style="font-family:Georgia;width:500px; font-size:20px; padding:10px; padding-top:15px">
		            				
		            				<br>
		            				<div style="margin-top:2vh;">
			            				<input type="text" name="pwd1" id="password1" class="password1" style="font-family:Georgia;width:500px; font-size:20px; padding:10px; padding-top:15px">
			            			</div>
			            			<div>
			            				<div id="passwordsol1"style="margin-left:10px;margin-top:20px; float:left; font-size:15px; color:red; font-weight:100"></div>
			            				
			            			</div>
			            			
			            			
			            			
			            			<div style="position:absolute; top:85%; margin-left:0vw;">
			            			<button type="button" id="bobo" style="width:500px;  border-radius:10px; height:51px; border: 1px solid lightgrey;padding-top:8px;">변경하기</button>
			            			
			            			</div>
		            			</form>
		            		</div>
            		</div>
            		</div>
            	</div>
            	
            </div>
        </div>
     <script>
     var okpassword = false;
		var okpassword1 = false;
  	$("#password").on("blur",function () {
  		const idResult = document.getElementById('passwordsol1');
  		var reg =  /^[A-za-z0-9]{8,15}$/;
  		var value = $('#password').val().trim();
 		if (!reg.test(value)) {
 			idResult.innerText ="첫글자는 소문자 8~15자리 사이의 소문자와 숫자를 사용하세요"
 				okpassword = false;
  		}else{
  			idResult.innerText =""
  				okpassword = true;
  			$("#password1").keyup(function () {
  		  		 var first = $('#password').val().trim();
  		  		 var second = $('#password1').val().trim();
  		  		const idResult = document.getElementById('passwordsol1');
  		  		 if(first != second){
  		  			idResult.innerText ="비밀번호가 동일하지 않습니다"
  		  				okpassword1 = false;
  		  		 }else{
  		  			idResult.innerText = ""
  		  				okpassword1 = true;
  		  		 }
  		  	});
  		}
  	});
  	$('#bobo').click(function(){
  		
  	
  	if(okpassword1||okpassword){
  		$(form).submit();
  	}
  	});
  	
     </script>
  	
    
  </body>
</html>