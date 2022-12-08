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
   
   		background: radial-gradient(ellipse at bottom,   rgb(0, 158, 255, 0.1) 0%,  white 100%);
   		}
	.c1{
		
	}

	.st{
		
		width: 8vw;;
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
		
	</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>	
  		
   	<div class="c1" style="background-image:url('${contextPath}/resources/img/main5.png'); width: 100vw;
   		height: 100vh;
   		background-repeat: no-repeat ;
   		background-size: 25vw 100vh;
   		background-position: 35% 100%;">
   	   <img alt="1" id="poin" src="${contextPath}/resources/img/click.png"   style="position:absolute;  margin-top:7vh; margin-left: 15vw; width:2vw; height:4vh;">
	   <a id="a1" href="${ contextPath }/home.do"><div class="st" style="position:absolute; margin-top:3vh; margin-left: 18vw;">경 Gyeong<br>기 ggi</div></a>
	   <a id="a2" href=""><div class="st" style=" position:absolute; margin-top:21vh; margin-left: 15vw;">서 Seo<br>울 Ul</div></a>
	   <a id="a3"href=""><div class="st" style=" position:absolute; margin-top:8vh; margin-left: 47vw;">강 Kang<br>원 Won</div></a>
	   <a id="a4"href=""><div class="st" style=" position:absolute; margin-top:26vh; margin-left: 51vw;">충 Chung<br>북 Buk</div></a>
	   <a id="a5"href=""><div class="st" style=" position:absolute; margin-top:47vh; margin-left: 52vw;">경 Gyeong<br>북 Buk</div></a>
	   <a id="a6"href=""><div class="st" style=" position:absolute; margin-top:73vh; margin-left: 47vw;">경 Gyeong<br>남 Nam</div></a>
	   <a id="a7"href=""><div class="st" style=" position:absolute; margin-top:82vh; margin-left: 35vw;">제 Je<br>주 Ju</div></a>
	   <a id="a8"href=""><div class="st" style=" position:absolute; margin-top:75vh; margin-left: 15vw;">전 Jeon<br>남 Nam</div></a>
	   <a id="a9"href=""><div class="st" style=" position:absolute; margin-top:40vh; margin-left: 16vw;">충 Chung<br>남 Nam</div></a>
	   <a id="a10"href=""><div class="st" style=" position:absolute; margin-top:58vh; margin-left: 13vw;">전 Jeon<br>북 Buk</div></a>
	 
	   <div style="font-size:4vw; font-weight:700; position:absolute; margin-top:2vh; margin-left: 2vw; text-shadow: 1px 5px 5px rgba(0,0,0,0.3);" >
	   먹놀자
	   <div style=" position:absolute; margin-top:2vh; margin-left: 1vw; font-size:2vw;">E<br>A<br>T</div>
	   <div style=" position:absolute; margin-top:2vh; margin-left: 5vw; font-size:2vw;">P<br>L<br>A<br>Y</div>
	   <div style=" position:absolute; margin-top:2vh; margin-left: 9.4vw; font-size:2vw;">S<br>L<br>E<br>E<br>P</div>
	   </div> 
	    <div class="we" id="we1" style="font-size:4vw; font-weight:700; position:absolute; margin-top:3vh; margin-left: 65vw; text-shadow: 1px 5px 5px rgba(0,0,0,0.3); width:30vw; height:35vh;  border-radius:10%" >
			<div style="margin-left:2vw; margin-top:1vh;"id="ttt"></div>
			<table style="margin-top:2vh; margin-left:2vw;">
		     <tbody>
		     </tbody>
  		 </table>
  		 
	   </div> 
	   <div class="we" style="font-size:4vw; font-weight:700; position:absolute; margin-top:42vh; margin-left: 65vw; text-shadow: 1px 5px 5px rgba(0,0,0,0.3); width:30vw; height:57vh;  border-radius:10%" >
	   	
	   </div> 
	   
   </div> 

   
	
    <script>
     $(document).ready(function () 
    		{	
    	 $('.we').hide();
			
    		    $('#a1').hover(function(){
    		       $('.we').show();
    		       $('#poin').css('margin-top','20vh');
    		       $('#poin').css('margin-left','33.5vw');
    		       
    		      
    		       
    		    }, function() {
    		    	$('.we').hide();
    		    	$('#poin').css('margin-top','7vh');
    		    	  $('#poin').css('margin-left','15vw');
    		    });
    		});
     
   
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
		var taHtml = '<div style="display:flex"> 서울 <div style="font-size: 2vw; margin-top:5vh;"> '+ currentTime1 + '</div></div>' + 
						
						'<div style="margin-left:15%">'+ wiconUr11 + ctemp1 + '</div>'+
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

		
     
		
		
		
		
	


    </script>
   
    

</body>
</html>
