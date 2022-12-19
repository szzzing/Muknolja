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
            		
            			<div style="margin-top: 20px; font-size: 35px; font-weight:600; text-align:center;">아이디찾기</div>
            		
            	</div>
            </div>
          </div>
          	 <div class="row justify-content-center" >
            	<div class="col"style=" height:100%; ">
            		<div style=" height:100%; background:white;display:inLine-block;">
          			<div style=" height:100%; display:inLine-block; ">
          				<div style=" margin-top:5vh; font-size: 50px; font-weight:700; color:#6BB6EC; width: 800; height:100" >MUKNOLJA</div>
            				<div style="float:left;  margin-top: 4vh;">
		            			<form >
		            				<label for="email" style="float:left; font-size:20px;">이메일</label>
		            				<br>
		            				<input type="text" name="email" id="email" class="email" style="width:500px; font-size:20px; padding:10px; padding-top:15px">
		            				<br>
		            				<div style="margin-top:2vh;">
			            				<input type="text" name="word" id="word"  style="width:350px; font-size:20px; float:left; padding:10px; padding-top:15px">
			            				<button type="button" id="emailBu" style="height:59px; width:145px; float:right; border-radius:10px; border: 1px solid lightgrey; padding-top:8px;">인증번호 전송</button>
			            			</div>
			            			
			            			<div style="margin-left: -200px;margin-top:90px;">인증번호 발송에는 일정 시간이 소요될수 있습니다.</div>
			            			
			            			<div style="position:absolute; top:85%; margin-left:0vw;">
			            			<button type="button" style="width:500px;  border-radius:10px; height:51px; border: 1px solid lightgrey;padding-top:8px;">다음</button>
			            			<div style="margin-top:2vh; margin-left:-10px"><i class="bi bi-exclamation-circle-fill" style="color:red;"></i>회원가입시 등록한 이메일을 이용해주세요</div>
			            			</div>
		            			</form>
		            		</div>
            		</div>
            		</div>
            	</div>
            	
            </div>
        </div>
       
  	<script>
  		var email = false;
  	window.onload = ()=>{
		
		
		var $checkEmail = $("#emailBu"); // 인증번호 발송 버튼
		var $memailconfirm = $("#word"); // 인증번호 확인input
		var $memailconfirmTxt = $("#memailconfirmTxt"); // 인증번호 확인 txt
		var $button = $("button");
	// 이메일 인증번호
	$checkEmail.click(function() {
		console.log(document.getElementById("email").value);
		$.ajax({
			url: '${ contextPath}/checkEmail.me',
			data: {"email" : document.getElementById("email").value},
			success: (data)=>{
				console.log(data);
				if(data.trim() == 'yes'){
					$.ajax({
						type : "POST",
						url : '${ contextPath}/pleaseMail.me',
						data : {
							"email" : document.getElementById("email").value
						},
						success : function(data){
							alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
							console.log("data : "+data);
							chkEmailConfirm(data, $memailconfirm, $memailconfirmTxt);
						}
					});
			
				function chkEmailConfirm(data, $memailconfirm, $memailconfirmTxt){
					$button.click(function(){
						if (data != $memailconfirm.val()) { //
							emconfirmchk = false;
							alert("인증번호가 일치하지 않습니다");
							
						} else { // 아니면 중복아님
							
							location.href = "${ contextPath }/findId.me?email=" + document.getElementById("email").value;
						}
					});
				}
					
				}else if(data.trim() == 'no'){
					alert("중복된 이메일 입니다");
				}
			},
			error: (data)=>{
				alert("존재하지 않는 이메일 입니다");
			}
			
		});
  	});
  	}
 	
		
  	</script>
    
  </body>
</html>