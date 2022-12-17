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

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
</head>
<style>
    .mukRound {border-radius: 8px;}
	.mukButton {background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	.myHover:hover {cursor: pointer; background-color: rgba(205, 92, 92, 0.1);}
	.mukMutedText {color:#B9B9B9;}
</style>
<body>

	<div class="container mt-5 mb-5">
		<h1 class="fw-bold p-5" style="text-align:center;">호텔게시판</h1>
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
				<select class="form-select" name="accept">
					<option selected>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
				<label for="accept">인원</label>
			</div>
			<div class="col form-floating">
				<input type="text" class="form-control" name="searchValue" placeholder="검색어를 입력하세요.">
				<label for="searchValue">전체검색</label>
			</div>
			<table class="hotelOptionTable table table-borderless align-middle text-center">
					<tr>
						<td style="color:#E9E9E9;">
							<input type="hidden" name="wifi" value='N'>
							<h2><i class="fa-solid fa-wifi"></i></h2>
							와이파이
						</td>
						<td style="color:#E9E9E9;">
							<input type="hidden" name="park" value='N'>
							<h2><i class="bi bi-p-square-fill"></i></h2>
							주차
						</td>
						<td style="color:#E9E9E9;">
							<input type="hidden" name="amenity" value='N'>
							<h2><i class="bi bi-gift-fill"></i></h2>
							어메니티
						</td>
						<td style="color:#E9E9E9;">
							<input type="hidden" name="breakfast" value="N">
							<h2><i class="fa-solid fa-utensils"></i></h2>
							조식
						</td>
						<td style="color:#E9E9E9;">
							<input type="hidden" name="fitness" value="N">
							<h2><i class="fa-solid fa-dumbbell"></i></h2>
							피트니스
						</td>
						<td style="color:#E9E9E9;">
							<input type="hidden" name="swim" value="Y">
							<h2><i class="fa-solid fa-water-ladder"></i></h2>
							수영장
						</td>
					</tr>
				</table>
		</form>
		
		<div class="row row-cols-1 row-cols-sm-1 row-cols-lg-2 justify-content-start mt-4 mb-4">
			<div class="hotel col mb-4">
				<div class="row">
						<table class="col table table-borderless">
							<tr>
								<td style="width:200px" rowspan="4">
									<img class="hotelImg mukRound" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMTlfMTYy%2FMDAxNjY2MTc4MTIyNzky.aXnPx9QwmchutQ7kHiWYYxGSZbZ9LRetTeUPgIaTJbkg.YEphq3iONv1O2z9kjPZo-tl_gUzLazQljGyLSvpxExAg.JPEG.abcd5z%2FIMG_2083.jpg&type=sc960_832" width="200px" height="200px" style="background: lightgray">
								</td>
								<td colspan="2" class="align-top">
									<h4 class="hotelName lh-1 fw-bold">롯데호텔 부산</h4>
									<small class="bi bi-geo-alt-fill text-muted overflow-hidden"></small><small id="hotelAddress" class="text-muted">부산 부산진구 가야대로 772</small><br>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="padding-top:0px">
									<small class="star">5성급</small><br>
									<small>
										<i class="fa-solid fa-wifi"></i>
										<i class="fa-solid fa-square-parking"></i>
										<i class="fa-solid fa-gift"></i>
										<i class="fa-solid fa-utensils"></i>
										<i class="fa-solid fa-dumbbell"></i>
										<i class="fa-solid fa-water-ladder"></i>
									</small><br>
								</td>
							</tr>
							<tr>
								<td>
									<h5 class="fa-solid fa-star"></h5><b>4.5</b>/5
								</td>
								<td class="text-end">
									<i class="fa-solid fa-heart"></i>10
									<i class="fa-solid fa-star"></i>10
								</td>
							</tr>
							<tr>
								<td colspan="2" class="align-bottom text-end" style="padding-top:0px">
									<h5 class="lh-1 fw-bold" style="margin:0px">80,000원~</h5>
								</td>
							</tr>
						</table>
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
	<!-- daterangepicker 기본설정, 날짜 기입 끝 -->
	

	<!-- 호텔 옵션 선택 -->
	<script>
		$(".hotelOptionTable").find("td").on("click", function(){
			if($(this).css("color")=="rgb(233, 233, 233)") {
				$(this).prop("style").removeProperty("color");
				$(this).find("input[type=hidden]").val("Y");
			} else {
				$(this).css("color", "#E9E9E9");
				$(this).find("input[type=hidden]").val("N");
			}
		});
	</script>
	<!-- 호텔 옵션 선택 끝 -->
	
	<script>
		$(".hotel").on("click", function(){
// 			location.href="${contextPath}/hotelDetail.ho?hotelId="+$("input[name=hotelId]").val();
			location.href="${contextPath}/hotelDetail.ho?hotelId=4";
		});
	</script>
</body>
</html>