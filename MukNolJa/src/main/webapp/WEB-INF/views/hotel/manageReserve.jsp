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
<title>${hotel.hotelName } :: 예약 관리</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
	.form-control {border:1px solid #e9e9e9 !important; border-radius:20px !important}
	.form-select {border:1px solid #e9e9e9 !important; border-radius:20px !important}
	.form-control::placeholder {color:#B9B9B9 !important;}
	.form-control::-webkit-input-placeholder {color:#B9B9B9;}
	.form-control:-ms-input-placeholder {color:#B9B9B9;}
	input:focus {outline: none !important;} /* outline 테두리 없애기 */
	textarea:focus {outline: none !important;} /* outline 테두리 없애기 */
	
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
	
	#roomTable td {
		margin:0px;
		padding:0px;
	}
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
	
	.mukSimpleButton {color:#6bb6ec; cursor:pointer;}
	.mukSimpleButton:hover {text-decoration:underline;}
	
	.replyTable tr td {padding:0px;}
	
	.dropdown-menu {
		cursor:pointer;
	}
	.dropdown-menu:hover {
		background:#fafafa !important;
	}
</style>
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>

	<div class="container">
		
		<div id="mukModal" class="modal fade modal-sm" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered text-center">
				<div class="modal-content">
					<div class="modal-body m-3">
						<p class="modalContent mb-3">예약을 취소하시겠습니까?</p>
						<button type="button" id="modal_deleteReservationButton" class="mukButton" style="width:100%" data-bs-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar shadow collapse" style="height:100%; left:0px; position:fixed;">
				<div class="position-sticky sidebar-sticky">
					<div class="text-center pb-4 m-3 mt-5 mb-5" style="border-bottom:1px solid #e9e9e9">
						<img id="hotelImg" class="img-fluid mb-3" style="width:100px; height:100px; border-radius:50%" src="${contextPath }/resources/uploadFiles/${hotelImgList[0].fileModifyName}">
						<h5 class="fw-bold mukSubText">${hotel.hotelName }</h5>
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
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-4 pb-3 mb-5" style="border-bottom:1px solid #e9e9e9">
					<h1 class="h2 fw-bold">예약 관리</h1>
				</div>
				<div id="category">
					<div class="row justify-content-between">
						<div class="col-auto">
							<select class="form-select" name="roomCategory" style="width:300px; display:inline-block;">
								<option selected value="0">전체 객실</option>
								<c:forEach items="${roomList }" var="r">
									<option value="${r.roomId }">${r.roomName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-auto">
							<select class="form-select" name="statusCategory" style="width:120px; display:inline-block;">
								<option selected value="all">전체</option>
								<option value="before">미이용</option>
								<option value="using">이용중</option>
								<option value="after">이용완료</option>
								<option value="Y">정상예약</option>
								<option value="N">예약취소</option>
							</select>
						</div>
					</div>
					<input class="form-control mt-2" style="width:300px;" type="text" name="searchValue" placeholder="예약번호, 예약자 이름으로 검색">
				</div>
				
				<div id="hasNoReservation" class="text-center mt-3 mb-3 pt-5 pb-5" style="display:none">
					<img class="mb-2" style="width:60px;" src="${contextPath }/resources/img/1f64f.svg">
					<h4 class="fw-bold">등록된 예약이 없습니다</h4>
				</div>
				
				<div class="pt-5 pb-5 text-center">
					<table id="reservationList" class="table table-borderless text-center align-middle mt-3" style="font-size:14px;">
						<tr id="reservationCategory" class="fw-bold" style="border-bottom:1px solid #f1f1f1">
							<td class="pb-3">예약번호</td>
							<td class="pb-3">성명</td>
							<td class="pb-3">전화번호</td>
							<td class="pb-3">객실 이름</td>
							<td class="pb-3">체크인</td>
							<td class="pb-3">체크아웃</td>
							<td class="pb-3">결제수단</td>
							<td class="pb-3">예약상태</td>
						</tr>
						<tr id="reservationDiv" class="reservation" style="display:none;">
							<input type="hidden" name="reservationId">
							<td class="p-2 reservationId">11</td>
							<td class="p-2 reservationName">일반인</td>
							<td class="p-2 reservationPhone">010-1111-2222</td>
							<td class="p-2 roomName">디럭스 스위트 룸</td>
							<td class="p-2 checkin">22.12.14 11:00</td>
							<td class="p-2 checkout">22.12.15 16:00</td>
							<td class="p-2 paymentMethod">카카오페이</td>
							<td class="p-2">
								<div class="nav-item dropdown mukSubText status_Y">
									<div class="reservationStatus nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-expanded="false"></div>
									<ul class="dropdown-menu text-center" style="background:white; border:1px solid #f1f1f1; font-size:14px;">
										<li><span class="mukSubText p-2 deleteReservationButton" data-bs-toggle="modal" data-bs-target="#mukModal">예약 취소/환불</span></li>
									</ul>
								</div>
							</td>
						</tr>
					</table>
					<h4 id="pageButton" class="bi bi-chevron-down mukMutedText" style="display:inline-block; margin-bottom:0px; cursor:pointer;"></h4>
				</div>
				
				
			</main>

		</div>
	</div>
	
	
	<!-- 예약리스트 보기 시작 -->
	<script>
		$(document).ready(function(){
			var maxPage;
			var page = 1;
			var reservationDiv2 = $("#reservationDiv").clone();
			reservationDiv2.prop("style").removeProperty("display");
			var reservationCategory = $("#reservationCategory").clone();
			var currValue = "";
			
			$.reservationList = function(){
				console.log($("select[name=statusCategory]").val());
				$.ajax({
					url: "${contextPath}/selectReservationList.ho",
					data: {
						page: page,
						hotelId: ${hotel.hotelId},
						statusCategory: $("select[name=statusCategory]").val(),
						roomCategory: $("select[name=roomCategory]").val(),
						searchValue: $("input[name=searchValue]").val()
					},
					success: (data)=>{
						maxPage = data.maxPage;
						console.log(data.list);
						
						if(data.list.length==0) {
							$("#reservationList").html("");
							$("#pageButton").css("display", "none");
							$("#hasNoReservation").prop("style").removeProperty("display","none");
						
						} else if(page==1) {
							$("#reservationList").html("");
							$("#reservationList").append(reservationCategory.clone());
							$("#hasNoReservation").css("display", "none");
							
							if(page==maxPage) {
								$("#pageButton").css("display", "none");
							} else {
								$("#pageButton").prop("style").removeProperty("display");
							}
						}
						
						for(i of data.list) {
							var reservationDiv = reservationDiv2.clone();
							reservationDiv.find(".reservationId").html(i.reservationId);
							reservationDiv.find(".reservationName").html(i.reservationName);
							reservationDiv.find(".reservationPhone").html(i.reservationPhone);
							reservationDiv.find(".roomName").html(i.roomName);
							reservationDiv.find(".checkin").html(i.checkinDate+"<br>"+i.checkinTime);
							reservationDiv.find(".checkout").html(i.checkoutDate+"<br>"+i.checkoutTime);
							if(i.paymentMethod=='kakaopay') {
								reservationDiv.find(".paymentMethod").html('카카오페이');
							} else if(i.paymentMethod=='tosspay') {
								reservationDiv.find(".paymentMethod").html('토스페이');
							} else {
								reservationDiv.find(".paymentMethod").html('신용카드');
							}
							if(i.reservationStatus=='Y') {
								reservationDiv.find(".reservationStatus").html("예약완료");
							} else {
								reservationDiv.find(".reservationStatus").html("예약취소");
								reservationDiv.find(".reservationStatus").siblings("ul").remove();
								reservationDiv.find(".reservationStatus").removeClass("dropdown-toggle").removeClass("nav-link").removeAttr("data-bs-toggle").removeAttr("role");
							}
							if(i.isCheckin>0 && i.isCheckout>0 && i.reservationStatus=='Y') {
								reservationDiv.find(".reservationStatus").html("이용완료");
							} else if(i.isCheckin>0 && i.isCheckout<0 && i.reservationStatus=='Y') {
								reservationDiv.find(".reservationStatus").html("이용중");
							}
							
							$("#reservationList").append(reservationDiv.clone());
						}
					},
					error: (data)=>{
						console.log(data);
					}
				});
			}
			$.reservationList();
			
			$("input[name=searchValue]").keyup(function(){
				if($(this).val()!=currValue) {
					currValue = $(this).val();
					page=1;
					$.reservationList();
				}
			});
			$("select[name=roomCategory]").change(function(){
				page=1;
				$.reservationList();
			});
			$("select[name=statusCategory]").change(function(){
				page=1;
				$.reservationList();
			});
			
			$("#pageButton").on("click", function(){
				if(page<maxPage) {
					page+=1;
					$.reservationList();
				}
				if(page==maxPage) {
					$(this).css("display", "none");
				}
			});
		});
	</script>
	<!-- 예약리스트 보기 끝 -->
	
	
	<script>
		var reservationId;
		var reservationTd;
		
		$(document).on("click", ".deleteReservationButton", function(){
			reservationTd = $(this).closest(".reservation");
			reservationId = $(this).closest(".reservation").find(".reservationId").text();
			$("#mukModal").find(".modalContent").text(reservationId+"번 예약을 취소하시겠습니까?");
		});
		
		$("#modal_deleteReservationButton").on("click", function(){
			console.log(reservationId);
			$.ajax({
				url: "${contextPath}/deleteReservation.ho",
				data: {
					reservationId: reservationId
				},
				success: (data)=>{
					console.log(data);
					reservationTd.find(".reservationStatus").html("예약취소");
					reservationTd.find(".reservationStatus").removeClass("dropdown-toggle").removeClass("nav-link").removeAttr("data-bs-toggle").removeAttr("role");
				},
				error: (data)=>{
					console.log(data);
				}
			});
		});
	</script>
</body>
</html>