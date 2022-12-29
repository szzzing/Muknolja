<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<title>호텔 게시판</title>
<meta charset="utf-8">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

</head>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
  	* {font-family: 'Noto Sans KR', sans-serif;}
  	.form-control {border:2px solid #f1f1f1 !important; border-radius:20px !important}
	.form-select {border:2px solid #f1f1f1 !important; border-radius:20px !important}
  	input {font-family: 'Noto Sans KR', sans-serif;}
  	::-webkit-scrollbar {width:5px;}
	::-webkit-scrollbar-thumb {background-color:#e9e9e9; border-radius:10px;}
	::-webkit-scrollbar-track {opacity:0;}
	
	.subCategoryButton {
		display:none;
	}
 	
	.mukCheckbox { display: block; position: relative; padding-left: 25px; margin-bottom: 10px; cursor: pointer; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	.mukCheckbox input[type="checkbox"] { display: none; }
	.on { width: 18px; height: 18px; border:2px solid #f1f1f1; border-radius:5px; position: absolute; top:4px; left:0; }
	.mukCheckbox input[type="checkbox"]:checked + .on { background: #6BB6EC; border:2px solid #6BB6EC; }
	.on:after { content: ""; position: absolute; display: none; }
	.mukCheckbox input[type="checkbox"]:checked + .on:after { display: block; }
	.on:after { width: 6px; height: 10px; border: solid #fff; border-radius:1px; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 4px; bottom: 3px; }
	
	#hotelTable td {
		margin:0px;
		padding:0px;
	}
	.hotel {cursor:pointer}
    .mukRound {border-radius: 8px;}
	.mukButton {transition: all 0.5s; background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	.myHover:hover {cursor: pointer; background-color: rgba(205, 92, 92, 0.1);}
	.mukMutedText {color:#B9B9B9;}
	.mukSubText {color:rgba(0,0,0,.56);}
	
	
	input[type=range] {
		-webkit-appearance: none;
		width: 100%;
	}
	input[type=range]:focus {
		outline: none;
	}
	input[type=range]::-webkit-slider-runnable-track {
		width: 100%;
		height: 5px;
		cursor: pointer;
		transition: all 0.2s ease;
		background: #f1f1f1;
		border: 0px solid #000;
		border-radius: 5px;
	}
	input[type=range]::-webkit-slider-thumb {
		position: relative;
		border: 4px solid rgba(255, 255, 255, 0.5);
		height: 20px;
		width: 20px;
		border-radius: 100%;
		background: #6BB6EC;
		cursor: pointer;
		z-index: 1;
		-webkit-appearance: none;
		margin-top: -8px;
	}
	.range {
	  box-sizing: border-box;
	  position: relative;
	  padding: 0 50px;
	  width: 100%;
	}
</style>
<body>
	<jsp:include page="../member/menubar.jsp"/>
	
	<!-- 호텔 상세페이지용 폼 -->
	<form action="${contextPath }/hotelDetail.ho">
		<input type="hidden" name="hotelId">
		<input type="hidden" name="checkinDate">
		<input type="hidden" name="checkoutDate">
	</form>
	<!-- 호텔 상세페이지용 폼 -->
	
	<div class="container container-sm" style="margin-top:120px">
		<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-2 justify-content-start gx-5 gy-5">
			<div class="col col-lg-3">
				<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-1 p-3 pt-4 pb-4 mb-5" style="border:1px solid #f1f1f1">
					
					<div class="col">
						<div class="mb-5 pb-4" style="border-bottom:1px solid #f1f1f1">
							<div class="fw-bold pb-2" style="display:inline-block;">날짜</div>
							<small class="fw-bold mukSubText" style="float:right"><span class="value">1박 2일</span></small>
							<input type="text" class="form-control" id="daterangepicker" name="daterangepicker">
						</div>
					</div>
					<div id="subCategory" class="col">
						<div class="mb-5 pb-4" style="border-bottom:1px solid #f1f1f1">
							<div class="fw-bold pb-2" style="display:inline-block;">거리</div>
							<button id = "find-me">Show my location</button><br/>
							<p id = "status"></p>
							<a id = "map-link" target="_blank"></a>
							<small id="cancelDistance" class="mukSubText" style="display:none; float:right">초기화</small>
							<div style="float:right;" class="value fw-bold mukSubText">무관</div>
							<input id="maxDistance" name="maxDistance" class="mukRange" value="0" max="100" min="10" step="10" type="range">
						</div>
						<div class="mb-5 pb-4" style="border-bottom:1px solid #f1f1f1">
							<div class="fw-bold pb-2">가격</div>
							<small id="cancelPrice" class="mukSubText" style="display:none; float:right"><i class="bi bi-x-lg"></i></small>
							<div class="value mukSubText" style="float:right"><span class="value">무관</div>
							<input id="maxPrice" name="maxPrice" class="mukRange" value="0" max="100" min="10" step="10" type="range">
						</div>
						<div class="mb-5 pb-4" style="border-bottom:1px solid #f1f1f1">
							<div class="fw-bold pb-2">등급</div>
							<div class="row row-cols-3 row-cols-sm-3 row-cols-md-3 row-cols-lg-2">
								<div class="col">
									<label for=5star class="mukCheckbox">
										<input type="checkbox" name="star" id="5star" value="5"><span class="on"></span>
										5성급
									</label>
								</div>
								<div class="col">
									<label for=4star class="mukCheckbox">
										<input type="checkbox" name="star" id="4star" value="4"><span class="on"></span>
										4성급
									</label>
								</div>
								<div class="col">
									<label for=3star class="mukCheckbox">
										<input type="checkbox" name="star" id="3star" value="3"><span class="on"></span>
										3성급
									</label>
								</div>
								<div class="col">
									<label for=2star class="mukCheckbox">
										<input type="checkbox" name="star" id="2star" value="2"><span class="on"></span>
										2성급
									</label>
								</div>
								<div class="col">
									<label for=1star class="mukCheckbox">
										<input type="checkbox" name="star" id="1star" value="1"><span class="on"></span>
										1성급
									</label>
								</div>
							</div>
						</div>
						<div>
							<div class="fw-bold pb-2">시설</div>
							<div class="row row-cols-3 row-cols-sm-3 row-cols-md-3 row-cols-lg-2">
								<div class="col">
									<label for="wifi" class="mukCheckbox">
										<input type="checkbox" name='install' id="wifi"><span class="on"></span>
										와이파이
									</label>
								</div>
								<div class="col">
									<label for="breakfast" class="mukCheckbox">
										<input type="checkbox" name='install' id="breakfast"><span class="on"></span>
										조식
									</label>
								</div>
								<div class="col">
									<label for="amenity" class="mukCheckbox">
										<input type="checkbox" name='install' id="amenity"><span class="on"></span>
										어메니티
									</label>
								</div>
								<div class="col">
									<label for="park" class="mukCheckbox">
										<input type="checkbox" name='install' id="park"><span class="on"></span>
										주차
									</label>
								</div>
								<div class="col">
									<label for="swim" class="mukCheckbox">
										<input type="checkbox" name='install' id="swim"><span class="on"></span>
										수영장
									</label>
								</div>
								<div class="col">
									<label for="fitness" class="mukCheckbox">
										<input type="checkbox" name='install' id="fitness"><span class="on"></span>
										피트니스
									</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col col-lg-9">
			
				<div id="hotelList" class="row row-cols-1 row-cols-sm-1 row-cols-lg-1 justify-content-start g-5">
					<div id="hotelDiv" class="hotel col pb-3" style="border-bottom:1px solid #f1f1f1; display:none">
						<div class="row g-3">
							<div class="col col-sm-6 col-lg-5">
								<img class="hotelImg img-fluid mukRound" src="#" style="background: #f1f1f1">
							</div>
							<div class="col col-sm-6 col-lg-7">
								<table id="hotelTable" class="table table-borderless" style="margin-bottom:0px; height:100%">
									<tr><td colspan="2">
										<input type="hidden" class="hotelId">
										<small class="hotelStar text-center" style="background:#6BB6EC; border-radius:5px; color:white; padding:2px 5px;"></small>
										<h4 class="hotelName lh-1 mt-1 fw-bold" style="display:inline-block"></h4>
										<span class="maxDistance mukMutedText"></span><br>
										<span class="hotelAddress mukMutedText"></span>
									</td></tr>
									<tr>
										<td class="align-bottom">
											<h4 class="fw-bold"><i class="fa-solid fa-star" style="color:#FFD600"></i>
											<span class="avgRating"></span></h4>
										</td>
										<td class="align-bottom text-end">
											<h4 class="minPrice lh-1 fw-bold text-right"></h4>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- 호텔 검색 시작 -->
	<script>
		$(document).ready(function(){
			var hotelDiv = $("#hotelDiv").clone();
			var searchPrice=false;
			var searchDistance=false;
			
			var star = new Array();
			var install = new Array('N','N','N','N','N','N');
		
			$.search = function(){
				var page = 1;
				var searchValue = "";
		// 		var searchValue = $('input[name=searchValue]').val();
				var checkinDate = $("input[name=checkinDate]").val()+"";
				var checkoutDate = $("input[name=checkoutDate]").val()+"";
				var maxPrice = $("input[name=maxPrice]").val();
				var maxDistance = $("input[name=maxDistance]").val();
				if(!searchPrice){
					maxPrice = 0;
				}
				if(!searchDistance){
					maxDistance = 0;
				}
				console.log(star);
				console.log(install);
				
				$.ajax({
					url: "${contextPath}/searchHotelList.ho",
					traditional : true,
					data: {
						page: page,
						searchValue: searchValue,
						checkinDate: checkinDate,
						checkoutDate: checkoutDate,
						maxPrice: maxPrice,
						maxDistance: maxDistance,
						star: star,
						install: install
					},
					success: (data)=>{
						var hotelDiv2 = hotelDiv.clone();
						
						const inout = $("#daterangepicker").val().split(" - ");
						
						const checkin = new Date(inout[0]);
						const checkout = new Date(inout[1]);
						
						var diff = checkout - checkin;
						var currDay = 24 * 60 * 60 * 1000;
						var journey = parseInt(diff/currDay);
						console.log(journey);
						
						$("#hotelList").html("");
						hotelDiv.prop("style").removeProperty("display");
						for(var i of data) {
							hotelDiv2.find(".hotelId").val(i.hotelId);
							hotelDiv2.find(".hotelName").html(i.hotelName);
							hotelDiv2.find(".hotelAddress").html(i.hotelAddress);
							hotelDiv2.find(".minPrice").html((i.minPrice*journey).toLocaleString()+"원~");
							if(i.emptyHotel==0) {
								hotelDiv2.find(".minPrice").html("예약마감");
							}
							hotelDiv2.find(".hotelImg").prop("src", "${contextPath }/resources/uploadFiles/"+i.thumbnail);
							hotelDiv2.find(".hotelStar").html(i.star+"성급");
							hotelDiv2.find(".avgRating").html(i.avgRating.toFixed(1));
							if(searchDistance) {
								if(searchDistance<0) {
									hotelDiv2.find(".maxDistance").html(i.maxDistance.toFixed(1)+"km 거리");
								} else {
									hotelDiv2.find(".maxDistance").html(i.maxDistance.toFixed(0)+"km 거리");
								}
							}
							if(i.avgRating==0) {
								hotelDiv2.find(".avgRating").html(i.avgRating.toFixed(0));
							}
							$("#hotelList").append('<div class="hotel col pb-3" style="border-bottom:1px solid #f1f1f1">'+hotelDiv2.html()+'</div>');
						}
					},
					error: (data)=>{
						console.log(data);
					}
				});
			}
			$.search();
			
			
			$("input[name=star]").on("click", function(){
				star = new Array();
				for(var i of $("input[name='star']")) {
					if(i.checked) {
						star.push(i.value);
					}
				}
				$.search();
			});
		
			$("input[name=install]").on("click", function(){
				install = new Array();
				for(var i of $("input[name='install']")) {
					if(i.checked) {
						install.push("Y");
					} else {
						install.push("N");
					}
				}
				$.search();
			});
					
			$("input[name=maxPrice]").on("change", function(){
				searchPrice = true;
				$(this).parent().find(".value").text($(this).val()+"만원 이하");
				$("#cancelPrice").prop("style").removeProperty("display");
				$.search();
			});
			
			$("input[name=maxDistance]").on("change", function(){
				searchDistance = true;
				$(this).parent().find(".value").html($(this).val()+"km 이내");
				$("#cancelDistance").prop("style").removeProperty("display");
				$.search();
			});
			
			$("#cancelPrice").on("click", function(){
				searchPrice = false;
				$("input[name=maxPrice]").val(10);
				$("input[name=maxPrice]").parent().find(".value").text($(this).val()+"무관");
				$(this).css("display", "none");
				$.search();
			});
			
			$("#cancelDistance").on("click", function(){
				searchDistance = false;
				$("input[name=maxDistance]").val(10);
				$("input[name=maxDistance]").parent().find(".value").text($(this).val()+"무관");
				$(this).css("display", "none");
				$.search();
			});
			
			$(document).on('click', '.hotel', function(){
// 				location.href="${contextPath}/hotelDetail.ho?hotelId="+$(this).find(".hotelId").val();
				$("input[name=hotelId]").val($(this).find(".hotelId").val());
				$("form").submit();
			});
		});
	</script>
	<!-- 호텔 검색 끝 -->
	
	
	<!-- 위치 -->
	<script>
		function geoFindMe() {

		  const status = document.querySelector('#status');
		  const mapLink = document.querySelector('#map-link');
		
		  mapLink.href = '';
		  mapLink.textContent = '';
		
		  function success(position) {
		    const latitude  = position.coords.latitude;
		    const longitude = position.coords.longitude;
		
		    status.textContent = latitude + ", " + longitude;
		    console.log("성공");
		    console.log(latitude);
		    console.log(longitude);
		  }
		  function error() {
		    status.textContent = 'Unable to retrieve your location';
		    console.log("실패");
		  }
		
		  if(!navigator.geolocation) {
		    status.textContent = 'Geolocation is not supported by your browser';
		    console.log("Geolocation is not supported by your browser");
		  } else {
		    status.textContent = 'Locating…';
		    navigator.geolocation.getCurrentPosition(success, error);
		  }
		
		}
		
		document.querySelector('#find-me').addEventListener('click', geoFindMe);
	</script>
	<!-- 위치 -->
	
	
	
	<!-- daterangepicker 기본설정, 날짜 기입 시작 -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<script>
		let today = new Date();
		let startDate = today.getFullYear()+'-'+today.getMonth()+'-'+today.getDate();
		let endDate = new Date(today.getFullYear(), today.getMonth(), today.getDate()+1);
		
		$("#daterangepicker").daterangepicker({
			locale: {
				"separator": " - ",
				"format": 'YYYY-MM-DD',
				"applyLabel": "확인",
				"cancelLabel": "취소",
				"daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
				"monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
				},
			minDate: new Date(),
			startDate: startDate,
			endDate: endDate,
			autoApply: true
		});
		
		const inout = $("#daterangepicker").val().split(" - ");
		const checkIn = inout[0];
		const checkOut = inout[1];
		$("input[name=checkinDate]").val(checkIn);
		$("input[name=checkoutDate]").val(checkOut);
		
		
		$("#daterangepicker").on("change", function(){
			const inout = $(this).val().split(" - ");
			const checkin = inout[0];
			const checkout = inout[1];
			$("input[name=checkinDate]").val(checkin);
			$("input[name=checkoutDate]").val(checkout);
			
			var diff = new Date(checkout) - new Date(checkin);
			var currDay = 24 * 60 * 60 * 1000;
			const journey = parseInt(diff/currDay);
			$(this).parent().find(".value").text(journey+"박 "+(journey+1)+"일");
			
			$.search();
		});
	</script>
	<!-- daterangepicker 기본설정, 날짜 기입 끝 -->
	
	

	
</body>
</html>