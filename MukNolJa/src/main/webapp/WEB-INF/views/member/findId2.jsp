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
          				<div style=" margin-top:5vh; font-size: 50px; font-weight:700; color:#6BB6EC; width: 800; height:100" onclick= "location.href='${contextPath }/home.do'">MUKNOLJA</div>
            				<div style="float:left;  margin-top: 4vh;">
		            			
		            				<label for="email" style="float:left; font-size:20px;">이메일</label>
		            				<br>
		            				<input type="text" value="${ id }" readonly name="email" id="email" class="email" style="width:500px; font-size:20px; padding:10px; padding-top:15px">
		            				<br>
		            	
			            		
			            			
			            			
			            			
			            			<div style="position:absolute; top:85%; margin-left:0vw;">
			            			
			            			</div>
		            			
		            		</div>
            		</div>
            		</div>
            	</div>
            	
            </div>
        </div>
     
  	
    
  </body>
</html>