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
	#searchMap {
		cursor: pointer;
		color: #6BB6EC;
	}
	#searchMap:hover {
		text-decoration: underline;
	}
	
	.mukRound {border-radius: 10px;}
	.mukButton {background: #6BB6EC; color:white; height:40px; border-radius: 10px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	.myHover:hover {cursor: pointer; background-color: rgba(205, 92, 92, 0.1);}
	.mukMutedText {color:#B9B9B9;}
</style>
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body>

	<!-- 예약 전송용 form 시작 -->
	<form action="writeReservation.ho" method="post">
		<input type="hidden" name="roomId">
		<input type="hidden" name="checkinDate">
		<input type="hidden" name="checkoutDate">
	</form>
	<!-- 예약 전송용 form 끝 -->
	
	<div class="container mt-5 mb-5" style="min-width:540px">
		<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-2 justify-content-start">
		
			<div class="col col-lg-auto pt-5">
				<img class="mukRound" style="width:500px; height:300px; background-color:#F9F9F9;">
			</div>
			<div class="col-lg-auto pt-5">
				<h1 class="fw-bold">${hotel.hotelName }
					<i id="likeHotelButton" class="fa-solid fa-bookmark"
						<c:if test="${empty loginUser }">style="color:#E9E9E9"</c:if>
						<c:if test="${!empty loginUser && isLikeHotel==0 }">style="color:#E9E9E9"</c:if>
						<c:if test="${!empty loginUser && isLikeHotel==1 }">style="color:#6BB6EC"</c:if>
					>
					</i>
				</h1>
				<span class="mukMutedText">${hotel.star }성급</span>
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
				<h4 class="fw-bold"><i class="fa-solid fa-star" style="color:#FFD600"></i> 4.5</h4>
			</div>
		</div>

		
		<div class="row row-cols-4 justify-content-start text-center mt-5 mb-5" style="border-bottom:1px solid #e9e9e9">
			<div class="col col-auto p-2 mukMutedText" id="roomListButton" scope="col" style="border-bottom:3px solid #6BB6EC; color:#6BB6EC; font-weight:bold">
				예약하기
			</div>
			<div class="col col-auto p-2 mukMutedText" id="hotelInfoButton" scope="col">
				호텔 정보
			</div>
			<div class="col col-auto p-2 mukMutedText" id="reviewListButton" scope="col">
				리뷰
			</div>
			<div class="col"></div>
		</div>
		
		
		<!-- 객실 리스트 시작 -->
		<div id="roomList" class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-2">
			<div class="col col-lg-3">
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
									<input type="hidden" class="roomId" value="${r.roomId }">
									<h4 class="roomName lh-1 fw-bold">${r.roomName }</h4>
									<span>${r.roomIntro }</span><br>
									<span class="checkinTime">${r.checkinTime }</span>~
									<span class="checkoutTime">${r.checkoutTime }</span><br>
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
									<button type="button" class="reserveButton mukButton" style="width:100%">예약하기</button>
								</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<!-- 객실 리스트 끝 -->
		
		
		
		<!-- 리뷰 리스트 시작 -->
		<div id="reviewList" style="display:none">
			<div class="text-center pt-5 pb-5" style="border-bottom: 1px solid #e9e9e9">
				<h2 class="fw-bold">최고예요!</h2>
				<div style="display:inline-block">
					<h2 class="fa-solid fa-star" style="color:#FFD600"></h2>
					<h2 class="fa-solid fa-star" style="color:#FFD600"></h2>
					<h2 class="fa-solid fa-star" style="color:#FFD600"></h2>
					<h2 class="fa-solid fa-star" style="color:#FFD600"></h2>
					<h2 class="fa-solid fa-star" style="color:#FFD600"></h2>
				</div>
				<h2 class="fw-bold" style="display:inline-block">4.5</h2>
				<h4 class="pt-3">10개의 리뷰</h4>
			</div>
			<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-1 pt-5 pb-5">
				<div class="col mt-3 mb-3" style="border-bottom: 1px solid #e9e9e9">
					<table class="table table-borderless">
						<tr>
							<td rowspan="4" style="width:60px;"><span style="font-size:60px">😀</span></td>
							<td>
								<h5 class="fw-bold">전체적으로 만족스러웠어요.</h5>
								<span>
									<i class="fa-solid fa-star" style="color:#FFD600"></i>
									<i class="fa-solid fa-star" style="color:#FFD600"></i>
									<i class="fa-solid fa-star" style="color:#FFD600"></i>
									<i class="fa-solid fa-star" style="color:#FFD600"></i>
									<i class="fa-solid fa-star" style="color:#FFD600"></i>
								</span>
								<span>5.0</span>
							</td>
						</tr>
						<tr>
							<td class="mukMutedText">
								닉네임 · 디럭스 트윈 객실 이용
							</td>
						</tr>
						<tr>
							<td>
								1박 머물었는데 당일 도착 피곤해서 손만 씻고 잠자리에 들었네요.아침에 서둘러 일어나 샤워하다 벽틈에서 찌든 곰팡때가 이루 말할수 없이 끼여 있는데다 더러운 이물질이 흘러내려 깜짝 놀랬습니다.베게쪽 시트에서도 잘잘한 머릿카락과 먼지가 장난 아니였습니다.쇼파엔 얼룩이 져있고 ᆢ 음 1박 더 머물려다 다른 호텔로 옮겼습니다.<br>전에 하얏트 호텔에서 머물었을땐 쾌적 청결했는데 ᆢ롯데호텔 객실 청소하는 분들은 대충??청소상태 검열은 안하는건지?ᆢ청결,위생면에서는 저급하네요. 일찍 벗어나고 싶어 이른 아침에 체크아웃했습니다.프론트에서 직원분들은 친절했습니다.그리고 창가쪽에도 커튼 치다보니 컵자국인지 이물질 얼룩이 선명하게 있더군요
							</td>
						</tr>
						<tr>
							<td class="mukMutedText">2022.11.13</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<!-- 리뷰 리스트 끝 -->
		
		<!-- 호텔 정보 시작 -->
		<div id="hotelInfo" style="display:none">
			<h4 class="fw-bold pt-5 pb-3">기본 정보</h4>
			${hotel.hotelInfo }
			
			<h4 class="fw-bold pt-5 pb-3">위치</h4>
			<p>${hotel.hotelAddress } <span id="searchMap">길찾기</span></p>
			<div id="map" class="mukRound" style="width:540px;height:300px;"></div>
			
			<h4 class="fw-bold pt-5 pb-3">편의시설 및 서비스</h4>
			<div class="row text-center">
				<div class="col col-auto">
					<h4 <c:if test="${hotel.wifi=='N' }">style="color:#E9E9E9"</c:if>>
						<i class="fa-solid fa-wifi"></i>
					</h4>
					와이파이
				</div>
				<div class="col col-auto">
					<h4 <c:if test="${hotel.park=='N' }">style="color:#E9E9E9"</c:if>>
						<i class="fa-solid fa-square-parking"></i>
					</h4>
					주차
				</div>
				<div class="col col-auto">
					<h4 <c:if test="${hotel.amenity=='N' }">style="color:#E9E9E9"</c:if>>
						<i class="fa-solid fa-gift"></i>
					</h4>
					어메니티
				</div>
				<div class="col col-auto">
					<h4 <c:if test="${hotel.breakfast=='N' }">style="color:#E9E9E9"</c:if>>
						<i class="fa-solid fa-utensils"></i>
					</h4>
					조식
				</div>
				<div class="col col-auto">
					<h4 <c:if test="${hotel.fitness=='N' }">style="color:#E9E9E9"</c:if>>
						<i class="fa-solid fa-dumbbell"></i>
					</h4>
					피트니스
				</div>
				<div class="col col-auto">
					<h4 <c:if test="${hotel.amenity=='N' }">style="color:#E9E9E9"</c:if>>
						<i class="fa-solid fa-water-ladder"></i>
					</h4>
					수영장
				</div>
			</div>
		</div>
		<!-- 호텔 정보 끝 -->
	</div>
	
	
	<!-- 리스트 버튼 시작 -->
	<script>
		$("#roomListButton").on("click", function(){
			$(this).css({"border-bottom":"3px solid #6BB6EC", "color":"#6BB6EC", "font-weight":"bold"});
			$("#reviewListButton").prop("style").removeProperty("border-bottom");
			$("#reviewListButton").prop("style").removeProperty("color");
			$("#reviewListButton").prop("style").removeProperty("font-weight");
			$("#hotelInfoButton").prop("style").removeProperty("border-bottom");
			$("#hotelInfoButton").prop("style").removeProperty("color");
			$("#hotelInfoButton").prop("style").removeProperty("font-weight");
			
			$("#roomList").prop("style").removeProperty("display");
			$("#reviewList").css("display", "none");
			$("#hotelInfo").css("display", "none");
		});
		$("#reviewListButton").on("click", function(){
			$(this).css({"border-bottom":"3px solid #6BB6EC", "color":"#6BB6EC", "font-weight":"bold"});
			$("#roomListButton").prop("style").removeProperty("border-bottom");
			$("#roomListButton").prop("style").removeProperty("color");
			$("#roomListButton").prop("style").removeProperty("font-weight");
			$("#hotelInfoButton").prop("style").removeProperty("border-bottom");
			$("#hotelInfoButton").prop("style").removeProperty("color");
			$("#hotelInfoButton").prop("style").removeProperty("font-weight");
			
			$("#reviewList").prop("style").removeProperty("display");
			$("#roomList").css("display", "none");
			$("#hotelInfo").css("display", "none");
		});
		$("#hotelInfoButton").on("click", function(){
			$(this).css({"border-bottom":"3px solid #6BB6EC", "color":"#6BB6EC", "font-weight":"bold"});
			$("#reviewListButton").prop("style").removeProperty("border-bottom");
			$("#reviewListButton").prop("style").removeProperty("color");
			$("#reviewListButton").prop("style").removeProperty("font-weight");
			$("#roomListButton").prop("style").removeProperty("border-bottom");
			$("#roomListButton").prop("style").removeProperty("color");
			$("#roomListButton").prop("style").removeProperty("font-weight");
			
			$("#hotelInfo").prop("style").removeProperty("display");
			$("#reviewList").css("display", "none");
			$("#roomList").css("display", "none");
			
			$.viewMap();
		});
	</script>
	<!-- 리스트 버튼 끝 -->
	
	
	
	<!-- 호텔 찜하기 버튼 시작 -->
	<script>
		$("#likeHotelButton").on("click", function(){
			if(${!empty loginUser}) {
				
				if($(this).css("color")=="rgb(233, 233, 233)") {
					$(this).css("color", "#6BB6EC");
					$.ajax({
						url: "insertLikeHotel.ho",
						data: {
							id: "${loginUser.id}",
							hotelId: ${hotel.hotelId}
						},
						success: (data)=>{
							console.log(data);
						},
						error: (data)=>{
							console.log(data);
						}
					});
				} else {
					$(this).css("color", "#E9E9E9");
					$.ajax({
						url: "deleteLikeHotel.ho",
						data: {
							id: "${loginUser.id}",
							hotelId: ${hotel.hotelId}
							}
					});
				}
			} else {
				$.viewModal("로그인 후 이용해주세요.");
			}
		});
	</script>
	<!-- 호텔 찜하기 버튼 끝 -->
	
	
	
	<!-- 예약 버튼 시작 -->
	<script>
		$(".reserveButton").on("click", function(){
			if(${!empty loginUser}) {
				const roomId = $(this).parent().parent().parent().find(".roomId").val();
				const checkinTime = $(this).parent().parent().parent().find(".checkinTime").text();
				const checkoutTime = $(this).parent().parent().parent().find(".checkoutTime").text();
				
				$("input[name=roomId]").val(roomId);
				$("input[name=checkinTime]").val(checkinTime);
				$("input[name=checkoutTime]").val(checkoutTime);
				
				$("form").submit();
			} else {
				$.viewModal("로그인 후 이용해주세요.");
			}
		});
	</script>
	<!-- 예약 버튼 끝 -->


	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4aaeb935cb2fd15933272e12d906ced0&libraries=services"></script>
	<script>
		$.viewMap = function() {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
	
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			var geocoder = new kakao.maps.services.Geocoder();
			geocoder.addressSearch("${hotel.hotelAddress}", function(result, status) {
			
				if (status === kakao.maps.services.Status.OK) {
					
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					var marker = new kakao.maps.Marker({
					    map: map,
					    position: coords
					});
					
					map.setCenter(coords);
					
					// 길찾기
					const url = "https://map.kakao.com/link/to/${hotel.hotelName},"+result[0].y+","+result[0].x;
					$("#searchMap").on("click", function(){
						window.open(url, "_blank", "width=500", true);
					});
			    }
			});
		}
 	</script>


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
	
	
	<!-- 모달 -->
	<div class="modal fade modal-sm" id="mukModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog text-center">
			<div class="modal-content">
				<div class="modal-body">
					<p class="modalContent mt-3 mb-3"></p>
					<button type="button" class="mukButton mb-3" style="width:80%" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$.viewModal = function(text) {
			$(".modalContent").text(text);
			$("#mukModal").modal('show');
		};
	</script>
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>