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
   <body style=" width: 100vw; height: 100vh;" >
   <c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
   
    <div  style="width:100vw; height:100vh;">
    <div style="position:absolute; font-weight:700; color:white; margin-left: 5vw; margin-top:5vh; z-index:1" >MUKNOLJA</div>
    <div style="position:absolute; width:100vw; height:100vh; background-size:100vw 100vh; background-image: url('${contextPath }/resources/img/sky.jpg'); ">
	
	</div>
	<div style="opacity:0.3; width:30vw; height:100vh; position:absolute;  margin-left: 70vw;   z-index:1; background:black">
	1111
	</div>
	</div>
    <script>
    	
    </script>
  </body>
</html>
