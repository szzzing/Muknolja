<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    
    <style>
    body {
  background: #f2f2f2;
}

ul {
  margin-top:5%;
  box-shadow: 0px 10px 10px 0px rgba(0,0,0,0.3);
  margin-left:0px;
  
  
  
}

  li{
  font-size: 20px;
  font-weight: 600;
  width:100%;
  background: white;
  color: #575757;
  text-align: center;
  height: 60px;
  float:left;
  vertical-align: middle;
  line-height: 3em;
  border-bottom: 1px solid skyblue;
  position: relative;
  display: block;
  text-decoration: none;
  box-shadow: 0em 1.5em 0 ,lightgrey;
  transition: all .25s linear;
  }
  li:hover {
    background: #6BB6EC;
    color: #fffcfb;
    transform: translate(-.9em, -.9em);
    transition: all .25s linear;
    box-shadow: 0.5em 2em 0 #e1e1e1;
    }
    
    li{ 
      transition: all .25s linear; 
}
    
	.five:hover{
	font-size:30px;
	 width:50vw;
	 background:black;
	
	color:red;}
	
	@keyframes fadeInDown {
	  0% {
	    opacity: 0;
	    
	    
	       
	  }
	  100% {
	    opacity: 1;
	   
	    
	  }
	}
	.po1 {
	  transform: rotateY(40deg);
	  animation-name: fadeInDown;
	  animation-duration: 1s;
	  animation-fill-mode: both;
	}
	.po2 {
	 
	  animation-name: fadeInDown;
	  animation-duration: 2s;
	  animation-fill-mode: both;
	}
	.po3 {
	
	  animation-name: fadeInDown;
	  animation-duration: 3s;
	  animation-fill-mode: both;
	}
	.po4 {
	 
	  animation-name: fadeInDown;
	  animation-duration: 4s;
	  animation-fill-mode: both;
	}
	.po5 {
	 
	  animation-name: fadeInDown;
	  animation-duration: 4s;
	  animation-fill-mode: both;
	}
	.po{transform: rotateY(40deg);
    box-shadow: 70px 20px 10px 0px rgba(0,0,0,0.3);
    width:20%;
    height:20%;
    }
    
	.po:hover{
	 transform:  rotateY(360deg) ; 
	  box-shadow: 70px 20px 10px 0px rgba(0,0,0,0);
	 
	}
    </style>
  </head>
  <body style="margin-top:8% ">
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <jsp:include page="menubar.jsp"/>
   	
     <div class="container">
     	<div class="row">
		<div class="col" style="display:inLine-block">
		<br><br><br>
	  	
	  		
            <br><br>
            			<ul >
					    	<div style="display:flex; ">
						    	<li>서울</li>
						    	<li>인천</li>
						    	<li>대전</li>
						    	<li>대구</li>
						    	<li>광주</li>
						    	<li>부산</li>
						    	<li>울산</li>
						    	<li>세종</li>
						    	<li>경기</li>
						    	</div>
						    	<div style="display:flex;">
						    	<li>강원</li>
						    	<li>충북</li>
						    	<li>충남</li>
						    	<li>경북</li>
						    	<li>경남</li>
						    	<li>전북</li>
						    	<li>전남</li>
						    	<li>제주</li>
						    	<li>전체</li>
						    </div>
					    </ul>
					   <br>
					    
            	<div style="display:flex; margin-top:13%">
            	<h1 style="margin-top:10%;font-size:80px; float:left;"><i class="bi bi-caret-left"></i></h3>
            	<div class="po po1"style=" position:absolute; margin-left:12%;"><img alt="1" src="${contextPath }/resources/img/1.jpg" class="one" style="height:300px; width:100%; border-radius:4%;  background: blue; border: 1px solid lightgrey;"></div>
            	<div class="po po2"style="transform:  rotateY(40deg); margin-left:9%; position:absolute; z-index:-1"><img alt="1" src="${contextPath }/resources/img/2.jpg" class="two" style="height:300px; width:100%; border-radius:4%;  background: skyblue; border: 1px solid lightgrey;"></div>
            	<div class="po po3"style="transform:  rotateY(40deg); margin-left:6%;position:absolute;  z-index:-2;"><img alt="1" src="${contextPath }/resources/img/3.jpg" class="three" style="height:300px; width:100%; border-radius:4%;  background: green;  border: 1px solid lightgrey;"></div>
            	<div class="po po4"style="transform:  rotateY(40deg); margin-left:3%;position:absolute; z-index:-3;"><img alt="1" src="${contextPath }/resources/img/4.jpg" class="four" style="height:300px; width:100%; border-radius:4%;  background: red; border: 1px solid lightgrey;"></div>
            	
            	<div class="po po5"style="transform:  rotateY(40deg); margin-left:15%;position:absolute; ;z-index:-1;"><img alt="1" src="${contextPath }/resources/img/5.jpg" class="six" style="height:300px; width:100%; border-radius:4%;  background: red; border: 1px solid lightgrey;"></div>
            	<div class="po po6"style="transform:  rotateY(40deg); margin-left:18%;position:absolute; ;z-index:-2;"><img alt="1" src="${contextPath }/resources/img/5.jpg" class="six" style="height:300px; width:100%; border-radius:4%;  background: red; border: 1px solid lightgrey;"></div>
            	<div class="po po7"style="transform:  rotateY(40deg); margin-left:21%;position:absolute; ;z-index:-3;"><img alt="1" src="${contextPath }/resources/img/5.jpg" class="six" style="height:300px; width:100%; border-radius:4%;  background: red; border: 1px solid lightgrey;"></div>
            	<div class="po po8"style="transform:  rotateY(40deg); margin-left:24%;position:absolute; ;z-index:-4;"><img alt="1" src="${contextPath }/resources/img/5.jpg" class="six" style="height:300px; width:100%; border-radius:4%;  background: red; border: 1px solid lightgrey;"></div>
            	
            	<h1 style="float:center; right:0px; margin-right:0px;"><i style="float:center; right:0px; margin-right:0px;" class="bi bi-caret-right"></i></h3>
            	</div>
            	</div>
            </div>
       
       </div>
  
    
    <script>
  
    </script>
  </body>
</html>
    