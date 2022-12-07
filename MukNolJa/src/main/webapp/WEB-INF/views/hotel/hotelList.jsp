<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<style>
	#carouselExampleInterval{height: 450px;}
    #carouselExampleInterval img{height:450px;}
</style>
<body>

	<!-- 광고판 시작 -->
	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="10000">
				<img
					src="https://search.pstatic.net/common?type=o&size=352x196&quality=75&direct=true&src=https%3A%2F%2Fg-grafolio.pstatic.net%2F20220130_97%2F1643543618449ELxOz_PNG%2FADBE82CC-2827-423F-8700-97641FDE75DF.png%3Ftype%3Df804_452"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item" data-bs-interval="2000">
				<img
					src="https://png.pngtree.com/thumb_back/fh260/background/20210207/pngtree-texture-black-background-simple-image_556931.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img
					src="https://png.pngtree.com/thumb_back/fh260/background/20210207/pngtree-texture-black-background-simple-image_556931.jpg"
					class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleInterval" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	<!-- 광고판 끝 -->
	
	
	<div class="container mt-4">
		<h1>호텔게시판</h1>
		<h5 class="text-muted">${hotelCount }개의 호텔이 등록되어 있어요.</h5>
		<form class="row g-2">
			<div class="col mb-3 form-floating">
				<input type="text" class="form-control" id="daterangepicker" name="daterangepicker">
				<label for="daterangepicker">1박 2일</label>
				<input type="hidden" name="checkInDate">
				<input type="hidden" name="checkOutDate">
			</div>
			<div class="col form-floating">
				<select class="form-select" name="location">
					<option selected>전체</option>
					<option>서울</option>
					<option>경기</option>
					<option>인천</option>
					<option>대전</option>
					<option>대구</option>
					<option>광주</option>
					<option>부산</option>
					<option>울산</option>
					<option>충북</option>
					<option>충남</option>
					<option>전북</option>
					<option>전남</option>
					<option>경북</option>
					<option>경남</option>
					<option>강원</option>
					<option>제주</option>
				</select>
				<label for="location">지역</label>
			</div>
			<div class="col form-floating">
				<input type="email" class="form-control" name="searchValue" placeholder="검색어를 입력하세요.">
				<label for="searchValue">전체검색</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" name="wifi">
				<label class="form-check-label" for="wifi">와이파이</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" name="park">
				<label class="form-check-label" for="park">주차</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" name="breakfast">
				<label class="form-check-label" for="breakfast">조식</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" name="amenity">
				<label class="form-check-label" for="amenity">어메니티</label>
			</div>
		</form>
		
		<div class="row row-cols-1 row-cols-sm-1 row-cols-lg-2 justify-content-start mt-4 mb-4">
			<div class="col mb-4">
				<div class="card">
					<div class="row">
						<div class="col col-sm-auto col-md-auto" style="margin:0; padding-right:0">
							<img id="hotelImg" class="img-fluid rounded-start" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMTlfMTYy%2FMDAxNjY2MTc4MTIyNzky.aXnPx9QwmchutQ7kHiWYYxGSZbZ9LRetTeUPgIaTJbkg.YEphq3iONv1O2z9kjPZo-tl_gUzLazQljGyLSvpxExAg.JPEG.abcd5z%2FIMG_2083.jpg&type=sc960_832" width="200px" height="300px" style="background: lightgray">
						</div>
						<div class="col mt-4 mb-4">
							<h4 id="hotelName" class="card-title lh-1 fw-bold">롯데호텔</h4>
							<i class="bi bi-geo-alt-fill text-muted"></i><span id="hotelAddress" class="text-muted">서울시 종로구 명동</span><br>
							<table class="mt-3 mb-3">
								<tr>
									<td class="text-muted" width="100px"><i class="bi bi-wifi"></i> 와이파이</td>
									<td>가능</td>
								</tr>
								<tr>
									<td class="text-muted"><i class="bi bi-p-square-fill"></i> 주차</td>
									<td>가능</td>
								</tr>
								<tr>
									<td class="text-muted"><i class="bi bi-gift-fill"></i> 어메니티</td>
									<td>가능</td>
								</tr>
								<tr>
									<td class="text-muted"><i class="bi bi-basket-fill"></i> 조식</td>
									<td>가능</td>
								</tr>
							</table>
							<h5 class="lh-1 fw-bold">80,000 원</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
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
	<!-- daterangepicker 기본설정, 날짜 기입 시작 -->
</body>
</html>