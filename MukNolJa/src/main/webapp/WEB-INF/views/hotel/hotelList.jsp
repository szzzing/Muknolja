<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<title>먹놀자</title>
<meta charset="utf-8">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<link rel="stylesheet" href="${contextPath }/resources/css/rSlider.min.css">
<script src="${contextPath }/resources/src/js/rSlider.js"></script>

</head>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
  	* {font-family: 'Noto Sans KR', sans-serif;}
  	.form-control {border:2px solid #f1f1f1 !important; border-radius:20px !important}
	.form-select {border:2px solid #f1f1f1 !important; border-radius:20px !important}
	.form-control::placeholder {color:#B9B9B9 !important;}
	.form-control::-webkit-input-placeholder {color:#B9B9B9;}
	.form-control:-ms-input-placeholder {color:#B9B9B9;}
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
	
	#carouselExampleInterval{margin-top: 80px;}
</style>
<body>
	<jsp:include page="../member/menubar.jsp"/>
	
	
	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="10000">
				<img src="resources/img/adadad.png" class="d-block w-100 adimg" alt="...">
			</div>
			<div class="carousel-item" data-bs-interval="2000">
				<img src="resources/img/adadad.png" class="d-block w-100 adimg" alt="...">
			</div>
			<div class="carousel-item">
				<img src="resources/img/adadad.png" class="d-block w-100 adimg" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	
	<!-- 호텔 상세페이지용 폼 -->
	<form action="${contextPath }/hotelDetail.ho">
		<input type="hidden" name="hotelId">
		<input type="hidden" name="checkinDate">
		<input type="hidden" name="checkoutDate">
	</form>
	<!-- 호텔 상세페이지용 폼 -->
	
	
	<div class="container-sm pt-5 pb-5">
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
							<div class="fw-bold" style="display:inline-block; padding-right:4px;">거리</div>
							<div id="status" class="pb-2" style="font-size:14px; color:#6bb6ec; display:inline-block"></div>
							<input type="hidden" name="geoX">
							<input type="hidden" name="geoY">
							<input type="hidden" name="maxDistance">
							<div class="row row-cols-lg-1">
								<div class="col">
									<label for="0km" class="distance mukCheckbox">
										<input type="checkbox" id="0km" value="0"><span class="on"></span>
										기준거리
									</label>
								</div>
								<div class="col">
									<input type="hidden" name="distance">
									<label for="10km" class="distance mukCheckbox">
										<input type="checkbox" id="10km" value="10"><span class="on"></span>
										10km
									</label>
								</div>
								<div class="col">
									<label for="30km" class="distance mukCheckbox">
										<input type="checkbox" id="30km" value="30"><span class="on"></span>
										30km
									</label>
								</div>
								<div class="col">
									<label for="50km" class="distance mukCheckbox">
										<input type="checkbox" id="50km" value="50"><span class="on"></span>
										50km
									</label>
								</div>
							</div>
						</div>
						<div class="mb-5 pb-4" style="border-bottom:1px solid #f1f1f1">
							<div class="slider-container">
								<input type="text" id="slider" class="slider">
								<input type="hidden" name="minPrice">
								<input type="hidden" name="maxPrice">
							</div>
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
				<div class="row text-center">
					<div class="col-lg-10 col-sm-9 col-md-9 mb-5">
						<input class="form-control" type="text" name="searchValue" placeholder="찾고싶은 호텔의 이름, 지역명으로 검색하세요.">
					</div>
					<div class="col-lg-2 col-sm-3 col-md-3">
						<select class="form-select" name="orderBy">
							<option selected value="new">최신순</option>
							<option value="priceHigh">높은가격순</option>
							<option value="priceLow">낮은가격순</option>
							<option value="distance">거리순</option>
						</select>
					</div>
				</div>
				<div id="hasNoHotel" class="col text-center pt-5 pb-5" style="display:none">
					<img class="mb-2" style="width:60px;" src="${contextPath }/resources/img/1f64f.svg">
					<h4 class="fw-bold">일치하는 호텔이 없습니다</h4>
					<div class="fw-bold mukSubText">다른 조건으로 찾아보세요</div>
				</div>
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
		<div id="hotelScrollerFooter" class="mb-5"></div>	<!-- 무한스크롤 감지 -->
	</div>
	<jsp:include page="../common/footer.jsp"/>
	

	
	<script>
		// 광고 삽입
		window.onload = () => {
			$.ajax({
	    		url: 'selectAd.me',
	    		data: {type:'H'},
	    		success: (data) => {
	    			const adimgs = document.getElementsByClassName('adimg');
	
	    			for(const i in data){
	    				adimgs[i].src = 'resources/uploadFiles/' + data[i];
	    			}
	    		}
	    	});
			
		}
	</script>
	
	<!-- 호텔 검색 시작 -->
	<script>
		var page = 1;
		var maxPage = 1;
		var currValue = "";
		
		$(document).ready(function(){
			
			var hotelDiv = $("#hotelDiv").clone();
			
			var star = new Array();
			var install = new Array('N','N','N','N','N','N');
			
			$.search = function(){
				var searchValue = $("input[name=searchValue]").val();
				var orderBy = $("select[name=orderBy]").val();
				var checkinDate = $("input[name=checkinDate]").val()+"";
				var checkoutDate = $("input[name=checkoutDate]").val()+"";
				var minPrice = $("input[name=minPrice]").val();
				var maxPrice = $("input[name=maxPrice]").val();
				var maxDistance = $("input[name=maxDistance]").val();
				var geoX = Number($("input[name=geoX]").val());
				var geoY = Number($("input[name=geoY]").val());
				
				$.ajax({
					url: "${contextPath}/searchHotelList.ho",
					traditional : true,
					data: {
						page: page,
						searchValue: searchValue,
						orderBy: orderBy,
						checkinDate: checkinDate,
						checkoutDate: checkoutDate,
						minPrice: minPrice,
						maxPrice: maxPrice,
						maxDistance: maxDistance,
						geoX: geoX,
						geoY: geoY,
						star: star,
						install: install
					},
					success: (data)=>{
						var hotelDiv2 = hotelDiv.clone();
						maxPage = data.maxPage;
						
						const inout = $("#daterangepicker").val().split(" - ");
						
						const checkin = new Date(inout[0]);
						const checkout = new Date(inout[1]);
						
						var diff = checkout - checkin;
						var currDay = 24 * 60 * 60 * 1000;
						var journey = parseInt(diff/currDay);
						
						console.log(data);
						
						if(data.hotelList.length==0) {
							$("#hasNoHotel").prop("style").removeProperty("display");
						} else {
							$("#hasNoHotel").css("display", "none");
						}
						if(page==1 || data.hotelList.length==0) {
							$("#hotelList").html("");
							console.log("삭제");
						}
						
						hotelDiv.prop("style").removeProperty("display");
						for(var i of data.hotelList) {
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
							if(geoX!=0 && geoY!=0 && maxDistance!=0) {
								if(i.maxDistance<0) {
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
						page+=1;
					},
					error: (data)=>{
						console.log(data);
					}
				});
			}
			
			const mio = new IntersectionObserver((entries, observer)=>{
				entries.forEach(entry=>{
					if(!entry.isIntersecting) {
						return; 
					}
					observer.observe(document.getElementById('hotelScrollerFooter'));
					console.log("스크롤");
					if(page<=maxPage) {
						$.search();
					}
				});
			});
			mio.observe(document.getElementById('hotelScrollerFooter'));
			
			$("input").change(function() {
				page=1;
				$.search();
			});
			
			$("select").change(function() {
				console.log($(this).val());
				page=1;
				$.search();
			});
			
			$("input[name=searchValue]").keyup(function(){
				if(currValue!=$(this).val()) {
					page=1;
					console.log($(this).val());
					currValue = $(this).val();
					$.search();
				}
			});
			
			$("input[name=star]").on("click", function(){
				star = new Array();
				for(var i of $("input[name='star']")) {
					if(i.checked) {
						star.push(i.value);
					}
				}
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
			});
			
			$(document).on('click', '.hotel', function(){
				$("input[name=hotelId]").val($(this).find(".hotelId").val());
				$("form").submit();
			});
			
			$(".distance").on("click", function(){
	 			const checkboxes = $(".distance").find("input[type=checkbox]");
	 			for(cb of checkboxes) {
	 				cb.checked = false;
	 			}
	 			$(this).find("input[type=checkbox]").prop('checked',true);
	 			$("input[name=maxDistance]").val($(this).find("input[type=checkbox]").val());
	 		});
			
			
			$("input[name=minPrice]").val("10");
			$("input[name=maxPrice]").val("100");
			
			$.init = function() {
				var slider = new rSlider({
					target: '#slider',
					values: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
					range: true,
					set: [0, 100],
					onChange: function (vals) {
					    const prices = vals.split(",");
					    $("input[name=minPrice]").val(Number(prices[0]));
						$("input[name=maxPrice]").val(Number(prices[1]));
						page=1;
						$.search();
					}
				});
			};
			$.init();
		});
		
	</script>
	<!-- 호텔 검색 끝 -->
	
	
	<!-- 위치 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4aaeb935cb2fd15933272e12d906ced0&libraries=services"></script>
	<script>
		$("input[name=maxDistance]").val(0);
		
		function geoFindMe() {
		
			const status = document.querySelector('#status');
			
			function success(position) {
				const latitude  = position.coords.latitude;
				const longitude = position.coords.longitude;
				
				$("input[name=geoX]").val(Number(longitude));
				$("input[name=geoY]").val(Number(latitude));
				getAddr(latitude, longitude);
			}
			function error() {
				$("input[name=geoX]").val(0);
				$("input[name=geoY]").val(0);
				console.log("실패");
			}
			
			if(!navigator.geolocation) {
				$("input[name=geoX]").val(0);
				$("input[name=geoY]").val(0);
			} else {
				$("input[name=geoX]").val(0);
				$("input[name=geoY]").val(0);
				navigator.geolocation.getCurrentPosition(success, error);
			}
		}
		geoFindMe();
		
		
		function getAddr(lat,lng) {
		    let geocoder = new kakao.maps.services.Geocoder();

		    let coord = new kakao.maps.LatLng(lat, lng);
		    let callback = function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            document.querySelector('#status').textContent = result[0].road_address.address_name;
		        }
		    }
		    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
		}
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
			minDate: today,
			startDate: today,
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
		});
	</script>
	<!-- daterangepicker 기본설정, 날짜 기입 끝 -->
	
	
</body>
</html>