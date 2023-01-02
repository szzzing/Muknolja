<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
        crossorigin="anonymous"></script>
    
    <style>
    	#album{
    		margin: 5% auto;
    		width 100%;
    		height: 100%;
    		}
    		.d1{
    		background-size:100% 100%;}
    </style>
  </head>
  <body style="">
  	<jsp:include page="../member/menubar.jsp"/>
   
  
   	
     
		<br><br><br>	<br><br><br>
		<div class="container-fluid text-center">
	  	<div class="row justify-content-center shadow" style=" min-height:100vh; border-radius:30px;   ">
            <div class="col-9 " style=" min-height:100vh;">
		<div id ="album">
				<div class="d1" style="background-image: url('${contextPath}/resources/img/sky.jpg');"></div>
	  			<div class="d1" style="background-image: url('${contextPath}/resources/img/water4.png');"></div>
	  			<div class="d1" style="background-image: url('${contextPath}/resources/img/2.jpg');"></div>
	  			<div class="d1" style="background-image: url('${contextPath}/resources/img/3.jpg');"></div>
	  			<div class="d1" style="background-image: url('${contextPath}/resources/img/4.jpg');"></div>
	  	</div>	
        
		</div>
		</div>
		</div>
		

	
	
	 <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/turn.js"></script>
	
	<script>
	
	$('#album').turn({gradients: true, acceleration: true});
	</script>
  </body>
</html>

    