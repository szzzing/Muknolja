<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
ul li {
	list-style: none;
	float: left;
	padding: 10px;
}

.myHover:hover {
	cursor: pointer;
	background-color: rgba(205, 92, 92, 0.1);
}

</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
	<div class="container mt-5 mb-5">
		<table class="table table-borderless align-middle">
			<tr>
				<td rowspan="2" scope="col" width="300">
					<img src="${ hotelImg }" style="margin-left: auto; margin-right: auto; display: block;">
				</td>
				<td colspan="4" height="200">
					<h1 class="fw-bold">${hotel.hotelName }</h1>
					<span class="text-muted">${hotel.star }성급</span>
					<table class="table-borderless align-middle text-center mt-3 mb-3">
						<tr>
							<td width="70px" <c:if test="${hotel.wifi=='N' }">style="color:lightgray"</c:if>><h2><i class="bi bi-wifi"></h2></td>
							<td width="70px" <c:if test="${hotel.park=='N' }">style="color:lightgray"</c:if>><h2><i class="bi bi-p-square-fill"></h2></td>
							<td width="70px" <c:if test="${hotel.amenity=='N' }">style="color:lightgray"</c:if>><h2><i class="bi bi-gift-fill"></h2></td>
							<td width="70px" <c:if test="${hotel.breakfast=='N' }">style="color:lightgray"</c:if>><h2><i class="bi bi-basket-fill"></i></h2></td>
						</tr>
						<tr>
							<td width="70px" <c:if test="${hotel.wifi=='N' }">style="color:lightgray"</c:if>>와이파이</td>
							<td width="70px" <c:if test="${hotel.park=='N' }">style="color:lightgray"</c:if>>주차</td>
							<td width="70px" <c:if test="${hotel.amenity=='N' }">style="color:lightgray"</c:if>>어메니티</td>
							<td width="70px" <c:if test="${hotel.breakfast=='N' }">style="color:lightgray"</c:if>>조식</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<div id="map" style="width:400px;height:300px;"></div>
				</td>
			</tr>
		</table>
		
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
		<div id="roomList" class="row row-cols-1 row-cols-sm-1 row-cols-lg-2 justify-content-start mt-4 mb-4">
		<c:forEach items="${roomArray }" var="r">
			<div class="room col mb-4">
				<div class="card card-cover h-100 overflow-hidden rounded-5">
					<div class="row">
						<div class="col col-sm-auto col-md-auto" style="margin:0; padding-right:0">
							<img id="hotelImg" class="img-fluid rounded-start" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMTlfMTYy%2FMDAxNjY2MTc4MTIyNzky.aXnPx9QwmchutQ7kHiWYYxGSZbZ9LRetTeUPgIaTJbkg.YEphq3iONv1O2z9kjPZo-tl_gUzLazQljGyLSvpxExAg.JPEG.abcd5z%2FIMG_2083.jpg&type=sc960_832" width="200px" height="300px" style="background: lightgray">
						</div>
						<div class="col mt-4 mb-4">
							<input type="hidden" name="hotelId">
							<h4 id="hotelName" class="card-title lh-1 fw-bold">${r.roomName }</h4>
							<table class="mt-3 mb-3">
								<tr>
									<td class="text-muted" width="80px">최대인원</td>
									<td class="text-muted">${r.maxAccept }</td>
								</tr>
								<tr>
									<td class="text-muted">체크인</td>
									<td class="text-muted">${r.checkinTime }</td>
								</tr>
								<tr>
									<td class="text-muted">체크아웃</td>
									<td class="text-muted">${r.checkoutTime }</td>
								</tr>
							</table>
							<h5 class="lh-1 fw-bold"><fmt:formatNumber value="${r.roomPrice }" pattern="#,###"/>원</h5>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
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
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		};
		var map = new kakao.maps.Map(mapContainer, mapOption);
 	</script>

	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous">
</script>


</body>
</html>