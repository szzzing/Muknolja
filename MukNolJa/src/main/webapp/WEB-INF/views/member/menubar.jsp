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
    	.nav-link{color:white;
    			  font-weight: 600;
    			  text-shadow: 1px 5px 5px rgba(0,0,0,0.3);}
    	.navbar-brand{
    				color:#F2F2F2;
    				text-shadow:1px 1px 4px #cacaca,
					2px 2px 4px rgba(0, 0, 0, .3),
					3px 3px 6px rgba(0, 0, 0, .2),
					4px 4px 11px rgba(0, 0, 0, .1);
    				}
    				  /*  폰트 */
			        @font-face {
					    font-family: 'HSYuji-Regular';
					    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/HSYuji-Regular.woff') format('woff');
					    font-weight: normal;
					    font-style: normal;
					}
    </style>
  </head>
  <body>
   <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>
   <header id="header" style="top:0; left:0; position:fixed">
      <nav class="navbar navbar-expand-lg" style="background: radial-gradient(ellipse, #256D85 0%, #68A7AD 100%); box-shadow: 0px 20px 100px 0px rgba(0,0,0,0.2); font-family: 'HSYuji-Regular'; width:100%; position: fixed; z-index: 999; margin-top:0; padding:0">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="${ contextPath }/home.do" style="font-size: 2.5vw; margin-left: 2%; font-weight:500">먹놀자</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    
		    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin-top:2%; width:100%; margin-left:2%; ">
		      <ul class="navbar-nav me-auto mb-md-0" style="width:100%;">
		      	<li class="nav-item dropdown" style="margin-right:2%;">
		          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 1.4vw;">
		            여행
		          </a>
		          <ul class="dropdown-menu">
		            <li><a class="dropdown-item" href="#">관광지</a></li>
		            <li><a class="dropdown-item" href="#">맛집</a></li>
		            <li><a class="dropdown-item" href="#">축제</a></li>
		          </ul>
		        </li>
		        <li class="nav-item" style="margin-right:5%;">
		          <a class="nav-link" href="#" style="font-size: 1.4vw;">호텔</a>
		        </li>
		        <li class="nav-item" style="margin-right:5%;">
		          <a class="nav-link" href="#" style="font-size: 1.4vw;">후기</a>
		        </li>
		        
		        <li class="nav-item" style="margin-right:5%;">
		          <a class="nav-link" href="" style="font-size: 1.4vw;">동행</a>
		        </li>
		      </ul>
		      
		      
		      <div style="margin-right:2%; width:20%">
		      	<ul class="navbar-nav me-auto mb-2 md-lg-0" >
		      	<c:if test="${ !empty loginUser }">
		        <li class="nav-item" style="margin-right:5%; width:40%" >
		          <a class="nav-link " href="${ contextPath }/logout.me" style="font-size: 1.4vw; ">내정보</a>
		        </li>
		        </c:if>
		        <c:if test="${ empty loginUser }">
		        <li class="nav-item" style="margin-right:3%; width:40%" >
		          <a class="nav-link " href="${contextPath }/loginView.me" style="font-size: 1.4vw; ">로그인</a>
		        </li>
		        </c:if>
		        <c:if test="${ empty loginUser }">
		        <li class="nav-item" style=" width:50%">
		          <a class="nav-link" href="#" style="font-size: 1.4vw;">회원가입</a>
		        </li>
		        </c:if>
		        <c:if test="${ !empty loginUser }">
		        <li class="nav-item" style=" width:50%">
		          <a class="nav-link" href="${contextPath }/logout.me" style="font-size: 1.4vw;">로그아웃</a>
		        </li>
		        </c:if>
		        </ul>
		      </div>
		    </div>
		  </div>
		</nav>
		</header>
		<!-- <script>
		setTimeout(function() {
			location = "index.jsp";
			}, 3000);
		</script> -->
		
  </body>
</html>
    