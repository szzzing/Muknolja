<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">


  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
    
        /*  폰트 */
        @font-face {
		    font-family: 'HSYuji-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/HSYuji-Regular.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
    	/* 박스크기 */
    	.mbox{
    	
        width: 58%;
    	box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
    	border-radius: 20%;
    	height: 100%;  
    	padding: 14% 0px;
    	}
    	
    	@keyframes mbox { from { opacity:0; } to { opacity:1; } }
	
		.mbox {
		 opacity:0;
		 animation:mbox ease-in 1;
		 animation-fill-mode:forwards;
		 animation-duration:1s;
		}
    	
    	
    	.mbox.m1 {
	  	animation-delay: 0.3s;
		}
		.mbox.m2 {
	  	animation-delay: 0.6s;
		}
		.mbox.m3 {
	  	animation-delay: 0.9s;
		}
		.mbox.m4 {
	  	animation-delay: 1.2s;
		}
		.mbox.m5 {
	  	animation-delay: 1.5s;
		}
		.mbox.m6 {
	  	animation-delay: 1.8s;
		}
    	
    </style>
  </head>
  <body style="margin-top:10%; background:#F2F2F2">
    
    
    <jsp:include page="menubar.jsp"/>
   	
     <div class="container-fluid text-center">
	  	<div class="row justify-content-center" style="width: 100%;  font-family: 'HSYuji-Regular';">
	  		<div style="display:flex">
			<img alt="1" src="${contextPath }/resources/img/men.png" width=7%; height=60%; style="margin-left:8%; margin-top:1%"   >
	  		<div class="col" style="font-size: 5vw; margin-right:56%; text-shadow: 1px 5px 5px rgba(0,0,0,0.3); font-weight: 900">마이페이지</div>
	  	</div>
	  	  
	  	</div>
	  	   <div class="row justify-content-center" style="width: 100%; font-family: 'HSYuji-Regular';">
	  	   
	  	   
	  	   <div class=col-sm-1></div>
	  	   
	  	  
            <div class="col-sm-3" style="height: 100%;  ">
            	<div class=".center-block" style="font-size: 2vw" >
            		<div class="mbox m1">내정보</div>
            		
            		<div class="mbox m4" style=" margin-top:20%;  ">문의내역조회</div>
            	
            	</div>
            </div>
            <div class="col-sm"></div>
             <div class="col-sm-3 " style="height: 100%;">
            	<div class=".center-block " style="font-size: 2vw; " >
            		<div class="mbox m2" >내가 쓴글 조회</div>
            		
            		<div class="mbox m5" style="margin-top:20%;">참여한 여행</div>
            	
            	</div>
            </div>
            
            
           
            <div class=col-sm></div>
             <div class="col-sm-3 col-xs-9" style="height: 100%; ">
            	<div class=".center-block" style="font-size: 2svw; " >
            		<div class="mbox m3" >찜목록 조회</div>
            		
            		<div class="mbox m6" style="margin-top:20%;">예약 현황</div>
            	
            	</div>
            </div>
            <div class="col-sm-1"></div>
        </div>
	</div>
	
    
  </body>
</html>
