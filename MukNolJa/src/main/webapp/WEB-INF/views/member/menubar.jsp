<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
   <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
     <script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <style>
    	 @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    	 .menul{
    	 font-size: 10px;}
    	 .menud{
    	 font-size: 20px;
    	 margin-left:50px;
    	 color:#65647C;}
    </style>
  </head>
  <body>
	
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
   	 <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
   	 <c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>
  	 <header id="header"  style="top:0; left:0; position:fixed; ">
     <div class="container-fluid text-center">
	  	<div class="row justify-content-center" style="width: 100vw; height:80px; background: white; box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.3);">
            <div class="col" style="width:1200px; height:80px; ">
            	<div style=" width:1200px; height:80px; display:inLine-block; " >
            		<div style="display:flex; float:left; ">
            		<div style="font-size:30px; margin-top:15px; color:#6BB6EC; font-weight: 900; ">MUKNOLJA</div>
            			<div class="menum" style="margin-top: 30px; display:flex">
	            		 <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color:#65647C; margin-left:30px;font-size: 20px;  font-family: 'HSYuji-Regular'; ">
			           	 여행
			          	</a>
				          <ul class="dropdown-menu">
				            <li><a class="dropdown-item menul" href="#">관광지</a></li>
				            <li><a class="dropdown-item menul" href="#">맛집</a></li>
				            <li><a class="dropdown-item menul" href="#">축제</a></li>
				          </ul>
		            		<div class="menud" style="margin-left:40px;">호텔</div>
		            		<div class="menud">후기</div>
		            		<div class="menud">동행</div>
	            			<div style="float:right; margin-left:550px; margin-top:-2px; display:flex">
	            				<h3 style=""><i class="fa-solid fa-comments"></i></h3>
	            				
	            				
		     				    
	            			</div>
	            		</div>
            		</div>
            	</div>
    		</div>
    	</div>
    </div>
    </header>
  </body>
</html>


