<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<meta name="theme-color" content="#6bb6ec">
<title>${hotel.hotelName } :: 호텔 관리</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
	.form-control {border:1px solid #e9e9e9 !important}
  	* {font-family: 'Noto Sans KR', sans-serif;}
	::-webkit-scrollbar {width:5px;}
	::-webkit-scrollbar-thumb {background-color:#e9e9e9; border-radius:10px;}
	::-webkit-scrollbar-track {opacity:0;}
		html, body {
		width: 100%;
		height: 100%;
		margin: 0;
		padding: 0;
		font-size: 100%;
	}
	.nav-scroller {
		position: relative;
		z-index: 2;
		height: 2.75rem;
		overflow-y: hidden;
	}
	.nav-scroller .nav {
		display: flex;
		flex-wrap: nowrap;
		padding-bottom: 1rem;
		margin-top: -1px;
		overflow-x: auto;
		text-align: center;
		white-space: nowrap;
		-webkit-overflow-scrolling: touch;
	}
	
	.nav-link {
		color:rgba(0,0,0,.56) !important;
	}
	.nav-link:hover {
		color:#6bb6ec !important;
	}
	
	.room {
		cursor: pointer;
	}
	.table tr td {
		padding:0px;
	}
	
	#roomTable td {
		margin:0px;
		padding:0px;
	}
	.hotelImg {transition: all 0.3s; cursor:pointer}
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
	.mukSubText {color:rgba(0,0,0,.56);}
	
	#modifyHotelButton {color:#6bb6ec; cursor:pointer;}
	#modifyHotelButton:hover {text-decoration:underline;}
	
	#modifyButton {transition: all 0.3s; background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	#deleteButton {transition: all 0.3s; background: white; height:40px; border-radius: 8px; padding:0px 10px; color: #6BB6EC; border: 1px solid #6BB6EC;}
	
	#searchMap {
		cursor: pointer;
		color: #6BB6EC;
	}
	#searchMap:hover {
		text-decoration: underline;
	}
	.logout {color:#b9b9b9 !important; text-decoration:none;}
	.logout:hover {text-decoration:underline;}
</style>
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>

	
	<div class="container">
	
		<div class="row">
			<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar shadow collapse" style="height:100%; left:0px; position:fixed;">
				<div class="position-sticky sidebar-sticky">
					<div class="text-center pb-4 m-3 mt-5 mb-5" style="border-bottom:1px solid #e9e9e9">
						<img class="img-fluid mb-3" style="width:100px; height:100px; border-radius:50%" src="${contextPath }/resources/uploadFiles/${hotelImgList[0].fileModifyName}">
						<h5 class="fw-bold mukSubText">${hotel.hotelName }</h5>
						<a class="logout" aria-current="page" href="${contextPath }/logout.me" style="font-size:14px;">
							로그아웃
						</a>
					</div>
					<ul class="nav flex-column">
						<li class="nav-item">
							<a class="nav-link" href="${contextPath }/admin.ho">
								<i class="fa-solid fa-house"></i>
								<span data-feather="home" class="align-text-bottom"></span>
								통계
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${contextPath }/manageHotel.ho">
								<i class="fa-solid fa-hotel"></i>
								<span data-feather="file" class="align-text-bottom"></span>
								호텔 관리
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="${contextPath }/manageRoom.ho">
								<i class="fa-solid fa-door-closed"></i>
								<span data-feather="file" class="align-text-bottom"></span>
								객실 관리
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="${contextPath }/manageReserve.ho">
								<i class="fa-solid fa-book"></i>
								<span data-feather="file" class="align-text-bottom"></span>
								예약 관리
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="${contextPath }/manageReview.ho">
								<i class="fa-solid fa-message"></i>
								<span data-feather="file" class="align-text-bottom"></span>
								리뷰 관리
							</a>
						</li>
					</ul>
				</div>
			</nav>
			
			
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 mb-5">
				<form action="${contextPath }/modifyHotel.ho">
					<input type="hidden" name="hotelId" value="${hotel.hotelId }">
				</form>
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-4 pb-3 mb-5" style="border-bottom:1px solid #e9e9e9">
					<h1 class="h2 fw-bold">호텔 관리</h1>
					<div id="modifyHotelButton" class="fw-bold">호텔 수정</div>
				</div>
				<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-2 pb-5 justify-content-start gy-5">
					<div class="col">
						<div class="row">
							<div class="col">
								<img id="hotelImg" class="img-fluid mukRound h-100" src="${contextPath }/resources/uploadFiles/${hotelImgList[0].fileModifyName}" style="background-color:#F9F9F9;">
							</div>
						</div>
						<div class="row mt-1 justify-content-start gx-1 gy-0">
							<c:forEach items="${hotelImgList }" var="i" varStatus="status">
								<c:if test="${i.fileThumbnail=='N' }">
									<div class="col col-2">
										<img class="hotelImg img-fluid mukRound h-100" src="${contextPath }/resources/uploadFiles/${i.fileModifyName}" style="background-color:#F9F9F9;">
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="col">
						<span class="text-center" style="background:#6BB6EC; border-radius:5px; color:white; padding:2px 5px;">
							${hotel.star }성급
						</span>
						<h1 class="fw-bold pb-1">${hotel.hotelName }</h1>
						<div id="hotelIntro" class="mt-1 mb-1">${hotel.hotelIntro }</div>
						<table class="mt-3 mb-3">
							<tr>
								<td class="mukSubText">
									<i class="fa-solid fa-phone p-1"></i>
									${hotel.hotelPhone }
								</td>
							</tr>
							<tr>
								<td class="align-top mukSubText">
									<i class="fa-solid fa-location-dot p-1"></i>
									${hotel.hotelAddress }
								</td>
							</tr>
						</table>
					</div>
				</div>
				<h4 class="fw-bold pb-3">기본 정보</h4>
				<div id="hotelInfo">${hotel.hotelInfo }</div>
				
				<h4 class="fw-bold pt-5 pb-3">편의시설 및 서비스</h4>
				<div class="p-4" style="background:#fafafa; border-radius:20px;">
					<div class="row justify-content-start">
						<div class="col-auto text-center" <c:if test="${hotel.wifi=='N' }">style="opacity:40%"</c:if>>
							<img src="${contextPath }/resources/img/wifi.svg" style="width:48px; height:48px;"><br>
							<small class="mukSubText">와이파이</small>
						</div>
						<div class="col-auto text-center" <c:if test="${hotel.breakfast=='N' }">style="opacity:40%"</c:if>>
							<img src="${contextPath }/resources/img/breakfast.svg" style="width:48px; height:48px;"><br>
							<small class="mukSubText">조식</small>
						</div>
						<div class="col-auto text-center" <c:if test="${hotel.amenity=='N' }">style="opacity:40%"</c:if>>
							<img src="${contextPath }/resources/img/amenity.svg" style="width:48px; height:48px;"><br>
							<small class="mukSubText">어메니티</small>
						</div>
						<div class="col-auto text-center" <c:if test="${hotel.park=='N' }">style="opacity:40%"</c:if>>
							<img src="${contextPath }/resources/img/park.svg" style="width:48px; height:48px;"><br>
							<small class="mukSubText">주차</small>
						</div>
						<div class="col-auto text-center" <c:if test="${hotel.swim=='N' }">style="opacity:40%"</c:if>>
							<img src="${contextPath }/resources/img/swim.svg" style="width:48px; height:48px;"><br>
							<small class="mukSubText">수영장</small>
						</div>
						<div class="col-auto text-center" <c:if test="${hotel.fitness=='N' }">style="opacity:40%"</c:if>>
							<img src="${contextPath }/resources/img/fitness.svg" style="width:48px; height:48px;"><br>
							<small class="mukSubText">피트니스</small>
						</div>
					</div>
				</div>
				
				<h4 class="fw-bold pt-5 pb-3">위치</h4>
				<div class="pb-3">${hotel.hotelAddress }</div>
				<div id="map" class="mukRound" style="width:540px;height:300px;"></div>
			</main>

		</div>
	</div>
	
	<script>
		var hotelInfo = $("#hotelInfo").html().replace(/(?:\r\n|\r|\n)/g, '<br/>');
		var hotelIntro = $("#hotelIntro").html().replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$("#hotelInfo").html(hotelInfo);
		$("#hotelIntro").html(hotelIntro);
	</script>
	
	<script>
		$("#modifyHotelButton").on("click", function(){
			$("form").prop("action", "${contextPath }/modifyHotel.ho");
			$("form").submit();
		});
	</script>
	<!-- 객실 수정, 삭제 끝 -->
	
	
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
 	
 	<!-- 호텔이미지 시작 -->
	<script>
		$(document).ready(function(){
			$(".hotelImg").on("click", function(){
				var src = $("#hotelImg").prop("src");
				$("#hotelImg").prop("src", $(this).prop("src"));
				$(this).prop("src", src);
			});
		})
	</script>
	<!-- 호텔이미지 끝 -->
</body>
</html>