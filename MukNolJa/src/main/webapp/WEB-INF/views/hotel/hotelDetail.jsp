<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<table class="table align-middle mb-5">
			<tr>
				<td rowspan="3" scope="col" width="300">
					<img src="${ hotelImg }" style="margin-left: auto; margin-right: auto; display: block;">
				</td>
				<td colspan="3" height="200">
					<h1 class="fw-bold">${hotel.hotelName }</h1>
					<table class="mt-3 mb-3">
						<tr>
							<td class="text-muted" width="100px"><i class="bi bi-wifi"></i> 와이파이</td>
							<td>
								<c:if test="${hotel.wifi=='Y' }">가능</c:if>
								<c:if test="${hotel.wifi=='N' }">불가능</c:if>
							</td>
						</tr>
						<tr>
							<td class="text-muted"><i class="bi bi-p-square-fill"></i> 주차</td>
							<td>
								<c:if test="${hotel.park=='Y' }">가능</c:if>
								<c:if test="${hotel.park=='N' }">불가능</c:if>
							</td>
						</tr>
						<tr>
							<td class="text-muted"><i class="bi bi-gift-fill"></i> 어메니티</td>
							<td>
								<c:if test="${hotel.amenity=='Y' }">가능</c:if>
								<c:if test="${hotel.amenity=='N' }">불가능</c:if>
							</td>
						</tr>
						<tr>
							<td class="text-muted"><i class="bi bi-basket-fill"></i> 조식</td>
							<td>
								<c:if test="${hotel.breakfast=='Y' }">가능</c:if>
								<c:if test="${hotel.breakfast=='N' }">불가능</c:if>
							</td>
						</tr>
					</table>
				</td>
				
			</tr>
			<tr height="200">
				<td scope="row" width="200">
					<h4>찜하기<h4>
					<h4><i class="heart-click bi-heart-fill" style="font-size: 3em; cursor: pointer;"></i></h4>
				</td>
				<td scope="row" width="200">
					<h4>리뷰 작성<h4>
					<h4><i class="heart-click bi-heart-fill" style="font-size: 3em; cursor: pointer;"></i></h4>
				</td>
			</tr>
		</table>
		
		<table class="table border-top align-middle">
			<tr>
				<td class="myHover" scope="col">
					<h4>예약하기</h4>
				</td>
				<td class="myHover" scope="col">
					<h4>리뷰보기</h4>
				</td>
			</tr>
		</table>
		${hotelImg }<br>
		${roomArray }<br>
		${roomThumbnail }
		<!-- 객실 리스트 시작 -->
		<div id="roomList" class="row row-cols-1 row-cols-sm-1 row-cols-lg-2 justify-content-start mt-4 mb-4">
			<div class="room col mb-4">
				<div class="card">
					<div class="row">
						<div class="col col-sm-auto col-md-auto" style="margin:0; padding-right:0">
							<img id="hotelImg" class="img-fluid rounded-start" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMTlfMTYy%2FMDAxNjY2MTc4MTIyNzky.aXnPx9QwmchutQ7kHiWYYxGSZbZ9LRetTeUPgIaTJbkg.YEphq3iONv1O2z9kjPZo-tl_gUzLazQljGyLSvpxExAg.JPEG.abcd5z%2FIMG_2083.jpg&type=sc960_832" width="200px" height="300px" style="background: lightgray">
						</div>
						<div class="col mt-4 mb-4">
							<input type="hidden" name="hotelId">
							<h4 id="hotelName" class="card-title lh-1 fw-bold">디럭스 트윈룸</h4>
							<table class="mt-3 mb-3">
								<tr>
									<td class="text-muted" width="80px">최대인원</td>
									<td class="text-muted">4명</td>
								</tr>
								<tr>
									<td class="text-muted">체크인</td>
									<td class="text-muted">16:00</td>
								</tr>
								<tr>
									<td class="text-muted">체크아웃</td>
									<td class="text-muted">11:00</td>
								</tr>
							</table>
							<h5 class="lh-1 fw-bold">80,000 원</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 객실 리스트 끝 -->
		
		<!-- 리뷰 리스트 시작 -->
		<div id="reviewList">
		
		</div>
		<!-- 리뷰 리스트 끝 -->
	</div>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous">
</script>


</body>
</html>