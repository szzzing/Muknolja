<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<script>
	$(function(){
		$('#daterangepicker').daterangepicker();
		$("#daterangepicker").daterangepicker({
		    locale: {
		    "separator": " ~ ",                     // 시작일시와 종료일시 구분자
		    "format": 'YYYY-MM-DD',     // 일시 노출 포맷
		    "applyLabel": "확인",                    // 확인 버튼 텍스트
		    "cancelLabel": "취소",                   // 취소 버튼 텍스트
		    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
		    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
		    },
		    autoApply: true,                         // 확인/취소 버튼 사용여부
		    timePicker24Hour: true,                  // 24시간 노출 여부(ex> true : 23:50, false : PM 11:50)
		    timePickerSeconds: true,                 // 초 노출 여부
// 		    singleDatePicker: true                   // 하나의 달력 사용 여부
		});
	});
</script>
<style>
	h1{text-align: center; margin-bottom: 30px;}
	#datepicker{cursor: pointer;}
	#title{margin-bottom: 30px;}
 	.compDate label{color: #3C988D; font-size: 13px;}
	#gender label{color: #3C988D; font-size: 13px;}
	.compNum input{accent-color: #3C988D;}
	.content{height: 400px; margin-bottom: 30px;}
	.content label{font-size: 20px;}
	#location1{border: 1px solid lightgray; height: 300px; margin-top: 20px; margin-bottom: 20px; border-radius: 5px;}
	#location2{border: 1px solid lightgray; height: 340px; border-radius: 5px;}
	#writeBtn button{background: #3C988D; border-color: #3C988D;}
 	#select{float: left;}
</style>
</head>
<body>

	<div class="container">
	
	<br><br><br><br><br><br>
	
		<h1>여행친구찾기</h1>
	
		<!-- 제목 -->
		<div id="title" class="input-group input-group-lg">
		  <span class="input-group-text" id="inputGroup-sizing-lg" style="background: #3C988D; color: white">제목</span>
		  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
		</div>
		
		<!-- 선택 -->
		<div class="row">
			<div class="col">
				<div class="compDate form-floating mb-3">
				   <input type="text" class="form-control" id="daterangepicker" name="daterangepicker">

				  <label for="floatingInput">날짜선택</label>
				</div>
			</div>
			
			<div class="col">
				<div id="gender" class="form-floating">
				  <select class="form-select" id="floatingSelect" aria-label="Floating label select example">
				    <option selected disabled>성별</option>
				    <option value="F">여자</option>
				    <option value="M">남자</option>
				  </select>
				  <label for="floatingSelect">성별</label>
				</div>
			</div>
			
			<div class="col">
				<div class="compNum form-floating mb-3">
				  <input type="range" class="form-control form-range" min="1" max="20">
				  <label for="floatingInput">모집인원</label>
				</div>
			</div>
		</div>
		
		<!-- 코스선택 -->
		<div class="row">
			<div class="col">
				<select id="select"class="form-select" aria-label="Default select example" style="width: 100px; margin-right: 10px;">
					<option selected>지역</option>
					<option value="1">One</option>
					<option value="2">Two</option>
					<option value="3">Three</option>
				</select>
				
				<div class="input-group" id="input" style="width: 220px;">
					<input type="text" class="form-control" placeholder="검색하기" aria-label="Recipient's username" aria-describedby="button-addon2">
					<button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="fa-solid fa-magnifying-glass"></i></button>
				</div>
				
				<div id="location1">
				
				</div>
			</div>
			
			<div class="col">
				<div id="location2">
				
				</div>
				
			</div>
		</div>
		
		<!-- 내용 -->
		<div class="content input-group">
		  <span class="input-group-text" style="background: #3C988D; color: white;">내용</span>
		  <textarea class="form-control" aria-label="With textarea" style="resize: none;"></textarea>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		<div id="writeBtn" class="col text-center">
			<button class="btn btn-primary" type="submit">작성하기</button>
		</div>
		
		<br><br>
		
		
	</div>
	
	<script>
	    $("#slider").on('input', function() {
	    	$("#compRange").html( $(this).val() );
	    });
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>