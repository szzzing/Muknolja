<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 추�??��?�? -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
        crossorigin="anonymous"></script>
	<style>
	body{
		
   		
   
   		

   		
   		}
	.c1{
		
	}

	.st{
		
		
	   	
	   	font-size: 1.5vw;
	   	font-weight:500;
	   	padding: 1%;
	   	
	   	text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
	   	
	}
		a{color: black;}
		.st:hover{
		
		
	   
	   	
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
		
		@font-face {
	    font-family: 'OTWelcomeRA';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
}
}
		
	</style>
</head>
<body style="font-family: 'OTWelcomeRA' ;margin:0px;padding:0px; left:0px;">
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>	
  	<!-- <div style="width:44vw; height:97vh; border-radius:5%; position:absolute; margin-top:2.5vh; margin-left: 50vw; background:rgb(239, 245, 245,0.6); z-index:-1;"> -->
  	<div style="padding:0px; margin:0px;width:100%; height:100%; background-image: url('${contextPath}/resources/img/water4.png'); background-size: 100vw 100vh;">
   	<div class="c1" style="background-image:url('${contextPath}/resources/img/main5.png'); width: 100%;
   		height: 100%;
   		background-repeat: no-repeat ;
   		background-size: 25vw 90vh;
   		background-position: 80% 50%;
   		">
   	   <img alt="1" id="poin" src="${contextPath}/resources/img/click.png"   style="position:absolute;  margin-top:7vh; margin-left: 13vw; width:2vw; height:4vh;">
	   <a id="a1" class="ac ad1"><div class="st" style="position:absolute; margin-top:7vh; margin-left: 56vw; color:white">경 Gyeong<br>기 ggi</div></a>
	   <a id="a2" class="ac ad2"><div class="st" style=" position:absolute; margin-top:21vh; margin-left: 55vw; color:white">서 Seo<br>울 Ul</div></a>
	   <a id="a3" class="ac ad3"><div class="st" style=" position:absolute; margin-top:12vh; margin-left: 81vw; color:white">강 Kang<br>원 Won</div></a>
	   <a id="a4" class="ac ad4"><div class="st" style=" position:absolute; margin-top:29vh; margin-left: 85vw; color:white">충 Chung<br>북 Buk</div></a>
	   <a id="a5" class="ac ad5"><div class="st" style=" position:absolute; margin-top:44vh; margin-left: 85vw; color:white">경 Gyeong<br>북 Buk</div></a>
	   <a id="a6" class="ac ad6"><div class="st" style=" position:absolute; margin-top:76vh; margin-left: 75vw; color:white">경 Gyeong<br>남 Nam</div></a>
	   <a id="a7" class="ac ad7"><div class="st" style=" position:absolute; margin-top:85.5vh; margin-left: 68vw; color:white">제 Je<br>주 Ju</div></a>
	   <a id="a8" class="ac ad8"><div class="st" style=" position:absolute; margin-top:65vh; margin-left: 53vw; color:white">전 Jeon<br>남 Nam</div></a>
	   <a id="a9" class="ac ad9"><div class="st" style=" position:absolute; margin-top:39vh; margin-left: 52vw; color:white">충 Chung<br>남 Nam</div></a>
	   <a id="a10" class="ac ad10"><div class="st" style=" position:absolute; margin-top:51vh; margin-left: 54vw; color:white">전 Jeon<br>북 Buk</div></a>
	   <div style="opacity:0.5; font-size:4vw; position:absolute; margin-top:30vh; margin-left: 46vw; font-weight:700; color:#F2F2F2">K<br>o<br>R<br>E<br>A</div>
	   <!-- <div style="font-size:4vw; font-weight:700; position:absolute; margin-top:2vh; margin-left: 2vw; text-shadow: 1px 5px 5px rgba(0,0,0,0.3);" >
	   먹놀자
	   
	   </div>  -->
	   <div style="position:absolute; margin-top:7vh; margin-left: 8vw; color:white; text-shadow: 1px 5px 5px rgba(0,0,0,0.3);">
	    <div style="font-size:2vw">먹놀자</div>
	    <div style="font-size:5vw; padding:0px; font-weight:800; color:white; text-shadow: 1px 5px 5px rgba(0,0,0,0.3);">MUKNOLJA</div>
	    </div>
	   <div class="we" id="we1" style=" font-weight:500;  position:absolute; margin-top:25vh; margin-left: 4vw; text-shadow: 1px 5px 5px rgba(0,0,0,0.3); width:30vw; height:35vh;  border-radius:10%" >
			<div style="margin-left:2vw; margin-top:1vh;"id="ttt"></div>
			
			<table style=" height:100%;background: radial-gradient(ellipse, white 0%, RGB(232, 232, 232) 100%); ;margin-top:2vh; margin-left:2vw;">
		     <tbody>
		     </tbody>
  		 </table>
  		 
	   </div> 
	   <div class="we" style="font-size:4vw; font-weight:700; position:absolute; margin-top:42vh; margin-left: 5vw; text-shadow: 1px 5px 5px rgba(0,0,0,0.3); width:30vw; height:57vh;  border-radius:10%" >
	   	
	   </div> 
	   <div id="epl" style=" font-size:4vw; text-shadow: 1px 5px 5px rgba(0,0,0,0.3);color:white">
			<div style="display:flex; position:absolute; margin-top:30vh; margin-left: 8vw;">
				먹<div style="margin-left: 1vw">  EAT</div>
			</div>
			<div style="display:flex; position:absolute; margin-top:40vh; margin-left: 8vw;">
				놀<div style="margin-left: 1vw">  PLAY</div>
			</div>
			<div style="display:flex; position:absolute; margin-top:50vh; margin-left: 8vw;">
				자<div style="margin-left: 1vw">  SLEEP</div>
			</div>
			</div>
   		</div> 
	</div>
	
   
	
    <script>
    var weather = null;
     // 서울 //
     $(document).ready(function () 
    		{	
    	 	
    	 $('.we').hide();
    	 var wiconUr11 = null;
    		    $('.ac').hover(function(){
    		    	$('#ttt').empty();
    		    	$('tbody').empty();
    		    	var num = $(this).attr('id').substr(1).trim();
    		    	var areaNum = "";
    		    	var vTop = "";
    		    	var vLeft = "";
    		    	var areaName = "";
    		    	var areaImg = "";
    		    	  switch (num)
    		    	  {
    		    	  case "2" :  //서울
    		    		 
    		    		  areaNum = "lat=37.5683&lon=126.9778";  
    		    		  vTop = "21.5vh"
    		    		  vLeft = "67.4vw"
    		    		  areaName = "서울";
    		    		  areaImg = "seoul.png";
    		    	      break;
    		    		
    		    	  case "1" :  //경기
    		    		
    		    		  areaNum = "lat=37.2911&lon=127.0089";  
    		    		  vTop = "16.5vh";
    		    		  vLeft = "67.5vw";
    		    		  areaName = "경기";
    		    		  areaImg = "gyeongggi.png";
    		    	      break;
    		    	  case "9" :  //충남
      		    		
    		    		  areaNum = "lat=36.8065&lon=127.1522";  
    		    		  vTop = "39vh";
    		    		  vLeft = "65.8vw";
    		    	      areaName = "충남";
    		    	      areaImg = "chungnam.png";
    		    	      break;
    		    	  case "3" :  //강원
      		    		
    		    		  areaNum = "lat=37.7556&lon=128.8961";  
    		    		  vTop = "18vh";
    		    		  vLeft = "74vw";
    		    		  areaName = "강원";
    		    		  areaImg = "kangwon.png";
    		    	      break;
    		    	  case "4" :  //
      		    		
    		    		  areaNum = "lat=36.6372&lon=127.4897";  
    		    		  vTop = "35vh";
    		    		  vLeft = "70.5vw";
    		    		  areaName = "충북";
    		    		  areaImg = "chungbuk.png";
    		    	      break;
    		    	  case "5" :  //
      		    		
    		    		  areaNum = "lat=35.8428&lon=129.2117";  
    		    		  vTop = "43vh"
    		    		  vLeft = "76vw"
    		    		  areaName = "경북";
    		    		  areaImg = "gyeongbuk.png";
    		    	      break;
    		    	  case "6" :  //
      		    		
    		    		  areaNum = "lat=35.5372&lon=129.3167";  
    		    		  vTop = "59vh";
    		    		  vLeft = "73.5vw";
    		    		  areaName = "경남";
    		    		  areaImg = "chungnam.png";
    		    	      break;
    		    	  case "7" :  //
      		    		
    		    		  areaNum = "lat=33.5097&lon=126.5219";  
    		    		  vTop = "85.5vh"
    		    		  vLeft = "63.7vw";
    		    		  areaName = "제주";
    		    		  areaImg = "jeju.png";
    		    	      break;
    		    	  case "8" :  //
      		    		
    		    		  areaNum = "lat=34.7546&lon=127.6599";  
    		    		  vTop = "66vh";
    		    		  vLeft = "66.5vw";
    		    		  areaName = "전남";
    		    		  areaImg = "gyeongnam.png";
    		    	      break;
    		    	  case "10" :  //
      		    		
    		    		  areaNum = "lat=35.8219&lon=127.1489";  
    		    		  vTop = "52vh"
    		    		  vLeft = "68vw"
    		    		  areaName = "전북";
    		    		  areaImg = "gyeongbuk.png";
    		    	      break;
    		    		
    		    	  }
    		    	console.log(num);
    		    	
    		    	$.getJSON('https://api.openweathermap.org/data/2.5/forecast?'+areaNum+
    		    			  '&appid=e126fab475a4d6908067f0cbb95cc8e9&units=metric',function(result){
    		    		var ctime1 = result.list[0].dt;
    		    		var ctemp1 = result.list[0].main.temp;
    		    		var hum1 = result.list[0].main.humidity;
    		    		var wind1 = result.list[0].wind.speed;
    		    		var cloud1 = result.list[0].clouds.all;
    		    		 wiconUr11 = '<img style="width:5vw; height:9vh"src="http://openweathermap.org/img/wn/'+result.list[0].weather[0].icon+
    		    		 			 '.png" alt="'+result.list[0].weather[0].description + '">'
    		    		 weather = result.list[0].weather[0].icon
    		    		var taHtml = '<div style="display:flex; color:white; font-size:4vw; margin-top:4vh; margin-left:7vw;"> '+ areaName + wiconUr11 +
    		    		             '<div style="font-size:2vw; margin-top:2vh">' + ctemp1 + '℃</div></div>' + 
    		    					 '<div style="font-size:1vw; margin-left:7vw; color:white"> 바람: ' + wind1 + 'm/s 습도: ' + hum1 + '% 구름: ' + cloud1 + '%</div>'+
    		    					 '<div><img alt="1" src="${contextPath}/resources/img/'+areaImg+
    		    					 '"style="margin-top: 3vh; margin-left: -3vw; position:absolute; width:40vw; height:40vh;">';    		    						
    		    					 $('#ttt').append(taHtml);
    		    		
    		    	});
    		       $('#epl').hide();
    		       $('.we').show();
    		       $('#poin').css('margin-top',vTop);
    		       $('#poin').css('margin-left',vLeft);
    		    }, function() {
    		    	$('#epl').show();
    		    	$('.we').hide();
    		    	$('#poin').css('margin-top','7vh');
    		    	  $('#poin').css('margin-left','13vw');
    		    });
    		});
  
	
	

	
	
  
	
    	
	
	
    	
  
	
	
	
	
	
		 $('#a2').click(function(){
			 location.href = "${ contextPath }/loding.me?load=seoul &weather=" + weather;
		}); 
		 $('#a1').click(function(){
			 location.href = "${ contextPath }/loding.me?load=gyeongggi &weather=" + weather;
		}); 
		$('#a3').click(function(){
			 location.href = "${ contextPath }/loding.me?load=kangwon &weather=" + weather;
		});
		$('#a4').click(function(){
			 location.href = "${ contextPath }/loding.me?load=chungbuk&weather=" + weather;
		});
		$('#a5').click(function(){
			 location.href = "${ contextPath }/loding.me?load=gyeongbuk &weather=" + weather;
		});
		$('#a6').click(function(){
			 location.href = "${ contextPath }/loding.me?load=gyeongnam &weather=" + weather;
		});
		
		$('#a7').click(function(){
			 location.href = "${ contextPath }/loding.me?load=jeju &weather=" + weather;
		});
		$('#a8').click(function(){
			 location.href = "${ contextPath }/loding.me?load=jeonnam &weather=" + weather;
		});
		$('#a9').click(function(){
			 location.href = "${ contextPath }/loding.me?load= chungnam &weather=" + weather;
		});
		$('#a10').click(function(){
			 location.href = "${ contextPath }/loding.me?load=jeonbuk &weather=" + weather;
		});
		
	

		
		
		
		
    </script>
   
    

</body>
</html>
