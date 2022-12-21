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

</head>
<style>
	#hotelTable td {
		margin:0px;
		padding:0px;
	}
	.mukRange {
		width: 100%;
		background: linear-gradient(to right, #6BB6EC 0%, #6BB6EC 50%, #e9e9e9 50%, #e9e9e9 100%);
		border-radius: 8px;
		outline: none;
		transition: background 450ms ease-in;
		-webkit-appearance: none;
		accent-color: #6BB6EC;
	}
	.hotel {cursor:pointer}
    .mukRound {border-radius: 8px;}
	.mukButton {transition: all 0.5s; background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	.myHover:hover {cursor: pointer; background-color: rgba(205, 92, 92, 0.1);}
	.mukMutedText {color:#B9B9B9;}
</style>
<body>
	<jsp:include page="../member/menubar.jsp"/>
	
	<div class="container mt-5 mb-5" style="padding-top:80px">
		<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-2 justify-content-start gy-5">
			<div class="col col-lg-3">
				<div class="row row-cols-lg-1 g-5">
					<div class="col">
						<div class="mb-3">
							<span class="mukMutedText fw-bold">전체검색</span>
							<input type="text" class="form-control" name="searchValue" placeholder="찾고싶은 호텔을 입력하세요.">
						</div>
						<div class="mb-3">
							<span class="mukMutedText fw-bold">날짜</span>
							<small class="fw-bold" style="color:#6BB6EC; float:right"><span class="value">1박 2일</span></small>
							<input type="text" class="form-control" id="daterangepicker" name="daterangepicker">
							<input type="hidden" name="checkinDate">
							<input type="hidden" name="checkoutDate">
						</div>
					</div>
					<div class="col">
						<h5 class="fw-bold pb-1">상세조건</h5>
						<div class="mb-3">
							<span class="mukMutedText fw-bold">가격</span>
							<small class="fw-bold" style="color:#6BB6EC; float:right"><span class="value">10</span>만원 이하</small>
							<input id="maxPrice" name="maxPrice" class="mukRange" value="10" max="100" min="0" step="10" type="range">
						</div>
						<div class="mb-3">
							<span class="mukMutedText fw-bold">거리</span>
							<small style="color:#6BB6EC; float:right;" class="fw-bold"><span class="value">10</span>km 이하</small>
							<input id="maxLoc" name="maxLoc" class="mukRange" value="10" max="100" min="0" step="10" type="range">
						</div>
						<div class="row gx-2">
							<div class="col"><button id="searchButton" class="mukButton" style="width:100%; height:36px;">적용</button></div>
							<div id="noCategoryButton" class="col"><button class="mukButton" style="width:100%; height:36px; background: white; color: #6BB6EC; border: 1px solid #6BB6EC;">초기화</button></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col col-lg-9">
			
				<div id="hotelList" class="row row-cols-1 row-cols-sm-1 row-cols-lg-1 justify-content-start g-3">
					<div id="hotelDiv" class="hotel col pb-3" style="border-bottom:1px solid #e9e9e9; display:none">
						<div class="row g-3">
							<div class="col col-sm-6 col-lg-5">
								<img class="hotelImg img-fluid mukRound" src="#" style="background: #e9e9e9">
							</div>
							<div class="col col-sm-6 col-lg-7">
								<table id="hotelTable" class="table table-borderless" style="margin-bottom:0px; height:100%">
									<tr><td colspan="2">
										<input type="hidden" class="hotelId">
										<small class="hotelStar text-center" style="background:#6BB6EC; border-radius:5px; color:white; padding:2px 5px;"></small>
										<h4 class="hotelName lh-1 mt-1 fw-bold"></h4>
										<div class="hotelAddress mukMutedText"></span>
									</td></tr>
									<tr>
										<td class="align-bottom">
											<h4 class="fw-bold"><i class="fa-solid fa-star" style="color:#FFD600"></i><span class="avgRating"></span></h4>
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
		$("#searchButton").on("click",function(){
			var page = 1;
			var searchValue = $('input[name=searchValue]').val();
			var checkinDate = $("input[name=checkinDate]").val()+"";
			var checkoutDate = $("input[name=checkoutDate]").val()+"";
			var maxPrice = $("input[name=maxPrice]").val();
			var maxLoc = $("input[name=maxLoc]").val();
			
			$.ajax({
				url: "${contextPath}/searchHotelList.ho",
				data: {
					page: page,
					searchValue: searchValue,
					checkinDate: checkinDate,
					checkoutDate: checkoutDate,
					maxPrice: maxPrice,
					maxLoc: maxLoc
				},
				success: (data)=>{
					console.log(data);
				},
				error: (data)=>{
					console.log(data);
				}
			});
		});
	</script>
	<!-- 호텔 검색 끝 -->
	
	
	
	
	
	<script>
		$(document).ready(function(){
			var page = 1;
			$.ajax({
				url: "${contextPath}/selectHotelList.ho",
				data: {
					page: page
				},
				success: (data)=>{
					const hotelList = data.hotelList;
					const hotelImgList = data.hotelImgList;
					
					var hotelDiv = $("#hotelDiv").clone();
					hotelDiv.prop("style").removeProperty("display");
					for(var i=0;i<hotelList.length;i++) {
						hotelDiv.find(".hotelId").val(hotelList[i].hotelId);
						hotelDiv.find(".hotelName").html(hotelList[i].hotelName);
						hotelDiv.find(".hotelAddress").html(hotelList[i].hotelAddress);
						hotelDiv.find(".minPrice").html(hotelList[i].minPrice.toLocaleString()+"원~");
						hotelDiv.find(".hotelImg").prop("src", "${contextPath }/resources/uploadFiles/"+hotelImgList[i].fileModifyName);
						hotelDiv.find(".hotelStar").html(hotelList[i].star+"성급");
						hotelDiv.find(".avgRating").html(hotelList[i].avgRating.toFixed(1));
						$("#hotelList").append('<div class="hotel col pb-3" style="border-bottom:1px solid #e9e9e9">'+hotelDiv.html()+'</div>');
					}
				},
				error: (data)=>{
					console.log(data);
				}
			});
		});
	</script>
	
	
	
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
			autoApply: false
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
	
	

	
	<script>
		$(document).ready(function(){
			$(".mukRange").css("background", "linear-gradient(to right, #6BB6EC 0%, #6BB6EC 11.75%, #e9e9e9 11.75%, #e9e9e9 100%)");
	
			$(document).on('click', '.hotel', function(){
				location.href="${contextPath}/hotelDetail.ho?hotelId="+$(this).find(".hotelId").val();
			});
			
			$("#noCategoryButton").on("click", function() {
				$("#maxLoc").val(10);
				$("#maxPrice").val(10);
				$("#maxLoc").parent().find(".value").text(10);
				$("#maxPrice").parent().find(".value").text(10);
				$("#maxLoc").css("background", "linear-gradient(to right, #6BB6EC 0%, #6BB6EC 11.75%, #e9e9e9 11.75%, #e9e9e9 100%)");
				$("#maxPrice").css("background", "linear-gradient(to right, #6BB6EC 0%, #6BB6EC 11.75%, #e9e9e9 11.75%, #e9e9e9 100%)");
			});
			
			$(".mukRange").on("click", function(){
				var gradient = 100 / $(this).prop("max");
				var value = gradient*$(this).val();
				
				if(value<50) {
					event.target.style.background = 'linear-gradient(to right, #6BB6EC 0%, #6BB6EC '+(value+(2*(1-value/100)))+'%, #e9e9e9 ' +(value) + '%, #e9e9e9 100%)';
				} else if(value>50) {
					event.target.style.background = 'linear-gradient(to right, #6BB6EC 0%, #6BB6EC '+(value-(2*(value/100))) +'%, #e9e9e9 ' +(value-(2*(value/100))) + '%, #e9e9e9 100%)';
				} else {
					event.target.style.background = 'linear-gradient(to right, #6BB6EC 0%, #6BB6EC '+(value) +'%, #e9e9e9 ' +value + '%, #e9e9e9 100%)';
				}
				$(this).parent().find(".value").text($(this).val());
			});
		});
	</script>
</body>
</html>