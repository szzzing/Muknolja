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
    	.load {  
		  animation-name: load;
		  animation-duration: 2.5s;
		  animation-fill-mode: both;
		  margin-left:2vw;
		   
		}
		
		@keyframes load {
		  0% {
		    opacity: 0;
		    transform: translate3d(100%, -10%, 0);
		  }
		  100% {
		    opacity: 1;
		    transform: none;
		  }
		}
		
	
		.load.loada{
		 animation-delay: 0.3s;
		}
		.load.loadb{
		 animation-delay: 0.8s;
		}
		.load.loadc{
		 animation-delay: 1.3s;
		}
    </style>
  </head> 
   <body style="background-image: url('${contextPath }/resources/img/rain.jpg');" >
   <c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
   
   
     <div class="container-fluid text-center">
	  	<div class="row justify-content-center" style="width: 100%">
            <div class="col">
            	<div style=" display:inLine-block; width:1200px; height: 100vh; ">
	            <div style="margin-left:2vw; text-shadow: 1px 5px 5px rgba(0,0,0,0.3); font-size: 5vw; color: white; margin-top:20vh; font-weight: 700; text-shadow: 1px 5px 5px rgba(0,0,0,0.3);">
	            	<div style="display:flex">
						먹 <div style="font-size: 4vw;"class="load loada">EAT </div>
					</div>
					<div style="display:flex">
						놀 <div style="font-size: 4vw;" class="load loadb">play</div>
					</div>
					<div style="display:flex">
						자 <div style="font-size: 4vw;" class="load loadc">sleep</div>          	
	            	</div>
	            </div>
            		<c:if test="${load eq chungbuk}"> 
            		<img alt="1" style="width: 50vw; height:70vh; position:absolute; margin-top:-40vh; margin-left: -10vw;"src="${contextPath }/resources/img/1.png" > 
            		 <div></div>
            		</c:if>
            		
            		
            		
					
				</div>
			</div>
		</div>
	</div>
    <script>
    	
    </script>
  </body>
</html>