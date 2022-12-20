<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	#likeHotelButton {
		cursor: pointer;
	}
	img {
		cursor: pointer;
	}
	#searchMap {
		cursor: pointer;
		color: #6BB6EC;
	}
	#searchMap:hover {
		text-decoration: underline;
	}
	.writableReview {
		cursor: pointer;
	}
	.writableReview:hover {
		text-decoration: underline;
	}
	#roomTable td {
		margin:0px;
		padding:0px;
	}
	.hotelImg {transition: all 0.3s;}
	.hotelImg:hover {opacity:0.5;}
	.roomDetailModal_roomImg {transition: all 0.3s;}
	.roomDetailModal_roomImg:hover { opacity:0.5; }
	.mukCategory {color:#6BB6EC !important; border-bottom:3px solid #6BB6EC; font-weight:bold;}
	.mukDisplayNone {display:none !important;}
	.mukRound {border-radius: 8px;}
	.mukButton {transition: all 0.3s; background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	.myHover:hover {cursor: pointer; background-color: rgba(205, 92, 92, 0.1);}
	.mukMutedText {color:#B9B9B9;}
	
/* 	별점 관련 */
	.star-rating {
		color:#e9e9e9;
		display: flex;
		width: 5em;
		flex-direction: row-reverse;
		justify-content: space-around;
	}
	.star-rating input {
		display: none;
	}
	.star-rating label {
		cursor: pointer;
	}
	.star-rating :checked ~ label {
		-webkit-text-fill-color: #FFD600;
	}
	.star-rating label:hover,
	.star-rating label:hover ~ label {
	  -webkit-text-fill-color: #FFD600;
	}
</style>
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
	
	<div class="container-sm mt-5 mb-5" style="padding-top:80px">
	<form>
		<a href="${contextPath }/modifyHotel.ho">호텔 수정하기</a>
		<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-2 pb-5 justify-content-start gy-5">
			<div class="col">
				<div class="row">
					<div class="col">
						<img id="hotelImg" class="img-fluid mukRound" src="${contextPath }/resources/uploadFiles/${hotelImgList[0].fileModifyName}" style="background-color:#F9F9F9;">
					</div>
				</div>
				<div class="row mt-1 justify-content-start gx-1 gy-0">
					<c:forEach items="${hotelImgList }" var="i">
						<div class="col col-2">
							<img class="hotelImg img-fluid mukRound" src="${contextPath }/resources/uploadFiles/${i.fileModifyName}" style="background-color:#F9F9F9;">
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col">
				<span class="text-center" style="background:#6BB6EC; border-radius:5px; color:white; padding:2px 5px;">
					${hotel.star }성급
				</span>
				<h1 class="fw-bold pb-1">${hotel.hotelName }</h1>
				<div class="mt-1 mb-1">${hotel.hotelIntro }</div>
				<table class="mt-3 mb-3">
					<tr>
						<td class="mukMutedText">
							<i class="fa-solid fa-phone"></i>
							${hotel.hotelPhone }
						</td>
					</tr>
					<tr>
						<td class="align-top mukMutedText">
							<i class="fa-solid fa-location-dot"></i>
							${hotel.hotelAddress }
						</td>
					</tr>
				</table>
			</div>
		</div>

		
		<!-- 호텔 정보 시작 -->
		<div id="hotelInfo">
			<h4 class="fw-bold pb-3">기본 정보</h4>
			${hotel.hotelInfo }
			
			<h4 class="fw-bold pt-5 pb-3">위치</h4>
			<p>${hotel.hotelAddress }</p>
			<div id="map" class="mukRound" style="width:540px;height:300px;"></div>
			
		</div>
		<!-- 호텔 정보 끝 -->
	</form>
	</div>
	
	
	
	
	<!-- 지도 시작 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4aaeb935cb2fd15933272e12d906ced0&libraries=services"></script>
	<script>
		$.viewMap = function() {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(${hotel.hotelGeoY}, ${hotel.hotelGeoX}), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
	
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			var coords = new kakao.maps.LatLng(${hotel.hotelGeoY}, ${hotel.hotelGeoX});
			var marker = new kakao.maps.Marker({
			    map: map,
			    position: coords
			});
			
			map.setCenter(coords);
		}
		$.viewMap();
 	</script>
 	<!-- 지도 끝 -->


	<!-- daterangepicker 기본설정, 날짜 기입 시작 -->
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
			autoApply: false
		});
		
		const inout = $("#daterangepicker").val().split(" - ");
		$("input[name=checkinDate]").val(inout[0]);
		$("input[name=checkoutDate]").val(inout[1]);
		
		$("#daterangepicker").on("change", function(){
			const inout = $(this).val().split(" - ");
			$("input[name=checkinDate]").val(inout[0]);
			$("input[name=checkoutDate]").val(inout[1]);
			const checkin = new Date(inout[0]);
			const checkout = new Date(inout[1]);
			console.log($("input[name=checkinDate]").val());
			console.log($("input[name=checkoutDate]").val());
			
			var diff = checkout - checkin;
			var currDay = 24 * 60 * 60 * 1000;
			const journey = parseInt(diff/currDay);
			$(this).parent().find("label").text(journey+"박 "+(journey+1)+"일");
		});
	</script>
	<!-- daterangepicker 기본설정, 날짜 기입 끝 -->
	
	
	<!-- 호텔이미지 시작 -->
	<script>
		$(document).ready(function(){
			$(".hotelImg").on("click", function(){
				$("#hotelImg").prop("src", $(this).prop("src"));
			});
		})
	</script>
	<!-- 호텔이미지 끝 -->
	
	
</body>
</html>