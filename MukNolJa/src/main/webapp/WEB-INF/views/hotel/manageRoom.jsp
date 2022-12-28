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
<title>객실 관리</title>
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
	
	#writeRoomButton {color:#6bb6ec; cursor:pointer;}
	#writeRoomButton:hover {text-decoration:underline;}
	
	#modifyButton {transition: all 0.3s; background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	#deleteButton {transition: all 0.3s; background: white; height:40px; border-radius: 8px; padding:0px 10px; color: #6BB6EC; border: 1px solid #6BB6EC;}
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
								<i class="fa-solid fa-door-closed"></i>
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
			
			
			<!-- 객실 리스트 div -->
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 mb-5">
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-4 pb-3 mb-5" style="border-bottom:1px solid #e9e9e9">
					<h1 class="h2 fw-bold">객실 관리</h1>
					<div id="writeRoomButton" class="fw-bold">객실 추가</div>
				</div>
				<div id="roomDivList" class="row row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-1 g-3">
					<div id="roomDiv" class="room col pb-3" style="border-bottom:1px solid #e9e9e9; display:none">
						<div class="row g-3" data-bs-toggle="modal" data-bs-target="#roomDetailModal">
							<div class="col col-3">
								<img class="roomImg img-fluid mukRound h-100" src="#">
							</div>
							<div class="col col-9">
								<table id="roomTable" class="table table-borderless" style="margin-bottom:0px; height:100%">
									<tr><td>
										<input type="hidden" class="roomId">
										<h4 class="roomName lh-1 fw-bold"></h4>
										<div class="roomIntro mukSubText"></div>
										<span class="mukSubText checkinTime"></span>
										<span class="mukSubText">-</span>
										<span class="checkoutTime mukSubText"></span>
									</td></tr>
									<tr><td class="align-bottom pt-3">
										<h4 class="roomPrice lh-1 fw-bold"></h4>
									</td></tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</main>
			<!-- 객실 리스트 div -->

		</div>
	</div>
	
	
	
	<!-- 객실 정보 불러오기 시작 -->
	<script>
		$(document).ready(function(){
			var roomDiv = $("#roomDiv").clone();
			roomDiv.prop("style").removeProperty("display");
			
			
			$.roomList = function(){
				
				$.ajax({
					url: "${contextPath}/selectAllRoom.ho",
					data: {
						hotelId: ${hotel.hotelId}
					},
					success: (data)=>{
						$("#roomDivList").html("");
						console.log(data);
						
						$("#roomDivList").html("");
						for(var i of data) {
							var roomDiv2 = roomDiv.clone();
							roomDiv2.find(".roomId").val(i.roomId);
							roomDiv2.find(".roomName").html(i.roomName);
							roomDiv2.find(".roomIntro").html(i.roomIntro.replace(/(?:\r\n|\r|\n)/g, '<br/>'));
							roomDiv2.find(".roomInfo").html(i.roomInfo.replace(/(?:\r\n|\r|\n)/g, '<br/>'));
							roomDiv2.find(".checkinTime").html(i.checkinTime);
							roomDiv2.find(".checkoutTime").html(i.checkoutTime);
							roomDiv2.find(".roomPrice").html(i.roomPrice.toLocaleString()+"원");
							roomDiv2.find(".roomImg").prop("src", "${contextPath }/resources/uploadFiles/"+i.thumbnail);
							$("#roomDivList").append('<div class="room col pb-3" style="border-bottom:1px solid #f1f1f1">'+roomDiv2.html()+'</div>');
						}
					},
					error: (data)=>{
						
					}
				});
			}
			$.roomList();
		});
	</script>
	<!-- 객실 정보 불러오기 끝 -->
	
	<!-- 버튼 -->
	<script>
		$("#writeRoomButton").on("click", function(){
			location.href="${contextPath}/writeRoom.ho";
		});
	</script>
	<!-- 버튼 -->
	
	<!-- 룸디테일 모달 시작 -->
	<div id="roomDetailModal" class="modal fade modal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body m-3">
					<div class="row row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-1 g-3">
						<div class="col">
							<div class="row">
								<div class="col">
									<img id="roomDetailModal_roomImg" class="img-fluid mukRound h-100" src="#" style="background-color:#F9F9F9;">
								</div>
							</div>
							<div id="roomDetailModal_roomImgList" class="row justify-content-start mt-1 mb-4 pb-5 gx-1 gy-0" style="border-bottom:1px solid #e9e9e9">
								<div id="roomDetailModal_roomImgDiv" class="col col-3" style="display:none;">
									<img class="img-fluid h-100 roomDetailModal_roomImg" src="#" style="border-radius:5px;">
								</div>
							</div>
						</div>
						<div class="col">
							<h4 id="roomDetailModal_roomName" class="fw-bold pb-3"></h4>
							<table class="table table-borderless">
								<tr>
									<td class='pb-1 mukSubText' style="width:100px">객실 소개</td>
									<td id="roomDetailModal_roomIntro" class="pb-1"></td>
								</tr>
								<tr>
									<td class='pb-1 mukSubText'>객실 설명</td>
									<td id="roomDetailModal_roomInfo" class="pb-1"></td>
								</tr>
								<tr>
									<td class='pb-1 mukSubText'>체크인</td>
									<td id="roomDetailModal_checkin" class="pb-1"></td>
								</tr>
								<tr>
									<td class='pb-1 mukSubText'>체크아웃</td>
									<td id="roomDetailModal_checkout" class="pb-1"></td>
								</tr>
							</table>
						</div>
					</div>
					<form method="post">
						<input type="hidden" name="roomId">
						<div class="row g-2">
							<div class="col">
								<button type="button" id="modifyButton" class="mukButton mt-3" style="width:100%" data-bs-dismiss="modal">수정</button>
							</div>
							<div class="col">
								<button type="button" id="deleteButton" class="mt-3" style="width:100%" data-bs-toggle="modal" data-bs-target="#deleteRoomModal">삭제</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			var roomImgDiv = $("#roomDetailModal_roomImgDiv").clone();
			
			$(document).on("click", ".room", function(){
				$.ajax({
					url: "${contextPath}/roomDetail.ho",
					data: {
						roomId: $(this).find(".roomId").val()
					},
					success: (data)=>{
						const room = data.room;
						const roomImgList = data.roomImgList;
						$("input[name=roomId]").val(room.roomId);
						$("#roomDetailModal_roomName").html(room.roomName);
						$("#roomDetailModal_roomImgList").html("");
						for(i of roomImgList) {
							if(i.fileThumbnail=='Y') {
								$("#roomDetailModal_roomImg").prop("src", "${contextPath }/resources/uploadFiles/"+i.fileModifyName);
							} else {
								roomImgDiv.prop("style").removeProperty("display");
								roomImgDiv.find("img").prop("src", "${contextPath }/resources/uploadFiles/"+i.fileModifyName);
								$("#roomDetailModal_roomImgList").append('<div class="col col-3">'+roomImgDiv.html()+'</div>');
							}
						}
						$("#roomDetailModal_roomIntro").html(room.roomIntro.replace(/(?:\r\n|\r|\n)/g, '<br/>'));
						$("#roomDetailModal_roomInfo").html(room.roomInfo.replace(/(?:\r\n|\r|\n)/g, '<br/>'));
						$("#roomDetailModal_checkin").html(room.checkinTime);
						$("#roomDetailModal_checkout").html(room.checkoutTime);
						
						$(document).on("click", ".roomDetailModal_roomImg", function(){
							var src = $("#roomDetailModal_roomImg").prop("src");
							$("#roomDetailModal_roomImg").prop("src", $(this).prop("src"));
							$(this).prop("src", src);
						});
					},
					error: (data)=>{
						console.log(data);
					}
				});
			});
		});
	</script>
	<!-- 룸이미지 모달 끝 -->
	
	
	<!-- 객실 수정, 삭제 시작 -->
	<div id="deleteRoomModal" class="modal fade modal-sm" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered text-center">
			<div class="modal-content">
				<div class="modal-body m-3">
					<p class="modalContentmb-3">정말 삭제하시겠습니까?</p>
					<button type="button" id="deleteRoomButton" class="mukButton" style="width:100%" data-bs-dismiss="modal">삭제</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$("#modifyButton").on("click", function(){
			$("form").prop("action", "${contextPath }/modifyRoom.ho");
			$("form").submit();
		});
		$("#deleteRoomButton").on("click", function(){
			$.ajax({
				url: "${contextPath}/deleteRoom.ho",
				data: {
					roomId: $("input[name=roomId]").val()
				},
				success: (data)=>{
					$.roomList();
				},
				error: (data)=>{
					
				}
			});
		});
	</script>
	<!-- 객실 수정, 삭제 끝 -->
	
</body>
</html>