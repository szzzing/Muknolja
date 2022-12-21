<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  </head>
  <body style="">
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <jsp:include page="../member/menubar.jsp"/>
   	
     <div class="container-fluid text-center">
	  	<div class="row justify-content-center shadow" style="min-height:100vh;   box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.3);">
            <div class="col-9" style=" min-height:100vh;">
		<br><br><br>
	  	
	  		
            <br><br>
	            <div class="row justify-content-center " style="  ">
	            	<div class="col" style="padding-left:0px; padding-right:0px;"  >
	            	
	
					
					
						<img src="${ contextPath }/resources/img/noImage.png" style="border-radius:10px; width:100%; height:450px">
						<input id="myFile" type="file" accept="image/*" style="display:none;">
						<br><br>
						<!-- 제목 -->
						<div id="title" class="input-group input-group-lg">
						  <span class="input-group-text" id="inputGroup-sizing-lg" style="background: #6BB6EC; color: white; width:7%; text-align:center">제목</span>
						  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
						</div>
	    				
	    			</div>
	    			</div>
	    			<br>
	    			<div class="row justify-content-center " style="padding-left:0px;  ">
	            	
	    				<div class="col-md-3" style="padding-left:0px; padding-right:0px; ">
						<select id="select"class="form-select" aria-label="Default select example">
							<option selected>분류</option>
							<option value="1">관광지</option>
							<option value="2">식당</option>
							<option value="3">축제</option>
						</select>
						<div style="float:left; font-size:30px; margin-top:10px; font-weight:500">00산</div>
					</div>
					
					<div class="col" style=" padding-right:0px;">
						<div class="input-group" id="input">
							<input type="text" class="form-control" placeholder="검색하기" aria-label="Recipient's username" aria-describedby="button-addon2">
							<button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
						
						
					</div>
					
					<div class="row justify-content-center " style="padding-left:0px; padding-right:0px; ">
	            				<div class="col-xl-8" style="padding-left:0px; padding-right:0px;"  >
	            					<textarea class="form-control" placeholder="입력해주세요"  style="width:99.5%;height: 450px; resize: none; border-radius:10px;"></textarea>
	            				
								</div>
								<div class="col" style="margin-top:0px; margin-bottom:30px; padding-:0px; background:; height:450px; border-radius:10px;  border:1px solid lightgray;"   >
									<img alt="1" src="${contextPath }/resources/img/1.jpg" width=100%; height=300px; style="border-radius:10px; margin-top:10px;" >
							</div>
						</div>
						
						
				</div>
					</div>
				</div>
			</div>
	
  </body>
</html>

    
