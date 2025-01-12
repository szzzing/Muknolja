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
  <body style="background: rgb(185, 224, 255,0.1); ">
  <jsp:include page="../member/menubar.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>
  
     <div class="container-fluid text-center" style="font-family: 'OTWelcomeRA';  float: left;">
	  	<div class="row justify-content-center" >
            <div class="col" style="  display:inLine-block; background: white; border-bottom:2px solid #F2F2F2" >
            <br><br><br>
            
         
          			<div style="width:800px; height:100%; display:inLine-block; background: white"><div >
          				<div style=" margin-top:5vh; font-size: 50px; color:#6BB6EC; width: 800; display:flex; margin-left:280px;  text-align:center"><c:if test="${ loginUser.fileModifyName == null }"><img id="img"style=" margin-right:20px; margin-left:-50px;margin-top:15px;"height=50px; width= 50px; alt="1" src="${contextPath }/resources/img/no.png" ></c:if>
          				<c:if test="${ loginUser.fileModifyName != null }"><img id="img"style=" margin-right:20px; margin-left:-50px;margin-top:15px;border-radius:30px;"height=50px;  width= 50px; alt="1" src="${contextPath }/resources/uploadFiles/${ loginUser.fileModifyName}" ></c:if>
          				${ loginUser.name }님&nbsp;<div style="margin-top:20px;font-size:30px;">${ loginUser.id }</div></div></div>
            				<div style="float:left; margin-left: 150px; margin-top: 4vh;">
            					
		            			<form action="${ contextPath }/change.me?id=${ loginUser.id }" method="POST" enctype="multipart/form-data" >
		            			
		            			<input type="file" id="file"  name="file" style="display:none;">
		            			<div style="margin-top:20px;">
		            				<div style="display:flex;"><label for="password" style="float:left; font-weight:600; font-size:15px;">패스워드</label><div id="passwordsol"style="margin-left:10px; float:left; font-size:15px; color:red; font-weight:100"></div></div>
		            				<br>
		            				<div><input type="password" name="pwd" id="password" class="password" style="width:500px;font-family:Georgia; font-size:20px;Georgia; padding:10px; margin-top:-20px; padding-top:15px;border: 1px solid lightgrey" ></div>
		            				
		            			</div>
		            			<div style="margin-top:50px;">
		            				<div style="display:flex;"><label for="password1" style="float:left; font-weight:600; font-size:15px;">패스워드 확인</label><div id="passwordsol1"style="margin-left:10px; float:left; font-size:15px; color:red; font-weight:100"></div></div>
		            				<br>
		            				<input type="password" name="password1" id="password1" class="password1" style="width:500px; margin-top:-20px; font-family:Georgia; font-size:20px; padding:10px 10px; padding-top:15px; border: 1px solid lightgrey" >
		            				
		            			</div>
		            			
		            			<div style="margin-top:50px;">
		            				<div style="display:flex"><label for="nickName" style="float:left; font-size:15px; font-weight:600">닉네임</label><div id="nickNamesol"style="margin-left:10px; float:left; font-size:15px; color:red; font-weight:100"></div></div>
		            				<br>
		            				<input type="text" name="nickName" id="nickName" class="nickName" style="width:500px; font-size:20px; padding:10px 10px; margin-top:-20px;"value="${ loginUser.nickName }" required>
		            				
		            			</div>
		            			<div style="margin-top:40px;">
		            				<label for="phone" style="float:left;font-weight:600; font-size:15px;">휴대폰</label>
		            				<br>
		            				<input type="text" name="phone" id="phone" class="phone" style="width:500px; font-size:20px; padding:10px 10px; padding-top:15px; border: 1px solid lightgrey" value="${ loginUser.phone }" required>
		            			</div>
		            			<div style="margin-top:40px;">
		            				<label for="email" style="float:left; font-weight:600; font-size:15px;">이메일</label>
		            			<br>
		            				<input type="text" name="email" id="email" class="email" style="width:500px; font-size:20px; padding:10px 10px; padding-top:15px; border: 1px solid lightgrey"  value="${ loginUser.email }" readonly>
		            			</div>
		            			<div style="margin-top:40px;">
		            				<label for="address" style="float:left; font-weight:600; font-size:15px;">주소</label>
		            				<br>
		            				<input type="text" name="address" id="address" class="address" style="width:500px; font-size:20px; padding:10px 10px; padding-top:15px; border: 1px solid lightgrey" value="${ loginUser.address }" required>
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
  	
  		
  		var okpassword = true;
  		var okpassword1 = true;
  		var okNickName = true;
  	
  	
  	$("#password").on("blur",function () {
  		const idResult = document.getElementById('passwordsol');
  		var reg =  /^[A-za-z0-9]{8,15}$/;
  		var value = $('#password').val().trim();
  		
  		if( value != ""){
	 		if (!reg.test(value)) {
	 			idResult.innerText ="첫글자는 소문자 8~15자리 사이의 소문자와 숫자를 사용하세요"
	 				okpassword = false;
	  		}else{
	  			idResult.innerText =""
	  				okpassword = true;
	  			
	  		}
  		}
  	});
  	
  	$("#password1").on("blur",function () {
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
  	});$( "#nickName").on("blur",function () {

  		const idResult = document.getElementById('nickNamesol');
  		
  		var reg =  /^[a-z][a-z0-9]{1,10}$/;
 		var value = $('#nickName').val().trim();
 		if("${loginUser.nickName}" != value){
	 		if (!reg.test(value)) {
	 			idResult.innerText = "2~10자리 사이의 글자를 입력해주세요"
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
 		}
  	});

	$('button').click(function(){
		if(okNickName && okpassword && okpassword1){
			$('form').submit();
		}else{
			alert("옮바르지 않은 회원가입입니다.")
			
		}
		
		
	});
		
		const myFile = document.querySelector('#file');
	    const thumbnail = document.querySelector('#img');
	    
		    myFile.addEventListener('change', ()=>{
		    	const reader = new FileReader();
		    	reader.onload = function(e){
					console.log(e);		    		
		    		thumbnail.src = e.target.result;
		    	};
		    	reader.readAsDataURL(myFile.files[0]);
		    });
	$('#img').click(function(){
		$("#file").click();
		
	})
  	</script> 
    
  </body>
</html>