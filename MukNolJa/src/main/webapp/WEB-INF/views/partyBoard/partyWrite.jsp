<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
 	.compDate label{color: #6BB6EC; font-size: 13px;}
	#gender label{color: #6BB6EC; font-size: 13px;}
	.compNum input{accent-color: #6BB6EC;}
	.content{height: 400px; margin-bottom: 30px;}
	.content label{font-size: 18px; color: #6BB6EC;}
	#location1{border: 1px solid lightgray; height: 300px; margin-top: 20px; margin-bottom: 20px; border-radius: 5px;}
	#location2{border: 1px solid lightgray; height: 355px; border-radius: 5px; overflow-x: auto;}
	ol.numbered {
	  list-style: none;
	  border-left: 3px solid #b3b3b3;
	  counter-reset: numbered-list;
	  margin-left: 100px;
	  margin-top: 20px;
	  position: relative;
	}
	ol.numbered li {
	  font-size: 16px;
	  line-height: 1.2;
	  margin-bottom: 30px;
	  padding-left: 10px;
	}
	ol.numbered li:last-child {
	  border-left: 3px solid white;
	  margin-left: -3px;
	}
	ol.numbered li:before {
	  background-color: #b3b3b3;
	  border: 3px solid white;
	  border-radius: 50%;
	  color: white;
	  content: counter(numbered-list, decimal);
	  counter-increment: numbered-list;
	  display: block;
	  font-weight: bold;
	  width: 30px;
	  height: 30px;
	  margin-top: -0.5em;
	  line-height: 30px;
	  position: absolute;
	  left: -17px;
	  text-align: center;
	}
	.mukButton {background: #6BB6EC; color:white; border-color: #6BB6EC;}
    .mukButton:hover {background: white; color: #6BB6EC; border-color: #6BB6EC; width: 100%;}
 	#select{float: left;}
 	#thumbnail{width: 100%; height: 400px; border-radius: 15px; margin-bottom: 30px; background: lightgray; color: white;}
 	#button-addon2{background: #6BB6EC; border-color: lightgray; color: white;}
	#button-addon2:hover{background: white; border-color: lightgray; color: #6BB6EC;}
</style>
</head>
<body>

	<div class="container">
	
	<br><br><br><br><br><br>
	
		<img src="${ contextPath }/resources/img/noImage.png" class="img-fluid" alt="..." id="thumbnail">
		<input id="myFile" type="file" accept="image/*" style="display:none;">
	
		<!-- 제목 -->
		<div id="title" class="input-group input-group-lg">
		  <span class="input-group-text" id="inputGroup-sizing-lg" style="background: #6BB6EC; color: white">제목</span>
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
				    <option value="F">여자만</option>
				    <option value="M">남자만</option>
				    <option value="M">무관</option>
				  </select>
				  <label for="floatingSelect">성별</label>
				</div>
			</div>
			
			<div class="col">
				<div class="compNum form-floating mb-3">
					<input type="number" class="form-control" min="1" max="20">
					<label for="floatingInput">동행인원</label>
				</div>
			</div>
		</div>
		
		<!-- 코스선택 -->
		<div class="row" style="margin-top: 20px;">
			<div class="col">
				<div class="row">
					<div class="col-md-3">
						<select id="select"class="form-select" aria-label="Default select example">
							<option selected>지역</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
					</div>
					
					<div class="col">
						<div class="input-group" id="input">
							<input type="text" class="form-control" placeholder="검색하기" aria-label="Recipient's username" aria-describedby="button-addon2">
							<button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
				</div>
				
				<div id="location1">
					
				</div>
			</div>
			
			<div class="col">
				<div id="location2">
					<ol class="numbered">
						<li>List item one</li>
						<li>List item two</li>
						<li>List item three</li>
						<li>List item four</li>
						<li>List item four</li>
						<li>List item four</li>
						<li>List item four</li>
						<li>List item four</li>
						<li>List item four</li>
						<li>List item four</li>
						<li>List item four</li>
					</ol>
				</div>
				
			</div>
		</div>
		
		<!-- 내용 -->
		
		<div class="content form-floating">
		  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 400px; resize: none;"></textarea>
		  <label for="floatingTextarea2">Content</label>
		</div>
		
		<div class="d-grid gap-2">
			<button type="submit" class="btn btn-outline-secondary mukButton" style="align:bottom !important">작성하기</button>
 		</div>
		
		<br><br>
		
		
	</div>
	
	<script>
	    $("#slider").on('input', function() {
	    	$("#compRange").html( $(this).val() );
	    });
	    
	    $("#thumbnail").click(function(){
	    	$('#myFile').click();
	    });

	    
	    const myFile = document.querySelector('#myFile');
	    const thumbnail = document.querySelector('#thumbnail');
	    
		    myFile.addEventListener('change', ()=>{
		    	const reader = new FileReader();
		    	reader.onload = function(e){
					console.log(e);		    		
		    		thumbnail.src = e.target.result;
		    	};
		    	reader.readAsDataURL(myFile.files[0]);
		    });
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>