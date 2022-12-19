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

 .ur{
 box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.3);
 padding-left:0px;
  padding-bottom:0px;
  margin-left:0px;
  
  
  
}
li{list-style:none;}

  .ll{
  font-size: 20px;
  font-weight: 600;
  width:100%;
  
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
  .ll:hover {
    background: #6BB6EC;
    color: #fffcfb;
    transform: translate(-.9em, -.9em);
    transition: all .25s linear;
    box-shadow: 0.5em 2em 0 #e1e1e1;
    }
    
    .ll{
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
	
	
	
	.im{
		height:250px;
		width:260px;
		margin-right:40px;
		box-shadow: 5px 5px 5px 5px rgba(0,0,0,0.3);
		
		
		}
	.slide_wrapper{
		paddinf-left:0px;
		position: relative;
		margin-top:30px;
		
		height: 280px;
		overflow:hidden;
		display:flex;
		background:#F2F2F2;
		}
		.slides{
		  position: absolute;
		  display:flex;
		  transition:left 0.5s ease-out;
		  padding-left:0px;
		  left:0px;
		  width:3070px;
		 
		 }
		 .slides li{
		 float:left;
		 margin-right: 30px;
		 }
		 .slides li:not(:last-child){
		 	float:left;
		 	margin-right: 30px;
		 }
		 .
		 .controls{
		 text-laign: center;
		 
		 }
		 
		 .slide_wrapper1{
		paddinf-left:0px;
		position: relative;
		margin-top:30px;
		
		height: 280px;
		overflow:hidden;
		display:flex;
	
		}
		.slides1{
		  position: absolute;
		  display:flex;
		  transition:left 0.5s ease-out;
		  padding-left:0px;
		  left:0px;
		  width:3070px;
		 }
		 .slides1 li{
		 float:left;
		 margin-right: 30px;
		 }
		 .slides1 li:not(:last-child){
		 	float:left;
		 	margin-right: 30px;
		 }
		 .
		 .controls1{
		 text-laign: center;
		 
		 }
		
		
		.slide_wrapper2{
		paddinf-left:0px;
		position: relative;
		margin-top:30px;
		
		height: 280px;
		overflow:hidden;
		display:flex;
	
		}
		.slides2{
		  position: absolute;
		  display:flex;
		  transition:left 0.5s ease-out;
		  padding-left:0px;
		  left:0px;
		 width:3070px;
		 }
		 .slides2 li{
		 float:left;
		 margin-right: 30px;
		 }
		 .slides2 li:not(:last-child){
		 	float:left;
		 	margin-right: 30px;
		 }
		 .
		 .controls2{
		 text-laign: center;
		 
		 }
    </style>
  </head>
  <body style="">
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <jsp:include page="menubar.jsp"/>
   	
     <div class="container-fluid text-center">
	  	<div class="row justify-content-center shadow" style="min-width: 100vw;  min-height:100vh;   box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.3);">
            <div class="col-xl-9 col-lg-12" style=" min-height:100vh;">
		<br><br><br>
	  	
	  		
            <br><br>
            <div class="row justify-content-center " style="  ">
            <div class="col" style="padding-left:0px; padding-right:0px;"  >
            			<ul class="ur" >
					    	<div style="display:flex;" lass="ur1">
						    	<li class="ll">서울</li>
						    	<li class="ll">인천</li>
						    	<li class="ll">대전</li>
						    	<li class="ll">대구</li>
						    	<li class="ll">광주</li>
						    	<li class="ll">부산</li>
						    	<li class="ll">울산</li>
						    	<li class="ll">세종</li>
						    	<li class="ll">경기</li>
						    	</div>
						    	<div style="display:flex;">
						    	<li class="ll">강원</li>
						    	<li class="ll">충북</li>
						    	<li class="ll">충남</li>
						    	<li class="ll">경북</li>
						    	<li class="ll">경남</li>
						    	<li class="ll">전북</li>
						    	<li class="ll">전남</li>
						    	<li class="ll">제주</li>
						    	<li class="ll">전체</li>
						    </div>
					    </ul>
					   <br>
					   </div>
					   </div>
					   <div class="row justify-content-center" >
					   	<div class="col-10">
					   <div style="font-size:30px; margin-top:50px; font-weight:600; float: left; margin-l">관광지</div>
					   </div>
					   </div>
				<div class="row justify-content-center" style="margin-top:10px; box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.3);">
					
					<div class="col-1">
						<p class="controls">
            			<h3 class="prev" style="margin-top:70px;"><i class="bi bi-chevron-compact-left"></i></h3>
					</div>
					<div class="col-10" style="float: left;">   
					 
		            	<div class="slide_wrapper" >
		            		<ul class="slides">
		            			<li style="display:flex;">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im im1 " style="">
		            				<img alt="1" src="${contextPath }/resources/img/1.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/3.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/4.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/5.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/1.jpg" class="im " style="">
		            				<img alt="1" src="${contextPath }/resources/img/3.jpg" class="im " style="">
		            			</li>
		            		</ul>
		            		
		            		</div>
		            		</div>	 
		            		<div class="col-1">
            		<p class="controls">
            			
            			<h3 class="next" style="margin-top:70px;"><i class="bi bi-chevron-compact-right"></i></h3>
            		</p>
            		</div>
            	</div>
            	
            	<div class="row justify-content-center"  >
					   	<div class="col-10">
					   <div style="font-size:30px; margin-top:50px; font-weight:600; float: left; margin-l">맛집</div>
					   </div>
					   </div>
            	
            	<div class="row justify-content-center" style="margin-top:10px; box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.3);">
					<div class="col-1">
						<p class="controls1">
            			<h3 class="prev1" style="margin-top:70px;"><i class="bi bi-chevron-compact-left"></i></h3>
					</div>
					<div class="col-10" style="float: left;">    
		            	<div class="slide_wrapper1" >
		            		<ul class="slides1">
		            			<li style="display:flex;">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im " style="">
		            				<img alt="1" src="${contextPath }/resources/img/1.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/3.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/4.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/5.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im" style="">
		            			</li>
		            		</ul>
		            		
		            		</div>
		            		</div>	 
		            		<div class="col-1">
            		<p class="controls1">
            			
            			<h3 class="next1" style="margin-top:70px;"><i class="bi bi-chevron-compact-right"></i></h3>
            		</p>
            		</div>
            	</div>
            	<div class="row justify-content-center"  >
					   	<div class="col-10">
					   <div style="font-size:30px; margin-top:50px; font-weight:600; float: left; margin-l">축제</div>
					   </div>
					   </div>
            	
            	<div class="row justify-content-center" style="margin-top:10px; box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.3);">
					<div class="col-1">
						<p class="controls2">
            			<h3 class="prev2" style="margin-top:70px;"><i class="bi bi-chevron-compact-left"></i></h3>
					</div>
					<div class="col-10" style="float: left;">    
		            	<div class="slide_wrapper2" >
		            		<ul class="slides2">
		            			<li style="display:flex;">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im " style="">
		            				<img alt="1" src="${contextPath }/resources/img/1.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/3.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/4.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/5.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im" style="">
		            				<img alt="1" src="${contextPath }/resources/img/2.jpg" class="im" style="">
		            				
		            			</li>
		            		</ul>
		            		
		            		</div>
		            		</div>	 
		            		<div class="col-1">
            		<p class="controls2">
            			
            			<h3 class="next2" style="margin-top:70px;"><i class="bi bi-chevron-compact-right"></i></h3>
            		</p>
            		</div>
            	</div>
            </div>
       </div>
    </div>
    <script>
  		var slides = document.querySelector('.slides'),
  			slide =  document.querySelectorAll('.slides img'),
  			currentIdx = 0,
  			slideCount = 9,
  			prevBtn = document.querySelector('.prev');
  			nextBtn = document.querySelector('.next');
  			
  			
  			function moveSlide(num){
  				slides.style.left = -num * 290 + 'px';
  				currentIdx = num;
  			}
  			nextBtn.addEventListener('click',function(){
  				
  				if(currentIdx < slideCount - 1){
  					moveSlide(currentIdx + 1);
  					
  				}else{
  					moveSlide(0);
  				}
  				
  				
  			});
  			prevBtn.addEventListener('click',function(){
  				
  				if(currentIdx > 0){
  					moveSlide(currentIdx - 1);
  					
  				}else{
  					moveSlide(slideCount - 1);
  				}
  				
  				
  			});
  			
  			var slides1 = document.querySelector('.slides1'),
  			slide1 =  document.querySelectorAll('.slides1 img'),
  			currentIdx1 = 0,
  			slideCount1 = slide1.length,
  			prevBtn1 = document.querySelector('.prev1');
  			nextBtn1 = document.querySelector('.next1');
  			
  			
  			function moveSlide1(num){
  				slides1.style.left = -num * 290 + 'px';
  				currentIdx1 = num;
  			}
  			nextBtn1.addEventListener('click',function(){
  				
  				if(currentIdx1 < slideCount1 - 1){
  					moveSlide1(currentIdx1 + 1);
  					
  				}else{
  					moveSlide1(0);
  				}
  				
  				
  			});
  			prevBtn1.addEventListener('click',function(){
  				
  				if(currentIdx1 > 0){
  					moveSlide1(currentIdx1 - 1);
  					
  				}else{
  					moveSlide1(slideCount1 - 1);
  				}
  				
  				
  			});
  			
  			var slides2 = document.querySelector('.slides2'),
  			slide2 =  document.querySelectorAll('.slides2 img'),
  			currentIdx2 = 0,
  			slideCount2 = slide.length,
  			prevBtn2 = document.querySelector('.prev2');
  			nextBtn2 = document.querySelector('.next2');
  			
  			
  			function moveSlide2(num){
  				slides2.style.left = -num * 290 + 'px';
  				currentIdx2 = num;
  			}
  			nextBtn2.addEventListener('click',function(){
  				
  				if(currentIdx < slideCount2 - 1){
  					moveSlide2(currentIdx2 + 1);
  					
  				}else{
  					moveSlide2(0);
  				}
  				
  				
  			});
  			prevBtn2.addEventListener('click',function(){
  				
  				if(currentIdx2 > 0){
  					moveSlide2(currentIdx2 - 1);
  					
  				}else{
  					moveSlide2(slideCount2 - 1);
  				}
  				
  				
  			});
  			
  			
  			
    </script>
  </body>
</html>
    