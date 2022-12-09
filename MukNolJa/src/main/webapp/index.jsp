<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 추�??��?�? -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
        crossorigin="anonymous"></script>
	<style>
	body{
		margin-top:0;
		margin-left:0;
   		width: 100vw;
   		height: 100vh;
   
   		background: white;
   		}
	.c1{
		
	}

	.st{
		
		width: 8vw;
	   	box-shadow: 5px 5px 7px 0px rgba(0,0,0,0.3);
	   	border-radius:15%;
	   	
	   	font-size: 1.5vw;
	   	font-weight:600;
	   	padding: 1%;
	   	
	   	text-shadow: 1px 5px 5px rgba(0,0,0,0.3);
	   	
	}
		a{color: black;}
		.st:hover{
		
		width: 10vw;;
	   	box-shadow: 5px 5px 7px 0px rgba(0,0,0,0.3);
	   	border-radius:15%;
	   	
	   	font-size:2vw;
	   	font-weight:600;
	   	padding: 1%;
	   	
	   	text-shadow: 1px 5px 5px rgba(0,0,0,0.3);
		}
		
		#poin {  
		  animation-name: poin;
		  animation-duration: 1s;
		  animation-fill-mode: both;
		   animation-iteration-count: infinite;
		}
		@-webkit-keyframes poin {
		  0% {
		    opacity: 0;
		    transform: translate3d(0, -100%, 0);
		  }
		  100% {
		    opacity: 1;
		    transform: none;
		  }
		}
		@keyframes poin {
		  0% {
		    opacity: 0;
		    transform: translate3d(0, -100%, 0);
		  }
		  100% {
		    opacity: 1;
		    transform: none;
		  }
		}
		
		
		.ac {  
		  animation-name: poin;
		  animation-duration: 1s;
		  animation-fill-mode: both;
		   
		}
		
		@keyframes ac {
		  0% {
		    opacity: 0;
		    transform: translate3d(0, -100%, 0);
		  }
		  100% {
		    opacity: 1;
		    transform: none;
		  }
		}
		
	
		.ac.ad2{
		 animation-delay: 0.3s;
		}
		.ac.ad1{
		 animation-delay: 0.6s;
		}
		.ac.ad3{
		 animation-delay: 0.9s;
		}
		.ac.ad4{
		 animation-delay: 1.2s;
		}
		.ac.ad5{
		 animation-delay: 1.5s;
		}
		.ac.ad6{
		 animation-delay: 1.8s;
		}
		.ac.ad7{
		 animation-delay: 2.1s;
		}
		.ac.ad8{
		 animation-delay: 2.4s;
		}
		.ac.ad10{
		 animation-delay: 2.7s;
		}
		.ac.ad9{
		 animation-delay: 3s;
		}
	
		
	</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>	
  		
   	<div class="c1" style="background-image:url('${contextPath}/resources/img/POPO.PNG'); width: 100vw;
   		height: 100vh;
   		background-repeat: no-repeat ;
   		background-size: 30vw 100vh;
   		background-position: 32% 100%;">
   	   <img alt="1" id="poin" src="${contextPath}/resources/img/click.png"   style="position:absolute;  margin-top:7vh; margin-left: 15vw; width:2vw; height:4vh;">
	   <a id="a1" class="ac ad1" href="${ contextPath }/home.do"><div class="st" style="position:absolute; margin-top:3vh; margin-left: 18vw;">경 Gyeong<br>기 ggi</div></a>
	   <a id="a2" class="ac ad2"href=""><div class="st" style=" position:absolute; margin-top:21vh; margin-left: 15vw;">서 Seo<br>울 Ul</div></a>
	   <a id="a3" class="ac ad3"href=""><div class="st" style=" position:absolute; margin-top:8vh; margin-left: 47vw;">강 Kang<br>원 Won</div></a>
	   <a id="a4" class="ac ad4"href="${contextPath}/loding.me?load=chungbuk"><div class="st" style=" position:absolute; margin-top:26vh; margin-left: 51vw;">충 Chung<br>북 Buk</div></a>
	   <a id="a5" class="ac ad5"href=""><div class="st" style=" position:absolute; margin-top:47vh; margin-left: 52vw;">경 Gyeong<br>북 Buk</div></a>
	   <a id="a6" class="ac ad6"href=""><div class="st" style=" position:absolute; margin-top:73vh; margin-left: 47vw;">경 Gyeong<br>남 Nam</div></a>
	   <a id="a7" class="ac ad7"href=""><div class="st" style=" position:absolute; margin-top:82vh; margin-left: 35vw;">제 Je<br>주 Ju</div></a>
	   <a id="a8" class="ac ad8"href=""><div class="st" style=" position:absolute; margin-top:75vh; margin-left: 15vw;">전 Jeon<br>남 Nam</div></a>
	   <a id="a9" class="ac ad9"href=""><div class="st" style=" position:absolute; margin-top:40vh; margin-left: 16vw;">충 Chung<br>남 Nam</div></a>
	   <a id="a10" class="ac ad10"href=""><div class="st" style=" position:absolute; margin-top:58vh; margin-left: 13vw;">전 Jeon<br>북 Buk</div></a>
	 
	   <div style="font-size:4vw; font-weight:700; position:absolute; margin-top:2vh; margin-left: 2vw; text-shadow: 1px 5px 5px rgba(0,0,0,0.3);" >
	   먹놀자
	   
	   </div> 
	    <div class="we" id="we1" style="font-size:4vw; font-weight:700;  position:absolute; margin-top:3vh; margin-left: 65vw; text-shadow: 1px 5px 5px rgba(0,0,0,0.3); width:30vw; height:35vh;  border-radius:10%" >
			<div style="margin-left:2vw; margin-top:1vh;"id="ttt"></div>
			<table style=" height:100%;background: radial-gradient(ellipse, white 0%, RGB(232, 232, 232) 100%); ;margin-top:2vh; margin-left:2vw;">
		     <tbody>
		     </tbody>
  		 </table>
  		 
	   </div> 
	   <div class="we" style="font-size:4vw; font-weight:700; position:absolute; margin-top:42vh; margin-left: 65vw; text-shadow: 1px 5px 5px rgba(0,0,0,0.3); width:30vw; height:57vh;  border-radius:10%" >
	   	
	   </div> 
	   
   </div> 

   
	
    <script>
     // 서울 //
     $(document).ready(function () 
    		{	
    	 $('.we').hide();
			
    		    $('#a2').hover(function(){
    		    	$('#ttt').empty();
    		    	$('tbody').empty();
    		    	$.getJSON('https://api.openweathermap.org/data/2.5/forecast?lat=37.5683&lon=126.9778&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
    		    			result){
    		    		var ctime1 = result.list[0].dt
    		    		var ctemp1 = result.list[0].main.temp;
    		    		var hum1 = result.list[0].main.humidity;
    		    		var wind1 = result.list[0].wind.speed;
    		    		var cloud1 = result.list[0].clouds.all;
    		    		var wiconUr11 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[0].weather[0].icon+'.png" alt="'+result.list[0].weather[0].description + '">'
    		    		function convertTime1(ctime){
    		    			var ot = new Date(ctime * 1000);
    		    			
    		    			var dt = ot.getDate();
    		    			var hr = ot.getHours();
    		    			var m = ot.getMinutes();
    		    			return dt + '일:' + hr + '시' + m + '분' ;
    		    		}
    		    		var currentTime1 = convertTime1(ctime1);
    		    		var taHtml = '<div style="display:flex"> 서울 <div style="font-size: 2vw; margin-top:4vh;"> '+ currentTime1 + '</div></div>' + 
    		    						
    		    						'<div style="margin-left:15%">'+ wiconUr11 + ctemp1 + '℃</div>'+
    		    						'<div style="font-size:1.5vw;"> 바람: ' + wind1 + 'm/s 습도: ' + hum1 + '% 구름: ' + cloud1 + '%';
    		    						
    		    						$('#ttt').append(taHtml);
    		    		for(var i =1; i < 12; i=i+2){
    		    			var ctime = result.list[i].dt
    		    			var ctemp = result.list[i].main.temp;
    		    			var hum = result.list[i].main.humidity;
    		    			var wind = result.list[i].wind.speed;
    		    			var cloud = result.list[i].clouds.all;
    		    			var wiconUr1 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[i].weather[0].icon+'.png" alt="'+result.list[i].weather[0].description + '">'
    		    			function convertTime(ctime){
    		    				var ot = new Date(ctime * 1000);
    		    				var dt = ot.getDate();
    		    				var hr = ot.getHours();
    		    				var m = ot.getMinutes();
    		    				return dt + '일' + hr + '시' ;
    		    			}
    		    			var currentTime = convertTime(ctime);
    		    			var tableHtml = '<tr style="box-shadow: 0px 10px 30px 0px rgba(0,0,0,0.1); font-size:1.7vw; font-weight:600; padding:5vh 5vw; heigh:10vh"  >' +
    		    								'<td style="height:10vh">'+currentTime+'</td>' +
    		    								'<td>'+wiconUr1+'</td>' +
    		    								'<td style="width:7vw">'+ctemp+'℃</td>' + 
    		    								'<td style="width:5vw">'+wind+'m/s</td>' +
    		    							'</tr>';
    		    							$('tbody').append(tableHtml);
    		    		}
    		    	});
    		       $('.we').show();
    		       $('#poin').css('margin-top','20vh');
    		       $('#poin').css('margin-left','33.5vw');
    		    }, function() {
    		    	$('.we').hide();
    		    	$('#poin').css('margin-top','7vh');
    		    	  $('#poin').css('margin-left','15vw');
    		    });
    		});
  
	
	//경기
	
			
    		    $('#a1').hover(function(){
    		    	$('#ttt').empty();
    		    	$('tbody').empty();
    		    	$.getJSON('https://api.openweathermap.org/data/2.5/forecast?lat=37.2911&lon=127.0089&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
    		    			result){
    		    		var ctime1 = result.list[0].dt
    		    		var ctemp1 = result.list[0].main.temp;
    		    		var hum1 = result.list[0].main.humidity;
    		    		var wind1 = result.list[0].wind.speed;
    		    		var cloud1 = result.list[0].clouds.all;
    		    		var wiconUr11 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[0].weather[0].icon+'.png" alt="'+result.list[0].weather[0].description + '">'
    		    		function convertTime1(ctime){
    		    			var ot = new Date(ctime * 1000);
    		    			
    		    			var dt = ot.getDate();
    		    			var hr = ot.getHours();
    		    			var m = ot.getMinutes();
    		    			return dt + '일:' + hr + '시' + m + '분' ;
    		    		}
    		    		var currentTime1 = convertTime1(ctime1);
    		    		var taHtml = '<div style="display:flex"> 경기 <div style="font-size: 2vw; margin-top:4vh;"> '+ currentTime1 + '</div></div>' + 
    		    						
    		    						'<div style="margin-left:15%">'+ wiconUr11 + ctemp1 + '℃</div>'+
    		    						'<div style="font-size:1.5vw;"> 바람: ' + wind1 + 'm/s 습도: ' + hum1 + '% 구름: ' + cloud1 + '%';
    		    						
    		    						$('#ttt').append(taHtml);
    		    		for(var i =1; i < 12; i=i+2){
    		    			var ctime = result.list[i].dt
    		    			var ctemp = result.list[i].main.temp;
    		    			var hum = result.list[i].main.humidity;
    		    			var wind = result.list[i].wind.speed;
    		    			var cloud = result.list[i].clouds.all;
    		    			var wiconUr1 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[i].weather[0].icon+'.png" alt="'+result.list[i].weather[0].description + '">'
    		    			function convertTime(ctime){
    		    				var ot = new Date(ctime * 1000);
    		    				var dt = ot.getDate();
    		    				var hr = ot.getHours();
    		    				var m = ot.getMinutes();
    		    				return dt + '일' + hr + '시' ;
    		    			}
    		    			var currentTime = convertTime(ctime);
    		    			var tableHtml = '<tr style="box-shadow: 0px 10px 30px 0px rgba(0,0,0,0.1); font-size:1.7vw; font-weight:600; padding:5vh 5vw; heigh:10vh"  >' +
    		    								'<td style="height:10vh">'+currentTime+'</td>' +
    		    								'<td>'+wiconUr1+'</td>' +
    		    								'<td style="width:7vw">'+ctemp+'℃</td>' + 
    		    								'<td style="width:5vw">'+wind+'m/s</td>' +
    		    							'</tr>';
    		    							$('tbody').append(tableHtml);
    		    		}
    		    	});
    		       $('.we').show();
    		       $('#poin').css('margin-top','24.5vh');
    		       $('#poin').css('margin-left','35vw');
    		    }, function() {
    		    	$('.we').hide();
    		    	$('#poin').css('margin-top','7vh');
    		    	  $('#poin').css('margin-left','15vw');
    		    });
    		
// 천안
	$(document).ready(function () 
    		{	
    	 $('.we').hide();
			
    		    $('#a9').hover(function(){
    		    	$('#ttt').empty();
    		    	$('tbody').empty();
    		    	$.getJSON('http://api.openweathermap.org/data/2.5/forecast?lat=36.8065&lon=127.1522&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
    		    			result){
    		    		var ctime1 = result.list[0].dt
    		    		var ctemp1 = result.list[0].main.temp;
    		    		var hum1 = result.list[0].main.humidity;
    		    		var wind1 = result.list[0].wind.speed;
    		    		var cloud1 = result.list[0].clouds.all;
    		    		var wiconUr11 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[0].weather[0].icon+'.png" alt="'+result.list[0].weather[0].description + '">'
    		    		function convertTime1(ctime){
    		    			var ot = new Date(ctime * 1000);
    		    			
    		    			var dt = ot.getDate();
    		    			var hr = ot.getHours();
    		    			var m = ot.getMinutes();
    		    			return dt + '일:' + hr + '시' + m + '분' ;
    		    		}
    		    		var currentTime1 = convertTime1(ctime1);
    		    		var taHtml = '<div style="display:flex"> 천안 <div style="font-size: 2vw; margin-top:4vh;"> '+ currentTime1 + '</div></div>' + 
    		    						
    		    						'<div style="margin-left:15%">'+ wiconUr11 + ctemp1 + '℃</div>'+
    		    						'<div style="font-size:1.5vw;"> 바람: ' + wind1 + 'm/s 습도: ' + hum1 + '% 구름: ' + cloud1 + '%';
    		    						
    		    						$('#ttt').append(taHtml);
    		    		for(var i =1; i < 12; i=i+2){
    		    			var ctime = result.list[i].dt
    		    			var ctemp = result.list[i].main.temp;
    		    			var hum = result.list[i].main.humidity;
    		    			var wind = result.list[i].wind.speed;
    		    			var cloud = result.list[i].clouds.all;
    		    			var wiconUr1 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[i].weather[0].icon+'.png" alt="'+result.list[i].weather[0].description + '">'
    		    			function convertTime(ctime){
    		    				var ot = new Date(ctime * 1000);
    		    				var dt = ot.getDate();
    		    				var hr = ot.getHours();
    		    				var m = ot.getMinutes();
    		    				return dt + '일' + hr + '시' ;
    		    			}
    		    			var currentTime = convertTime(ctime);
    		    			var tableHtml = '<tr style="box-shadow: 0px 10px 30px 0px rgba(0,0,0,0.1); font-size:1.7vw; font-weight:600; padding:5vh 5vw; heigh:10vh"  >' +
    		    								'<td style="height:10vh">'+currentTime+'</td>' +
    		    								'<td>'+wiconUr1+'</td>' +
    		    								'<td style="width:7vw">'+ctemp+'℃</td>' + 
    		    								'<td style="width:5vw">'+wind+'m/s</td>' +
    		    							'</tr>';
    		    							$('tbody').append(tableHtml);
    		    		}
    		    	});
    		       $('.we').show();
    		       $('#poin').css('margin-top','39vh');
    		       $('#poin').css('margin-left','32.5vw');
    		    }, function() {
    		    	$('.we').hide();
    		    	$('#poin').css('margin-top','7vh');
    		    	  $('#poin').css('margin-left','15vw');
    		    });
    		});
  			
	// 강원
	$(document).ready(function () 
    		{	
    	 $('.we').hide();
			
    		    $('#a3').hover(function(){
    		    	$('#ttt').empty();
    		    	$('tbody').empty();
    		    	$.getJSON('http://api.openweathermap.org/data/2.5/forecast?lat=37.7556&lon=128.8961&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
    		    			result){
    		    		var ctime1 = result.list[0].dt
    		    		var ctemp1 = result.list[0].main.temp;
    		    		var hum1 = result.list[0].main.humidity;
    		    		var wind1 = result.list[0].wind.speed;
    		    		var cloud1 = result.list[0].clouds.all;
    		    		var wiconUr11 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[0].weather[0].icon+'.png" alt="'+result.list[0].weather[0].description + '">'
    		    		function convertTime1(ctime){
    		    			var ot = new Date(ctime * 1000);
    		    			
    		    			var dt = ot.getDate();
    		    			var hr = ot.getHours();
    		    			var m = ot.getMinutes();
    		    			return dt + '일:' + hr + '시' + m + '분' ;
    		    		}
    		    		var currentTime1 = convertTime1(ctime1);
    		    		var taHtml = '<div style="display:flex"> 강원 <div style="font-size: 2vw; margin-top:4vh;"> '+ currentTime1 + '</div></div>' + 
    		    						
    		    						'<div style="margin-left:15%">'+ wiconUr11 + ctemp1 + '℃</div>'+
    		    						'<div style="font-size:1.5vw;"> 바람: ' + wind1 + 'm/s 습도: ' + hum1 + '% 구름: ' + cloud1 + '%';
    		    						
    		    						$('#ttt').append(taHtml);
    		    		for(var i =1; i < 12; i=i+2){
    		    			var ctime = result.list[i].dt
    		    			var ctemp = result.list[i].main.temp;
    		    			var hum = result.list[i].main.humidity;
    		    			var wind = result.list[i].wind.speed;
    		    			var cloud = result.list[i].clouds.all;
    		    			var wiconUr1 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[i].weather[0].icon+'.png" alt="'+result.list[i].weather[0].description + '">'
    		    			function convertTime(ctime){
    		    				var ot = new Date(ctime * 1000);
    		    				var dt = ot.getDate();
    		    				var hr = ot.getHours();
    		    				var m = ot.getMinutes();
    		    				return dt + '일' + hr + '시' ;
    		    			}
    		    			var currentTime = convertTime(ctime);
    		    			var tableHtml = '<tr style="box-shadow: 0px 10px 30px 0px rgba(0,0,0,0.1); font-size:1.7vw; font-weight:600; padding:5vh 5vw; heigh:10vh"  >' +
    		    								'<td style="height:10vh">'+currentTime+'</td>' +
    		    								'<td>'+wiconUr1+'</td>' +
    		    								'<td style="width:7vw">'+ctemp+'℃</td>' + 
    		    								'<td style="width:5vw">'+wind+'m/s</td>' +
    		    							'</tr>';
    		    							$('tbody').append(tableHtml);
    		    		}
    		    	});
    		       $('.we').show();
    		       $('#poin').css('margin-top','17vh');
    		       $('#poin').css('margin-left','40.5vw');
    		    }, function() {
    		    	$('.we').hide();
    		    	$('#poin').css('margin-top','7vh');
    		    	  $('#poin').css('margin-left','15vw');
    		    });
    		});
	
	// 충북
	$(document).ready(function () 
    		{	
    	 $('.we').hide();
			
    		    $('#a4').hover(function(){
    		    	$('#ttt').empty();
    		    	$('tbody').empty();
    		    	$.getJSON('https://api.openweathermap.org/data/2.5/forecast?lat=36.6372&lon=127.4897&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
    		    			result){
    		    		var ctime1 = result.list[0].dt
    		    		var ctemp1 = result.list[0].main.temp;
    		    		var hum1 = result.list[0].main.humidity;
    		    		var wind1 = result.list[0].wind.speed;
    		    		var cloud1 = result.list[0].clouds.all;
    		    		var wiconUr11 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[0].weather[0].icon+'.png" alt="'+result.list[0].weather[0].description + '">'
    		    		function convertTime1(ctime){
    		    			var ot = new Date(ctime * 1000);
    		    			
    		    			var dt = ot.getDate();
    		    			var hr = ot.getHours();
    		    			var m = ot.getMinutes();
    		    			return dt + '일:' + hr + '시' + m + '분' ;
    		    		}
    		    		var currentTime1 = convertTime1(ctime1);
    		    		var taHtml = '<div style="display:flex"> 충북 <div style="font-size: 2vw; margin-top:4vh;"> '+ currentTime1 + '</div></div>' + 
    		    						
    		    						'<div style="margin-left:15%">'+ wiconUr11 + ctemp1 + '℃</div>'+
    		    						'<div style="font-size:1.5vw;"> 바람: ' + wind1 + 'm/s 습도: ' + hum1 + '% 구름: ' + cloud1 + '%';
    		    						
    		    						$('#ttt').append(taHtml);
    		    		for(var i =1; i < 12; i=i+2){
    		    			var ctime = result.list[i].dt
    		    			var ctemp = result.list[i].main.temp;
    		    			var hum = result.list[i].main.humidity;
    		    			var wind = result.list[i].wind.speed;
    		    			var cloud = result.list[i].clouds.all;
    		    			var wiconUr1 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[i].weather[0].icon+'.png" alt="'+result.list[i].weather[0].description + '">'
    		    			function convertTime(ctime){
    		    				var ot = new Date(ctime * 1000);
    		    				var dt = ot.getDate();
    		    				var hr = ot.getHours();
    		    				var m = ot.getMinutes();
    		    				return dt + '일' + hr + '시' ;
    		    			}
    		    			var currentTime = convertTime(ctime);
    		    			var tableHtml = '<tr style="box-shadow: 0px 10px 30px 0px rgba(0,0,0,0.1); font-size:1.7vw; font-weight:600; padding:5vh 5vw; heigh:10vh"  >' +
    		    								'<td style="height:10vh">'+currentTime+'</td>' +
    		    								'<td>'+wiconUr1+'</td>' +
    		    								'<td style="width:7vw">'+ctemp+'℃</td>' + 
    		    								'<td style="width:5vw">'+wind+'m/s</td>' +
    		    							'</tr>';
    		    							$('tbody').append(tableHtml);
    		    		}
    		    	});
    		       $('.we').show();
    		       $('#poin').css('margin-top','35vh');
    		       $('#poin').css('margin-left','37vw');
    		    }, function() {
    		    	$('.we').hide();
    		    	$('#poin').css('margin-top','7vh');
    		    	  $('#poin').css('margin-left','15vw');
    		    });
    		});
  
	// 경북
	$(document).ready(function () 
    		{	
    	 $('.we').hide();
			
    		    $('#a5').hover(function(){
    		    	$('#ttt').empty();
    		    	$('tbody').empty();
    		    	$.getJSON('https://api.openweathermap.org/data/2.5/forecast?lat=36.6372&lon=127.4897&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
    		    			result){
    		    		var ctime1 = result.list[0].dt
    		    		var ctemp1 = result.list[0].main.temp;
    		    		var hum1 = result.list[0].main.humidity;
    		    		var wind1 = result.list[0].wind.speed;
    		    		var cloud1 = result.list[0].clouds.all;
    		    		var wiconUr11 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[0].weather[0].icon+'.png" alt="'+result.list[0].weather[0].description + '">'
    		    		function convertTime1(ctime){
    		    			var ot = new Date(ctime * 1000);
    		    			
    		    			var dt = ot.getDate();
    		    			var hr = ot.getHours();
    		    			var m = ot.getMinutes();
    		    			return dt + '일:' + hr + '시' + m + '분' ;
    		    		}
    		    		var currentTime1 = convertTime1(ctime1);
    		    		var taHtml = '<div style="display:flex"> 경북 <div style="font-size: 2vw; margin-top:4vh;"> '+ currentTime1 + '</div></div>' + 
    		    						
    		    						'<div style="margin-left:15%">'+ wiconUr11 + ctemp1 + '℃</div>'+
    		    						'<div style="font-size:1.5vw;"> 바람: ' + wind1 + 'm/s 습도: ' + hum1 + '% 구름: ' + cloud1 + '%';
    		    						
    		    						$('#ttt').append(taHtml);
    		    		for(var i =1; i < 12; i=i+2){
    		    			var ctime = result.list[i].dt
    		    			var ctemp = result.list[i].main.temp;
    		    			var hum = result.list[i].main.humidity;
    		    			var wind = result.list[i].wind.speed;
    		    			var cloud = result.list[i].clouds.all;
    		    			var wiconUr1 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[i].weather[0].icon+'.png" alt="'+result.list[i].weather[0].description + '">'
    		    			function convertTime(ctime){
    		    				var ot = new Date(ctime * 1000);
    		    				var dt = ot.getDate();
    		    				var hr = ot.getHours();
    		    				var m = ot.getMinutes();
    		    				return dt + '일' + hr + '시' ;
    		    			}
    		    			var currentTime = convertTime(ctime);
    		    			var tableHtml = '<tr style="box-shadow: 0px 10px 30px 0px rgba(0,0,0,0.1); font-size:1.7vw; font-weight:600; padding:5vh 5vw; heigh:10vh"  >' +
    		    								'<td style="height:10vh">'+currentTime+'</td>' +
    		    								'<td>'+wiconUr1+'</td>' +
    		    								'<td style="width:7vw">'+ctemp+'℃</td>' + 
    		    								'<td style="width:5vw">'+wind+'m/s</td>' +
    		    							'</tr>';
    		    							$('tbody').append(tableHtml);
    		    		}
    		    	});
    		       $('.we').show();
    		       $('#poin').css('margin-top','43vh');
    		       $('#poin').css('margin-left','44vw');
    		    }, function() {
    		    	$('.we').hide();
    		    	$('#poin').css('margin-top','7vh');
    		    	  $('#poin').css('margin-left','15vw');
    		    });
    		});
	
	// 경남
	$(document).ready(function () 
    		{	
    	 $('.we').hide();
			
    		    $('#a6').hover(function(){
    		    	$('#ttt').empty();
    		    	$('tbody').empty();
    		    	$.getJSON('http://api.openweathermap.org/data/2.5/forecast?lat=35.5372&lon=129.3167&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
    		    			result){
    		    		var ctime1 = result.list[0].dt
    		    		var ctemp1 = result.list[0].main.temp;
    		    		var hum1 = result.list[0].main.humidity;
    		    		var wind1 = result.list[0].wind.speed;
    		    		var cloud1 = result.list[0].clouds.all;
    		    		var wiconUr11 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[0].weather[0].icon+'.png" alt="'+result.list[0].weather[0].description + '">'
    		    		function convertTime1(ctime){
    		    			var ot = new Date(ctime * 1000);
    		    			
    		    			var dt = ot.getDate();
    		    			var hr = ot.getHours();
    		    			var m = ot.getMinutes();
    		    			return dt + '일:' + hr + '시' + m + '분' ;
    		    		}
    		    		var currentTime1 = convertTime1(ctime1);
    		    		var taHtml = '<div style="display:flex"> 경남 <div style="font-size: 2vw; margin-top:4vh;"> '+ currentTime1 + '</div></div>' + 
    		    						
    		    						'<div style="margin-left:15%">'+ wiconUr11 + ctemp1 + '℃</div>'+
    		    						'<div style="font-size:1.5vw;"> 바람: ' + wind1 + 'm/s 습도: ' + hum1 + '% 구름: ' + cloud1 + '%';
    		    						
    		    						$('#ttt').append(taHtml);
    		    		for(var i =1; i < 12; i=i+2){
    		    			var ctime = result.list[i].dt
    		    			var ctemp = result.list[i].main.temp;
    		    			var hum = result.list[i].main.humidity;
    		    			var wind = result.list[i].wind.speed;
    		    			var cloud = result.list[i].clouds.all;
    		    			var wiconUr1 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[i].weather[0].icon+'.png" alt="'+result.list[i].weather[0].description + '">'
    		    			function convertTime(ctime){
    		    				var ot = new Date(ctime * 1000);
    		    				var dt = ot.getDate();
    		    				var hr = ot.getHours();
    		    				var m = ot.getMinutes();
    		    				return dt + '일' + hr + '시' ;
    		    			}
    		    			var currentTime = convertTime(ctime);
    		    			var tableHtml = '<tr style="box-shadow: 0px 10px 30px 0px rgba(0,0,0,0.1); font-size:1.7vw; font-weight:600; padding:5vh 5vw; heigh:10vh"  >' +
    		    								'<td style="height:10vh">'+currentTime+'</td>' +
    		    								'<td>'+wiconUr1+'</td>' +
    		    								'<td style="width:7vw">'+ctemp+'℃</td>' + 
    		    								'<td style="width:5vw">'+wind+'m/s</td>' +
    		    							'</tr>';
    		    							$('tbody').append(tableHtml);
    		    		}
    		    	});
    		       $('.we').show();
    		       $('#poin').css('margin-top','60vh');
    		       $('#poin').css('margin-left','40vw');
    		    }, function() {
    		    	$('.we').hide();
    		    	$('#poin').css('margin-top','7vh');
    		    	  $('#poin').css('margin-left','15vw');
    		    });
    		});
  
	
	// 제주
	$(document).ready(function () 
    		{	
    	 $('.we').hide();
			
    		    $('#a7').hover(function(){
    		    	$('#ttt').empty();
    		    	$('tbody').empty();
    		    	$.getJSON('http://api.openweathermap.org/data/2.5/forecast?lat=33.5097&lon=126.5219&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
    		    			result){
    		    		var ctime1 = result.list[0].dt
    		    		var ctemp1 = result.list[0].main.temp;
    		    		var hum1 = result.list[0].main.humidity;
    		    		var wind1 = result.list[0].wind.speed;
    		    		var cloud1 = result.list[0].clouds.all;
    		    		var wiconUr11 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[0].weather[0].icon+'.png" alt="'+result.list[0].weather[0].description + '">'
    		    		function convertTime1(ctime){
    		    			var ot = new Date(ctime * 1000);
    		    			
    		    			var dt = ot.getDate();
    		    			var hr = ot.getHours();
    		    			var m = ot.getMinutes();
    		    			return dt + '일:' + hr + '시' + m + '분' ;
    		    		}
    		    		var currentTime1 = convertTime1(ctime1);
    		    		var taHtml = '<div style="display:flex"> 제주 <div style="font-size: 2vw; margin-top:4vh;"> '+ currentTime1 + '</div></div>' + 
    		    						
    		    						'<div style="margin-left:15%">'+ wiconUr11 + ctemp1 + '℃</div>'+
    		    						'<div style="font-size:1.5vw;"> 바람: ' + wind1 + 'm/s 습도: ' + hum1 + '% 구름: ' + cloud1 + '%';
    		    						
    		    						$('#ttt').append(taHtml);
    		    		for(var i =1; i < 12; i=i+2){
    		    			var ctime = result.list[i].dt
    		    			var ctemp = result.list[i].main.temp;
    		    			var hum = result.list[i].main.humidity;
    		    			var wind = result.list[i].wind.speed;
    		    			var cloud = result.list[i].clouds.all;
    		    			var wiconUr1 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[i].weather[0].icon+'.png" alt="'+result.list[i].weather[0].description + '">'
    		    			function convertTime(ctime){
    		    				var ot = new Date(ctime * 1000);
    		    				var dt = ot.getDate();
    		    				var hr = ot.getHours();
    		    				var m = ot.getMinutes();
    		    				return dt + '일' + hr + '시' ;
    		    			}
    		    			var currentTime = convertTime(ctime);
    		    			var tableHtml = '<tr style="box-shadow: 0px 10px 30px 0px rgba(0,0,0,0.1); font-size:1.7vw; font-weight:600; padding:5vh 5vw; heigh:10vh"  >' +
    		    								'<td style="height:10vh">'+currentTime+'</td>' +
    		    								'<td>'+wiconUr1+'</td>' +
    		    								'<td style="width:7vw">'+ctemp+'℃</td>' + 
    		    								'<td style="width:5vw">'+wind+'m/s</td>' +
    		    							'</tr>';
    		    							$('tbody').append(tableHtml);
    		    		}
    		    	});
    		       $('.we').show();
    		       $('#poin').css('margin-top','90vh');
    		       $('#poin').css('margin-left','30vw');
    		    }, function() {
    		    	$('.we').hide();
    		    	$('#poin').css('margin-top','7vh');
    		    	  $('#poin').css('margin-left','15vw');
    		    });
    		});
  			
	// 전남
	$(document).ready(function () 
    		{	
    	 $('.we').hide();
			
    		    $('#a8').hover(function(){
    		    	$('#ttt').empty();
    		    	$('tbody').empty();
    		    	$.getJSON('https://api.openweathermap.org/data/2.5/forecast?lat=34.7546&lon=127.6599&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
    		    			result){
    		    		var ctime1 = result.list[0].dt
    		    		var ctemp1 = result.list[0].main.temp;
    		    		var hum1 = result.list[0].main.humidity;
    		    		var wind1 = result.list[0].wind.speed;
    		    		var cloud1 = result.list[0].clouds.all;
    		    		var wiconUr11 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[0].weather[0].icon+'.png" alt="'+result.list[0].weather[0].description + '">'
    		    		function convertTime1(ctime){
    		    			var ot = new Date(ctime * 1000);
    		    			
    		    			var dt = ot.getDate();
    		    			var hr = ot.getHours();
    		    			var m = ot.getMinutes();
    		    			return dt + '일:' + hr + '시' + m + '분' ;
    		    		}
    		    		var currentTime1 = convertTime1(ctime1);
    		    		var taHtml = '<div style="display:flex"> 전남 <div style="font-size: 2vw; margin-top:4vh;"> '+ currentTime1 + '</div></div>' + 
    		    						
    		    						'<div style="margin-left:15%">'+ wiconUr11 + ctemp1 + '℃</div>'+
    		    						'<div style="font-size:1.5vw;"> 바람: ' + wind1 + 'm/s 습도: ' + hum1 + '% 구름: ' + cloud1 + '%';
    		    						
    		    						$('#ttt').append(taHtml);
    		    		for(var i =1; i < 12; i=i+2){
    		    			var ctime = result.list[i].dt
    		    			var ctemp = result.list[i].main.temp;
    		    			var hum = result.list[i].main.humidity;
    		    			var wind = result.list[i].wind.speed;
    		    			var cloud = result.list[i].clouds.all;
    		    			var wiconUr1 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[i].weather[0].icon+'.png" alt="'+result.list[i].weather[0].description + '">'
    		    			function convertTime(ctime){
    		    				var ot = new Date(ctime * 1000);
    		    				var dt = ot.getDate();
    		    				var hr = ot.getHours();
    		    				var m = ot.getMinutes();
    		    				return dt + '일' + hr + '시' ;
    		    			}
    		    			var currentTime = convertTime(ctime);
    		    			var tableHtml = '<tr style="box-shadow: 0px 10px 30px 0px rgba(0,0,0,0.1); font-size:1.7vw; font-weight:600; padding:5vh 5vw; heigh:10vh"  >' +
    		    								'<td style="height:10vh">'+currentTime+'</td>' +
    		    								'<td>'+wiconUr1+'</td>' +
    		    								'<td style="width:7vw">'+ctemp+'℃</td>' + 
    		    								'<td style="width:5vw">'+wind+'m/s</td>' +
    		    							'</tr>';
    		    							$('tbody').append(tableHtml);
    		    		}
    		    	});
    		       $('.we').show();
    		       $('#poin').css('margin-top','68vh');
    		       $('#poin').css('margin-left','33vw');
    		    }, function() {
    		    	$('.we').hide();
    		    	$('#poin').css('margin-top','7vh');
    		    	  $('#poin').css('margin-left','15vw');
    		    });
    		});
	
	// 전북
	$(document).ready(function () 
    		{	
    	 $('.we').hide();
			
    		    $('#a10').hover(function(){
    		    	$('#ttt').empty();
    		    	$('tbody').empty();
    		    	$.getJSON('https://api.openweathermap.org/data/2.5/forecast?lat=35.8219&lon=127.1489&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
    		    			result){
    		    		var ctime1 = result.list[0].dt
    		    		var ctemp1 = result.list[0].main.temp;
    		    		var hum1 = result.list[0].main.humidity;
    		    		var wind1 = result.list[0].wind.speed;
    		    		var cloud1 = result.list[0].clouds.all;
    		    		var wiconUr11 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[0].weather[0].icon+'.png" alt="'+result.list[0].weather[0].description + '">'
    		    		function convertTime1(ctime){
    		    			var ot = new Date(ctime * 1000);
    		    			
    		    			var dt = ot.getDate();
    		    			var hr = ot.getHours();
    		    			var m = ot.getMinutes();
    		    			return dt + '일:' + hr + '시' + m + '분' ;
    		    		}
    		    		var currentTime1 = convertTime1(ctime1);
    		    		var taHtml = '<div style="display:flex"> 전북 <div style="font-size: 2vw; margin-top:4vh;"> '+ currentTime1 + '</div></div>' + 
    		    						
    		    						'<div style="margin-left:15%">'+ wiconUr11 + ctemp1 + '℃</div>'+
    		    						'<div style="font-size:1.5vw;"> 바람: ' + wind1 + 'm/s 습도: ' + hum1 + '% 구름: ' + cloud1 + '%';
    		    						
    		    						$('#ttt').append(taHtml);
    		    		for(var i =1; i < 12; i=i+2){
    		    			var ctime = result.list[i].dt
    		    			var ctemp = result.list[i].main.temp;
    		    			var hum = result.list[i].main.humidity;
    		    			var wind = result.list[i].wind.speed;
    		    			var cloud = result.list[i].clouds.all;
    		    			var wiconUr1 = '<img style="width:3.5vw; height:5vh"src="http://openweathermap.org/img/wn/'+result.list[i].weather[0].icon+'.png" alt="'+result.list[i].weather[0].description + '">'
    		    			function convertTime(ctime){
    		    				var ot = new Date(ctime * 1000);
    		    				var dt = ot.getDate();
    		    				var hr = ot.getHours();
    		    				var m = ot.getMinutes();
    		    				return dt + '일' + hr + '시' ;
    		    			}
    		    			var currentTime = convertTime(ctime);
    		    			var tableHtml = '<tr style="box-shadow: 0px 10px 30px 0px rgba(0,0,0,0.1); font-size:1.7vw; font-weight:600; padding:5vh 5vw; heigh:10vh"  >' +
    		    								'<td style="height:10vh">'+currentTime+'</td>' +
    		    								'<td>'+wiconUr1+'</td>' +
    		    								'<td style="width:7vw">'+ctemp+'℃</td>' + 
    		    								'<td style="width:5vw">'+wind+'m/s</td>' +
    		    							'</tr>';
    		    							$('tbody').append(tableHtml);
    		    		}
    		    	});
    		       $('.we').show();
    		       $('#poin').css('margin-top','52.5vh');
    		       $('#poin').css('margin-left','34.3vw');
    		    }, function() {
    		    	$('.we').hide();
    		    	$('#poin').css('margin-top','7vh');
    		    	  $('#poin').css('margin-left','15vw');
    		    });
    		});
  
	
		
		
	


    </script>
   
    

</body>
</html>
