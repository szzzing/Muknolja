<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
    	.logBu{
    		border: 1px solid  #256D85;
    		height:50px;
    		width: 117px;
    		border-radius: 10px;
    		
    		margin:2% 0.5%;
    		box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.3);
    	}
    
    	 /*  폰트 */
        @font-face {
		    font-family: 'HSYuji-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/HSYuji-Regular.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
	
	

#loginF {  
	  animation-name: loginF;
	  animation-duration: 1s;
	  animation-fill-mode: both;
	}
	@-webkit-keyframes loginF {
	  0% {
	    opacity: 0;
	    transform: translate3d(0, -100%, 0);
	  }
	  100% {
	    opacity: 1;
	    transform: none;
	  }
	}
	@keyframes loginF {
	  0% {
	    opacity: 0;
	    transform: translate3d(0, -100%, 0);
	  }
	  100% {
	    opacity: 1;
	    transform: none;
	  }
	}
	.loginFind:hover{
	
	font-weight:700}
	.loginB:hover{
	
	font-weight:900}
    </style>
  </head>
  <body style="margin-top:25vh; font-family: 'HSYuji-Regular';">
  <jsp:include page="menubar.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
   
   
     <div class="container-fluid text-center">
	  	<div class="row justify-content-center" style="width: 100%">
            <div class="col">
            	<div style="display:inLine-block; width:500px; height: 100% ">
            		
            		
            		
            		<form action="${contextPath }/login.me"  method="post" id="loginF" style="border: 1px solid  #256D85; width:500px; height: 100%; border-radius:30px; background: radial-gradient(ellipse, #256D85 0%, #68A7AD 100%); box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.3); ">
            		<div class="container-fluid text-center">
            			<div class="mb-3 row justify-content-center" style="width:100%; margin-top:4%;"  >
	  		        		<div class="col">
	  		        		
            					<div  style="display:inLine-block; width:500px; height: 100%; ">
            					<div style="font-size: 50px; text-align:center; text-weight:700; color:white; text-shadow: 1px 5px 5px rgba(0,0,0,0.3);">먹놀자</div>
            						<div style="display:flex; margin-top:10px;">
						    			<label for="inputId" class="col-form-label " style="font-size:20px; margin-left:50px; color:white; text-shadow: 1px 5px 5px rgba(0,0,0,0.3);">아이디</label>
						    			<div class="">
							   				<input type="text" name="id" class="form-control " id="inputId" style="height: 100%;margin-left: 30px; width:290px;" required>
							   			</div>
							   		</div>
						   		</div>
						   	</div>
						</div>
	  		        </div>
	  		        	<div class="container-fluid text-center">
	  		        	<div class="mb-3 row justify-content-center" style="width:100%;"  >
	  		        		<div class="col">
            					<div  style="display:inLine-block; width:500px; height: 100%;">
            						<div style="display:flex">
						    			<label for="inputPassword" class="col-form-label " style="font-size:20px; margin-left:50px; color:white; text-shadow: 1px 5px 5px rgba(0,0,0,0.3);">비밀번호</label>
						    				<div class="">
							   				<input type="password" name="pwd" class="form-control " id="inputId" style="height: 100%;margin-left: 22px; width:290px" required >
							   			</div>
							   		</div>
						   		</div>
						   	</div>
						</div>
						
						<button class="loginB" style="width:80%; border-radius:20px; height:40px; font-size:20px; border:none; box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.3); border: 1px solid  #256D85; color:#256D85" >로그인</button>
						<div>
							<button class="logBu">
							
							</button>
							<button class="logBu">
							
							</button >
							<button class="logBu">
							
							</button >
						</div>	
						<div style="display:flex; text-align:center; margin-left:150px; color: white; margin-top:20px; margin-bottom:0px;">
						<div class="loginFind">아이디찾기</div>
						<div style="margin-left:20px;" class="loginFind">비밀번호찾기</div>
						</div>
						</div>
					</form>
					
					
				</div>
			</div>
		</div>
	</div>
    <script>
    	
    </script>
  </body>
</html>
