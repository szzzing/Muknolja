<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
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
		
		
	  
		@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
		@keyframes fadeOut { from { opacity:1; } to { opacity:0; } }
		
		.fadeIn {
		  opacity:0;
		  
		  animation:fadeIn ease-in 1;
		  animation-fill-mode:forwards;
		  animation-duration:0s;
		  
		  }
		.fadeOut {  
		opacity:0;
		  animation:fadeOut ease-in 1;
		  animation-fill-mode:forwards;
		  animation-duration:1s;
		  
		}
		
		
		.fadeOut.f1 {
		
		  
		  animation-delay: 0s;
		}
		.fadeOut.f2 {
		
		  animation-delay: 1s;
		}
		.fadeOut.f3 {
		
		  animation-delay: 2s;
		}
		.fadeOut.f4 {
		
		  animation-delay: 3s;
		}
		.fadeOut.f5 {
		
		  animation-delay: 4s;
		}
		@font-face {
    font-family: 'OTWelcomeRA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
	
    </style>
  </head> 
   <body style=" width: 100vw; height: 100vh; font-family: 'OTWelcomeRA';" >
   
   <c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
   
    <div  style="width:100vw; height:100vh;">

    <div style="position:absolute; font-weight:700; color:white; margin-left: 5vw; margin-top:5vh; z-index:1" >MUKNOLJA</div>
  <c:if test="${  weather eq '02d' || weather eq '02n' ||  weather eq '03d' || weather eq '03n' }">
    <div style="position:absolute; width:100vw; height:100vh; background-size:100vw 100vh; background-image: url('${contextPath }/resources/img/few.jpg'); "></div>
    </c:if> 
    <c:if test="${ weather eq '01d' || weather eq '01n'}">
    <div style="position:absolute; width:100vw; height:100vh; background-size:100vw 100vh; background-image: url('${contextPath }/resources/img/sun1.jpg'); "></div>
    </c:if> 
    <c:if test="${ weather eq '04d' || weather eq '04n' }">
    <div style="position:absolute; width:100vw; height:100vh; background-size:100vw 100vh; background-image: url('${contextPath }/resources/img/cloud.jpg'); "></div>
    </c:if> 
    <c:if test="${ weather eq '10d' || weather eq '10n' ||  weather eq '09d' || weather eq '09n' }">
    <div style="position:absolute; width:100vw; height:100vh; background-size:100vw 100vh; background-image: url('${contextPath }/resources/img/rain1.jpg'); "></div>
    </c:if> 
    <c:if test="${ weather eq '11d' ||  weather eq '11n' }">
    <div style="position:absolute; width:100vw; height:100vh; background-size:100vw 100vh; background-image: url('${contextPath }/resources/img/sunder.jpg'); "></div>
    </c:if> 
    <c:if test="${ weather eq '13d' ||  weather eq '13n'}">
    <div style="position:absolute; width:100vw; height:100vh; background-size:100vw 100vh; background-image: url('${contextPath }/resources/img/snow.jpg'); "></div>
    </c:if> 
    <c:if test="${ weather eq '50d' || weather eq '50n' }">
    <div style="position:absolute; width:100vw; height:100vh; background-size:100vw 100vh; background-image: url('${contextPath }/resources/img/mist.jpg'); "></div>
    </c:if> 
    
	<div style="opacity:0.4; width:30vw; height:100vh; position:absolute;  margin-left: 70vw;   z-index:1; background:black">
	 <table style="margin-left:2vw; margin-top:5vh">
	 	<tbody>
	 		
	 	
	 	</tbody>
	 </table>
	</div>
	<div id="ttt" style="position:absolute;  margin-left: 5vw; margin-top:85vh; z-index:1"></div> 
	
 		<div class="fadeIn fadeOut f1"  style=" position:absolute; font-weight:700; font-size:2rem; margin-left: 46.2vw; margin-top:60.8vh; color:white">5</div>
 		<div class="fadeIn fadeOut f2"  style=" position:absolute; font-weight:700; font-size:2rem; margin-left: 46.2vw; margin-top:60.8vh; color:white">4</div>
 		<div class="fadeIn fadeOut f3"  style=" position:absolute; font-weight:700; font-size:2rem; margin-left: 46.2vw; margin-top:60.8vh; color:white">3</div>
 		<div class="fadeIn fadeOut f4"  style=" position:absolute; font-weight:700; font-size:2rem; margin-left: 46.2vw; margin-top:60.8vh; color:white">2</div>
 		<div class="fadeIn fadeOut f5"  style=" position:absolute; font-weight:700; font-size:2rem; margin-left: 46.2vw; margin-top:60.8vh; color:white">1</div>
 		
	</div>
	
     <script>
   		
		var load = '${ load }';
    		if( load.trim() == 'seoul'){
		    	$.getJSON('https://api.openweathermap.org/data/2.5/forecast?lat=37.5683&lon=126.9778&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
		    			result){
		    		
		    		var ctemp1 = result.list[0].main.temp;
		    		var taHtml = '<div style="display:flex; color:white; font-size:4vw;">'  + ctemp1 +  '℃<div style="font-size:2.5vw; margin-top:4vh; margin-left:1vw" > 서울 </div></div>' ;
		   			$('#ttt').append(taHtml); 
		    		for(var i =1; i < 18; i=i+2){
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
		    			var tableHtml = '<tr style="opacity:1; color:white;   margin-left: 3vw; font-size:1.3vw; font-weight:600;  heigh:10vh"  >' +
		    								'<td style="height:10vh; width:6vw">'+currentTime+'</td>' +
		    								'<td>'+wiconUr1+'</td>' +
		    								'<td style="width:5vw">'+ctemp+'℃</td>' + 
		    								'<td style="width:6vw">'+wind+'m/s</td>' +
		    								'<td style="width:5vw">'+hum+'%</td>' +
		    							'</tr>';
		    							 $('tbody').append(tableHtml); 
		    		}
		    	
		    	
		    	});
		    	
		    	
    		}else if( load.trim() == 'gyeongggi'){
		    	$.getJSON('https://api.openweathermap.org/data/2.5/forecast?lat=37.2911&lon=127.0089&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
		    			result){
		    		
		    		var ctemp1 = result.list[0].main.temp;
		    		var taHtml = '<div style="display:flex; color:white; font-size:4vw;">'  + ctemp1 +  '℃<div style="font-size:2.5vw; margin-top:4vh; margin-left:1vw" > 경기 </div></div>' ;
		   			$('#ttt').append(taHtml); 
		    		for(var i =1; i < 18; i=i+2){
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
		    			var tableHtml = '<tr style="opacity:1; color:white;   margin-left: 3vw; font-size:1.3vw; font-weight:600;  heigh:10vh"  >' +
		    								'<td style="height:10vh; width:6vw">'+currentTime+'</td>' +
		    								'<td>'+wiconUr1+'</td>' +
		    								'<td style="width:5vw">'+ctemp+'℃</td>' + 
		    								'<td style="width:6vw">'+wind+'m/s</td>' +
		    								'<td style="width:5vw">'+hum+'%</td>' +
		    							'</tr>';
		    							 $('tbody').append(tableHtml); 
		    		}
		    	
		    	
		    	});
		    	
    		}else if( load.trim() == 'chungnam'){
		    	$.getJSON('http://api.openweathermap.org/data/2.5/forecast?lat=36.8065&lon=127.1522&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
		    			result){
		    		
		    		var ctemp1 = result.list[0].main.temp;
		    		var taHtml = '<div style="display:flex; color:white; font-size:4vw;">'  + ctemp1 +  '℃<div style="font-size:2.5vw; margin-top:4vh; margin-left:1vw" > 충남 </div></div>' ;
		   			$('#ttt').append(taHtml); 
		    		for(var i =1; i < 18; i=i+2){
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
		    			var tableHtml = '<tr style="opacity:1; color:white;   margin-left: 3vw; font-size:1.3vw; font-weight:600;  heigh:10vh"  >' +
		    								'<td style="height:10vh; width:6vw">'+currentTime+'</td>' +
		    								'<td>'+wiconUr1+'</td>' +
		    								'<td style="width:5vw">'+ctemp+'℃</td>' + 
		    								'<td style="width:6vw">'+wind+'m/s</td>' +
		    								'<td style="width:5vw">'+hum+'%</td>' +
		    							'</tr>';
		    							 $('tbody').append(tableHtml); 
		    		}
		    	
		    	
		    	});
		    	
    		}else if( load.trim() == 'kangwon'){
		    	$.getJSON('http://api.openweathermap.org/data/2.5/forecast?lat=37.7556&lon=128.8961&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
		    			result){
		    		
		    		var ctemp1 = result.list[0].main.temp;
		    		var taHtml = '<div style="display:flex; color:white; font-size:4vw;">'  + ctemp1 +  '℃<div style="font-size:2.5vw; margin-top:4vh; margin-left:1vw" > 강원 </div></div>' ;
		   			$('#ttt').append(taHtml); 
		    		for(var i =1; i < 18; i=i+2){
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
		    			var tableHtml = '<tr style="opacity:1; color:white;   margin-left: 3vw; font-size:1.3vw; font-weight:600;  heigh:10vh"  >' +
		    								'<td style="height:10vh; width:6vw">'+currentTime+'</td>' +
		    								'<td>'+wiconUr1+'</td>' +
		    								'<td style="width:5vw">'+ctemp+'℃</td>' + 
		    								'<td style="width:6vw">'+wind+'m/s</td>' +
		    								'<td style="width:5vw">'+hum+'%</td>' +
		    							'</tr>';
		    							 $('tbody').append(tableHtml); 
		    		}
		    	
		    	
		    	});
		    	
    		}else if( load.trim() == 'chungbuk'){
		    	$.getJSON('https://api.openweathermap.org/data/2.5/forecast?lat=36.6372&lon=127.4897&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
		    			result){
		    		
		    		var ctemp1 = result.list[0].main.temp;
		    		var taHtml = '<div style="display:flex; color:white; font-size:4vw;">'  + ctemp1 +  '℃<div style="font-size:2.5vw; margin-top:4vh; margin-left:1vw" > 충북 </div></div>' ;
		   			$('#ttt').append(taHtml); 
		    		for(var i =1; i < 18; i=i+2){
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
		    			var tableHtml = '<tr style="opacity:1; color:white;   margin-left: 3vw; font-size:1.3vw; font-weight:600;  heigh:10vh"  >' +
		    								'<td style="height:10vh; width:6vw">'+currentTime+'</td>' +
		    								'<td>'+wiconUr1+'</td>' +
		    								'<td style="width:5vw">'+ctemp+'℃</td>' + 
		    								'<td style="width:6vw">'+wind+'m/s</td>' +
		    								'<td style="width:5vw">'+hum+'%</td>' +
		    							'</tr>';
		    							 $('tbody').append(tableHtml); 
		    		}
		    	
		    	
		    	});
		    	
    		}else if( load.trim() == 'gyeongbuk'){
		    	$.getJSON('https://api.openweathermap.org/data/2.5/forecast?lat=35.8428&lon=129.2117&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
		    			result){
		    		
		    		var ctemp1 = result.list[0].main.temp;
		    		var taHtml = '<div style="display:flex; color:white; font-size:4vw;">'  + ctemp1 +  '℃<div style="font-size:2.5vw; margin-top:4vh; margin-left:1vw" > 경북 </div></div>' ;
		   			$('#ttt').append(taHtml); 
		    		for(var i =1; i < 18; i=i+2){
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
		    			var tableHtml = '<tr style="opacity:1; color:white;   margin-left: 3vw; font-size:1.3vw; font-weight:600;  heigh:10vh"  >' +
		    								'<td style="height:10vh; width:6vw">'+currentTime+'</td>' +
		    								'<td>'+wiconUr1+'</td>' +
		    								'<td style="width:5vw">'+ctemp+'℃</td>' + 
		    								'<td style="width:6vw">'+wind+'m/s</td>' +
		    								'<td style="width:5vw">'+hum+'%</td>' +
		    							'</tr>';
		    							 $('tbody').append(tableHtml); 
		    		}
		    	
		    	
		    	});
		    	
    		
		    	
    		}else if( load.trim() == 'jeju'){
		    	$.getJSON('http://api.openweathermap.org/data/2.5/forecast?lat=33.5097&lon=126.5219&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
		    			result){
		    		
		    		var ctemp1 = result.list[0].main.temp;
		    		var taHtml = '<div style="display:flex; color:white; font-size:4vw;">'  + ctemp1 +  '℃<div style="font-size:2.5vw; margin-top:4vh; margin-left:1vw" > 제주 </div></div>' ;
		   			$('#ttt').append(taHtml); 
		    		for(var i =1; i < 18; i=i+2){
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
		    			var tableHtml = '<tr style="opacity:1; color:white;   margin-left: 3vw; font-size:1.3vw; font-weight:600;  heigh:10vh"  >' +
		    								'<td style="height:10vh; width:6vw">'+currentTime+'</td>' +
		    								'<td>'+wiconUr1+'</td>' +
		    								'<td style="width:5vw">'+ctemp+'℃</td>' + 
		    								'<td style="width:6vw">'+wind+'m/s</td>' +
		    								'<td style="width:5vw">'+hum+'%</td>' +
		    							'</tr>';
		    							 $('tbody').append(tableHtml); 
		    		}
		    	
		    	
		    	});
		    	
    		}else if( load.trim() == 'jeonnam'){
		    	$.getJSON('https://api.openweathermap.org/data/2.5/forecast?lat=34.7546&lon=127.6599&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
		    			result){
		    		
		    		var ctemp1 = result.list[0].main.temp;
		    		var taHtml = '<div style="display:flex; color:white; font-size:4vw;">'  + ctemp1 +  '℃<div style="font-size:2.5vw; margin-top:4vh; margin-left:1vw" > 전남 </div></div>' ;
		   			$('#ttt').append(taHtml); 
		    		for(var i =1; i < 18; i=i+2){
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
		    			var tableHtml = '<tr style="opacity:1; color:white;   margin-left: 3vw; font-size:1.3vw; font-weight:600;  heigh:10vh"  >' +
		    								'<td style="height:10vh; width:6vw">'+currentTime+'</td>' +
		    								'<td>'+wiconUr1+'</td>' +
		    								'<td style="width:5vw">'+ctemp+'℃</td>' + 
		    								'<td style="width:6vw">'+wind+'m/s</td>' +
		    								'<td style="width:5vw">'+hum+'%</td>' +
		    							'</tr>';
		    							 $('tbody').append(tableHtml); 
		    		}
		    	
		    	
		    	});
		    	
    		}else if( load.trim() == 'jeonbuk'){
		    	$.getJSON('https://api.openweathermap.org/data/2.5/forecast?lat=35.8219&lon=127.1489&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
		    			result){
		    		
		    		var ctemp1 = result.list[0].main.temp;
		    		var taHtml = '<div style="display:flex; color:white; font-size:4vw;">'  + ctemp1 +  '℃<div style="font-size:2.5vw; margin-top:4vh; margin-left:1vw" > 전북 </div></div>' ;
		   			$('#ttt').append(taHtml); 
		    		for(var i =1; i < 18; i=i+2){
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
		    			var tableHtml = '<tr style="opacity:1; color:white;   margin-left: 3vw; font-size:1.3vw; font-weight:600;  heigh:10vh"  >' +
		    								'<td style="height:10vh; width:6vw">'+currentTime+'</td>' +
		    								'<td>'+wiconUr1+'</td>' +
		    								'<td style="width:5vw">'+ctemp+'℃</td>' + 
		    								'<td style="width:6vw">'+wind+'m/s</td>' +
		    								'<td style="width:5vw">'+hum+'%</td>' +
		    							'</tr>';
		    							 $('tbody').append(tableHtml); 
		    		}
		    	
		    	
		    	});
    		}else if( load.trim() == 'gyeongnam'){
		    	$.getJSON('http://api.openweathermap.org/data/2.5/forecast?lat=35.5372&lon=129.3167&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(
		    			result){
		    		
		    		var ctemp1 = result.list[0].main.temp;
		    		var taHtml = '<div style="display:flex; color:white; font-size:4vw;">'  + ctemp1 +  '℃<div style="font-size:2.5vw; margin-top:4vh; margin-left:1vw" > 경남 </div></div>' ;
		   			$('#ttt').append(taHtml); 
		    		for(var i =1; i < 18; i=i+2){
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
		    			var tableHtml = '<tr style="opacity:1; color:white;   margin-left: 3vw; font-size:1.3vw; font-weight:600;  heigh:10vh"  >' +
		    								'<td style="height:10vh; width:6vw">'+currentTime+'</td>' +
		    								'<td>'+wiconUr1+'</td>' +
		    								'<td style="width:5vw">'+ctemp+'℃</td>' + 
		    								'<td style="width:6vw">'+wind+'m/s</td>' +
		    								'<td style="width:5vw">'+hum+'%</td>' +
		    							'</tr>';
		    							 $('tbody').append(tableHtml); 
		    		}
		    	
		    	
		    	});
    		}
   	
    		
    		
    		
    		
    		
    		setTimeout(function() {
    			location = "${ contextPath}/home.do";
    			}, 5000);
    </script> 
  </body>
</html>
