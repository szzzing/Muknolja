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
<title>리뷰 관리</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
	.form-control {border:1px solid #e9e9e9 !important}
	.form-select {border:1px solid #e9e9e9 !important}
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
							<a class="nav-link" href="admin.ho">
								<i class="fa-solid fa-house"></i>
								<span data-feather="home" class="align-text-bottom"></span>
								통계
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="manageHotel.ho">
								<i class="fa-solid fa-hotel"></i>
								<span data-feather="file" class="align-text-bottom"></span>
								호텔 관리
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="manageRoom.ho">
								<i class="fa-solid fa-door-closed"></i>
								<span data-feather="file" class="align-text-bottom"></span>
								객실 관리
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="manageReview.ho">
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
					<h1 class="h2 fw-bold">리뷰 관리</h1>
				</div>
				<div class="newReviewList">
				
				</div>
				
				<div class="reviewList">
					<div id="category" class="row g-3">
						<select class="form-select" name="searchByRoom" style="width:300px;">
							<option selected value="0">전체 객실</option>
							<c:forEach items="${roomList }" var="r">
								<option value="${r.roomId }">${r.roomName }</option>
							</c:forEach>
						</select>
						<select class="form-select" name="orderBy" style="width:100px; float:right">
							<option selected>최신순</option>
							<option>별점순</option>
						</select>
					</div>
					
					
					<!-- 리뷰 리스트 시작 -->
					<div id="reviewList" class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-1 pt-5 pb-5">
						<div id="reviewDiv" class="review col mt-3 mb-3" style="border-bottom:1px solid #e9e9e9; display:none">
							<input type="hidden" name="reviewId">
							<table class="table table-borderless">
								<tr>
									<td rowspan="5" style="width:60px;"><span class="ratingEmoji" style="font-size:60px"></span></td>
									<td>
										<h5 class="fw-bold">
											[<span class="reservationId"></span>]
											<span class="roomName"></span>
										</h5>
										<span class="ratingStar"></span>
										<span class="rating"></span>
									</td>
								</tr>
								<tr>
									<td class="mukSubText">
										<span class="nickName fw-bold"></span>
										·
										<span class="checkinDate"></span>
										~
										<span class="checkoutDate"></span> 숙박
									</td>
								</tr>
								<tr>
									<td class="reviewContent"></td>
								</tr>
								<tr>
									<td class="mukMutedText"><small class="createDate"></small></td>
								</tr>
							</table>
						</div>
					</div>
					<!-- 리뷰 리스트 끝 -->
				</div>
			</main>

		</div>
	</div>
	
	
	<!-- 리뷰리스트 보기 시작 -->
	<script>
		$(document).ready(function(){
			var reviewDiv = $("#reviewDiv").clone();
			reviewDiv.prop("style").removeProperty("display");
			
			$.reviewList = function(){
				
				// 리뷰 불러오기
				$.ajax({
					url: "${contextPath}/reviewList.ho",
					data: {
						hotelId: ${hotel.hotelId},
						orderBy: $("select[name=orderBy]").val(),
						searchByRoom: $("select[name=searchByRoom]").val()
					},
					success: (data)=>{
						console.log(data);
						$("#reviewList").html("");

						const reviewList = data.reviewList;
						for(const r of reviewList) {
							reviewDiv.find("input[name=reviewId]").val(r.reviewId);
							reviewDiv.find(".nickName").html(r.nickName);
							reviewDiv.find(".roomName").html(r.roomName);
							reviewDiv.find(".reservationId").html(r.reservationId);
							reviewDiv.find(".reviewContent").html(r.reviewContent.replace(/(?:\r\n|\r|\n)/g, '<br/>'));
							reviewDiv.find(".rating").html(r.rating.toFixed(1));
							reviewDiv.find(".createDate").html(r.createDate);
							reviewDiv.find(".checkinDate").html(r.createDate);
							reviewDiv.find(".checkoutDate").html(r.createDate);
							
							ratingStar="";
							for(var j=1;j<=5;j++) {
								if(j<=r.rating) {
									ratingStar = ratingStar+'<i class="fa-solid fa-star" style="color:#FFD600"></i>';
								} else {
									ratingStar = ratingStar+'<i class="fa-solid fa-star" style="color:#e9e9e9"></i>';
								}
							}
							reviewDiv.find(".ratingStar").html(ratingStar);
							
							if(r.rating==5) {
								reviewDiv.find(".ratingEmoji").text("😍");
							} else if(r.rating==4) {
								reviewDiv.find(".ratingEmoji").text("😀");
							} else if(r.rating==3) {
								reviewDiv.find(".ratingEmoji").text("🙂");
							} else if(r.rating==2) {
								reviewDiv.find(".ratingEmoji").text("😐");
							} else {
								reviewDiv.find(".ratingEmoji").text("🙁");
							}
							
							$("#reviewList").append(reviewDiv.clone());
						}
					},
					error: (data)=>{
						console.log(data);
					}
				});
			}
			$.reviewList();
		});
		
		$("select").change(function(){
			$.reviewList();
		});
	</script>
	<!-- 리뷰리스트 보기 끝 -->
</body>
</html>