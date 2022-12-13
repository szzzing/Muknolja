<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	ul li {
		list-style: none;
		float: left;
		padding: 10px;
	}
	
	.mukRound {border-radius: 10px;}
	
	.mukButton {background: #6BB6EC; color:white; height:40px; border-radius: 10px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	.myHover:hover {cursor: pointer; background-color: rgba(205, 92, 92, 0.1);}
</style>
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body>
	<div class="container mb-5" style="min-width:540px">
		<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-2 justify-content-start">
		
			<div class="col col-lg-auto mt-5">
				<img src="${ hotelImg }" class="mukRound" style="width:500px; height:300px; background-color:#e9e9e9;">
			</div>
			<div class="col-lg-auto mt-5">
				<h1 class="fw-bold">${hotel.hotelName } <i class="fa-solid fa-bookmark" style="color:#6BB6EC"></i></h1>
				<span class="text-muted">${hotel.star }성급</span>
				<div class="mt-1 mb-1">${hotel.hotelIntro }</div>
				<table class="mt-3 mb-3">
					<tr>
						<td>
							<i class="fa-solid fa-phone"></i>
						</td>
						<td>
							${hotel.hotelPhone }
						</td>
					</tr>
					<tr>
						<td class="align-top">
							<i class="fa-solid fa-location-dot"></i>
						</td>
						<td>
							${hotel.hotelAddress }
						</td>
					</tr>
				</table>
				<h4 class="fw-bold"><i class="fa-solid fa-star" style="color:#FFE600"></i> 4.5</h4>
			</div>
		</div>
<!-- <div id="map" class="mukRound" style="width:200px;height:150px;"></div> -->

		
		<table class="table text-center mt-5 mb-5">
			<tr>
				<td scope="col">
					<h5>예약하기</h5>
				</td>
				<td scope="col">
					<h5>리뷰보기</h5>
				</td>
				<td scope="col">
					<h5>호텔 정보</h5>
				</td>
			</tr>
		</table>
		
		
		<!-- 객실 리스트 시작 -->
		<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-2">
			<div class="col col-lg-3">
				<input type="hidden" name="checkInDate">
				<input type="hidden" name="checkOutDate">
				<div class="mb-3 form-floating">
					<input type="text" class="form-control" id="daterangepicker" name="daterangepicker">
					<label for="daterangepicker">1박 2일</label>
				</div>
				<div class="mb-3 form-floating">
					<select class="form-select" name="accept">
						<option selected>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
					<label for="accept">인원</label>
				</div>
			</div>
			<div class="col col-lg-9">
				<c:forEach items="${ roomArray }" var="r">
					<div class="col">
						<table class="table table-borderless">
							<tr>
								<td style="width:300px" rowspan="3">
									<img class="hotelImg mukRound" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMTlfMTYy%2FMDAxNjY2MTc4MTIyNzky.aXnPx9QwmchutQ7kHiWYYxGSZbZ9LRetTeUPgIaTJbkg.YEphq3iONv1O2z9kjPZo-tl_gUzLazQljGyLSvpxExAg.JPEG.abcd5z%2FIMG_2083.jpg&type=sc960_832" width="300px" height="200px" style="background: lightgray">
								</td>
								<td colspan="2" class="align-top">
									<h4 class="hotelName lh-1 fw-bold">${r.roomName }</h4>
									<span>${r.roomIntro }</span><br>
									<span>${r.checkinTime }부터 ${r.checkoutTime }까지</span><br>
									<small class="text-muted">더 많은 정보</small>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="align-middle">
									<h4 class="lh-1 fw-bold" style="margin:0px"><fmt:formatNumber value="${r.roomPrice }" pattern="#,###원"/></h4>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="align-bottom text-end" style="height:40px">
									<button type="button" class="mukButton" style="width:100%">예약하기</button>
								</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<!-- 객실 리스트 끝 -->
		
		
		
		
		<!-- 리뷰 리스트 시작 -->
		<div id="reviewList">
		
		</div>
		<!-- 리뷰 리스트 끝 -->
	</div>



	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4aaeb935cb2fd15933272e12d906ced0&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch("${hotel.hotelAddress}", function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
// 		        var infowindow = new kakao.maps.InfoWindow({
// 		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${hotel.hotelName}</div>'
// 		        });
// 		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } else {
		    }
		});
 	</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

	<!-- daterangepicker 기본설정, 날짜 기입 시작 -->
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
			autoApply: false
		});
		
		$("#daterangepicker").on("change", function(){
			const inout = $(this).val().split(" - ");
			const checkIn = new Date(inout[0]);
			const checkOut = new Date(inout[1]);
			$("input[name=checkInDate]").val(checkIn);
			$("input[name=checkOutDate]").val(checkOut);
			
			var diff = checkOut - checkIn;
			var currDay = 24 * 60 * 60 * 1000;
			const journey = parseInt(diff/currDay);
			$(this).parent().find("label").text(journey+"박 "+(journey+1)+"일");
		});
	</script>
	<!-- daterangepicker 기본설정, 날짜 기입 끝 -->

</body>
</html>