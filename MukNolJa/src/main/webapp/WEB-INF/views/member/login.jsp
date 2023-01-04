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
  <body style="background: white; float: left; font-family: 'OTWelcomeRA';">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>
  
     <div class="container-fluid text-center" style="font-family: 'OTWelcomeRA';  float: left;">
	  	<div class="row justify-content-center" >
            <div class="col" style="width:100vw; height:80px; display:inLine-block; background: white; border-bottom:2px solid lightgrey;" >
            	<div style=" height:80px; display:inLine-block; ">
            		
            			<div style="margin-top: 20px; font-size: 35px; font-weight:600; text-align:center;">로그인</div>
            		
            	</div>
            </div>
          </div>
          	 <div class="row justify-content-center" >
            	<div class="col"style=" height:100%; padding-left:0px;">
            		<div style="width: height:100%; background:white;display:inLine-block;">
          			<div style="width: height:100%; display:inLine-block; ">
          				<div style=" margin-top:5vh; font-size: 50px; font-weight:700; color:#6BB6EC; width: 800; height:100" >MUKNOLJA</div>
          				
            				<div style="float:left;  margin-top: 4vh; ">
		            			<form action="${ contextPath }/login.me" method="post">
		            				
		            				<input type="text" name="id" id="id" class="id" style="width:500px; font-size:20px; padding:10px; padding-top:15px" required>
		            				<br>
		            				<div style="margin-top:10px;">
			            			<input type="password" name="pwd" id="pwd"  style="font-family:Georgia;width:500px; font-size:20px; float:left; padding:10px; padding-top:15px" required>
			            				
			            			</div>
			            			<button  style="width:500px; margin-top:10px; border-radius:10px; height:51px; border: 1px solid lightgrey;padding-top:8px;">로그인</button>
			            			
			            	
		            			</form>
		            			<div style="padding:10px; float:left;  ">
		            				<a href="${contextPath}/findId.me">아이디 찾기</a> <a href="${contextPath}/findId1.me"style="margin-left:22px;">비밀번호 찾기</a> 
		            			</div>
		            			<div style="display:flex; margin-top:20px; float:right;">
		          					<div ><img onclick="kakaoLogin();" alt="1" src="${contextPath }/resources/img/kakao.png" width=50px; height=50px; style="margin-left: 20px" >
										
									      <a href="javascript:void(0)">
									          
									      </a>
										
										
									</div>
		          					
		          				</div>
		            			
		          				<div style="display:flex; position:absolute; top:85%; margin-left:0vw; text-align:center; ">
		          				아직 회원이 아니신가요? <a style="font-size:18px;" href="${contextPath }/enrollE.me">회원가입</a>
		          				<div style="margin-left: 120px;">사업장등록은 여기<a style="font-size:18px;" href="${contextPath }/enrollH.me">호텔등록</a></div>
		          				</div>
		            		</div>
		            		
            		</div>
            		</div>
            	</div>
            	
            </div>
        </div>
       <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
if("${ noLogin }" == "no"){
	alert("입력한 회원 정보를 다시 확인해주세요")
}
Kakao.init('d5a279c4301e9b4c3bdaf215dfa378af'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
        	  var id = response.id;
        	  $.ajax({
      			url: '${ contextPath}/checkId.me',
      			data: {"id" :  id},
      			success: (data)=>{
      				
      				if(data.trim() == 'yes'){
      					function kakaoLogout() {
      					    if (Kakao.Auth.getAccessToken()) {
      					      Kakao.API.request({
      					        url: '/v1/user/unlink',
      					        success: function (response) {
      					        	console.log(response)
      					        },
      					        fail: function (error) {
      					          console.log(error)
      					        },
      					      })
      					      Kakao.Auth.setAccessToken(undefined)
      					    }
      					  } 
      					location.href="${ contextPath }/enrollK.me?id="+id;
      				}else if (data.trim() == 'no'){
      					location.href="${contextPath}/loginK.me?id="+id;
      				}
      			},
      			error: (data)=>{
      				console.log(data);
      			}
      			
      		});
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
 
</script>
  	
    
  </body>
</html>