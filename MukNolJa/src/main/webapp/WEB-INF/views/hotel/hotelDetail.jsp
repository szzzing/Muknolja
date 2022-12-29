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
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
	.form-control {border:2px solid #f1f1f1 !important; border-radius:20px !important}
	.form-select {border:2px solid #f1f1f1 !important; border-radius:20px !important}
  	* {font-family: 'Noto Sans KR', sans-serif;}
  	input {font-family: 'Noto Sans KR', sans-serif;}
  	::-webkit-scrollbar {width:5px;}
	::-webkit-scrollbar-thumb {background-color:#e9e9e9; border-radius:10px;}
	::-webkit-scrollbar-track {opacity:0;}
	
	.blinking{
		-webkit-animation: blink 0.3s ease-in-out infinite alternate;
		-moz-animation: blink 0.3s ease-in-out infinite alternate;
		animation: blink 0.3s ease-in-out infinite alternate;
	}
	
	@-webkit-keyframes blink{
		0% {opacity: 0;}
		100% {opacity: 1;}
	}
	
	@-moz-keyframes blink{
		0% {opacity: 0;}
		100% {opacity: 1;}
	}
	@keyframes blink{
		0% {opacity: 0;}
		100% {opacity: 1;}
	}
	
	ul li {
		list-style: none;
		float: left;
		padding: 10px;
	}
	#likeHotelButton {
		cursor: pointer;
	}
	img {
		cursor: pointer;
	}
	#searchMap {
		cursor: pointer;
		color: #6BB6EC;
	}
	#searchMap:hover {
		text-decoration: underline;
	}
	.writableReview {
		cursor: pointer;
	}
	.writableReview:hover {
		text-decoration: underline;
	}
	#roomTable td {
		margin:0px;
		padding:0px;
	}
	.hotelImg {transition: all 0.3s;}
	.hotelImg:hover {opacity:0.5;}
	.roomDetailModal_roomImg {transition: all 0.3s;}
	.roomDetailModal_roomImg:hover { opacity:0.5; }
	.mukCategory {color:#6BB6EC !important; border-bottom:3px solid #6BB6EC; font-weight:bold;}
	.mukDisplayNone {display:none !important;}
	.mukRound {border-radius: 8px;}
	.mukButton {transition: all 0.3s; background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	.disabledMukButton {height:40px; border-radius: 8px; padding:0px 10px; cursor:pointer; background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	.myHover:hover {cursor: pointer; background-color: rgba(205, 92, 92, 0.1);}
	.mukMutedText {color:#B9B9B9;}
	.mukSubText {color:rgba(0,0,0,.56);}
	
/* 	별점 관련 */
	.star-rating {
		color:#f1f1f1;
		display: flex;
		width: 5em;
		flex-direction: row-reverse;
		justify-content: space-around;
	}
	.star-rating input {
		display: none;
	}
	.star-rating label {
		cursor: pointer;
	}
	.star-rating :checked ~ label {
		-webkit-text-fill-color: #FFD600;
	}
	.star-rating label:hover,
	.star-rating label:hover ~ label {
	  -webkit-text-fill-color: #FFD600;
	}
	
	.replyTable tr td {padding:0px;}
</style>
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
	<script>
		document.title="먹놀자 :: ${hotel.hotelName}";
	</script>
	<jsp:include page="../member/menubar.jsp"/>
	
	<!-- 예약 전송용 form 시작 -->
	<form action="writeReservation.ho" method="post">
		<input type="hidden" name="roomId">
		<input type="hidden" name="checkinDate">
		<input type="hidden" name="checkoutDate">
	</form>
	<!-- 예약 전송용 form 끝 -->
	
	<div id="mukModal" class="modal fade modal-sm" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered text-center">
			<div class="modal-content">
				<div class="modal-body m-3">
					<p class="modalContentmb-3">로그인 후 이용해주세요.</p>
					<button type="button" class="mukButton" style="width:100%" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container-sm mt-5 mb-5" style="padding-top:80px">
		<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-2 pb-5 justify-content-start gy-5">
			<div class="col">
				<div class="row">
					<div class="col">
						<c:forEach items="${hotelImgList }" var="i" varStatus="status">
							<c:if test="${i.fileThumbnail=='Y' }">
								<img id="hotelImg" class="img-fluid mukRound h-100" src="${contextPath }/resources/uploadFiles/${i.fileModifyName}" style="background-color:#F9F9F9;">
							</c:if>
						</c:forEach>
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
				<h1 class="fw-bold pb-1">${hotel.hotelName }
					<c:if test="${!empty loginUser && loginUser.memberType=='N' }">
						<i id="likeHotelButton" class="fa-solid fa-bookmark"
							<c:if test="${!empty loginUser && isLikeHotel==0 }">style="color:#E9E9E9"</c:if>
							<c:if test="${!empty loginUser && isLikeHotel==1 }">style="color:#6BB6EC"</c:if>>
						</i>
					</c:if>
					<c:if test="${empty loginUser }">
						<i id="likeHotelButton" class="fa-solid fa-bookmark" style="color:#E9E9E9" data-bs-toggle="modal" data-bs-target="#mukModal"></i>
					</c:if>
				</h1>
				<h4 class="fw-bold pb-3">
					<i class="fa-solid fa-star" style="color:#FFD600"></i>
					<span class="avgRating"></span>
				</h4>
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
		
		
		<div class="row row-cols-4 justify-content-start text-center mt-5 mb-5" style="border-bottom:1px solid #e9e9e9">
			<div class="col col-auto p-2 mukMutedText mukCategory" id="roomListButton" scope="col">
				예약하기
			</div>
			<div class="col col-auto p-2 mukMutedText" id="hotelInfoButton" scope="col" style="cursor:pointer">
				호텔 정보
			</div>
			<div class="col col-auto p-2 mukMutedText" id="reviewListButton" scope="col" style="cursor:pointer">
				리뷰
			</div>
			<div class="col"></div>
		</div>
		
		
		<!-- 객실 리스트 시작 -->
		<div id="roomList" class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-2 gy-5">
			
			<div id="hasNoRoom" class="col-lg-12 text-center pt-5 pb-5">
				<img class="mb-2" style="width:60px;" src="${contextPath }/resources/img/1f64f.svg">
				<h4 class="fw-bold">예약 가능한 객실이 없습니다</h4>
				<div class="fw-bold mukSubText">다음 기회에 찾아주세요</div>
			</div>
			
			<div id="hasRoom1" class="col col-lg-3">
				<div class="mb-3 form-floating">
					<input type="text" class="form-control" id="daterangepicker" name="daterangepicker">
					<label for="daterangepicker">1박 2일</label>
				</div>
			</div>
		
			<!-- 객실 리스트 div -->
			<div id="hasRoom2" class="col col-lg-9">
				<div id="roomCategory">
<!-- 					<select class="form-select" name="orderBy" style="width:100px; display:inline-block; float:right;"> -->
<!-- 						<option selected>최신순</option> -->
<!-- 						<option>낮은가격순</option> -->
<!-- 						<option>높은가격순</option> -->
<!-- 					</select> -->
				</div>
				<div id="roomDivList" class="row row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-1 g-5">
					<div id="roomDiv" class="col pb-3" style="border-bottom:1px solid #e9e9e9; display:none">
						<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-2 g-3">
							<div class="col">
								<img class="roomImg img-fluid mukRound h-100" data-bs-toggle="modal" data-bs-target="#roomDetailModal" src="#" style="background: lightgray">
							</div>
							<div class="col">
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
										<small class="emptyRoom fw-bold blinking" style="color:red; display:none">마감임박</small>
										<h4 class="roomPrice lh-1 fw-bold"></h4>
										<c:if test="${empty loginUser }">
											<button type="button" class="reserveButton mukButton mt-3" style="width:100%" data-bs-toggle="modal" data-bs-target="#mukModal">예약하기</button>
										</c:if>
										<c:if test="${!empty loginUser && loginUser.memberType=='N' }">
											<button type="button" class="reserveButton mukButton mt-3" style="width:100%">예약하기</button>
										</c:if>
									</td></tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 객실 리스트 div -->
			
			
		</div>
		
		<!-- 객실 리스트 끝 -->
		
		
		
		<!-- 리뷰 리스트 시작 -->
		<div id="reviewList" class="mukDisplayNone">
			<div id="hasReview">
				<div class="text-center pb-5" style="border-bottom:1px solid #e9e9e9">
					<img id="starInfo" class="mb-2" style="width:50px;"><br>
					<div style="display:inline-block">
						<h2 id="ratingStar"></h2>
					</div>
					<h2 class="fw-bold avgRating" style="display:inline-block">4.5</h2>
					<h4 class="pt-3"><span class="reviewCount"></span>개의 리뷰</h4>
				</div>
				<div id="reviewCategory" class="pt-5">
					<select class="form-select" name="searchByRoom" style="width:300px; display:inline-block;">
						<option selected value="0">전체 객실</option>
					</select>
					<select class="form-select" name="orderBy" style="width:100px; display:inline-block; float:right;">
						<option selected>최신순</option>
						<option>별점순</option>
					</select>
				</div>
			</div>
			
			<div id="hasNoSubReview" class="col text-center pt-5 pb-5">
				<img class="mb-2" style="width:60px;" src="${contextPath }/resources/img/0.svg">
				<h4 class="fw-bold">등록된 리뷰가 없습니다</h4>
				<div class="fw-bold mukSubText" onclick='$("#roomListButton").click();' style="cursor:pointer">${hotel.hotelName }의 첫번째 리뷰어가 되어주세요</div>
			</div>
			
			<div id="reviewListRow" class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-1 pt-5 pb-5">
				<div id="review" class="col mt-3 mb-3" style="border-bottom: 1px solid #e9e9e9; display:none">
					<input type="hidden" name="reviewId">
					<table class="table table-borderless">
						<tr>
							<td rowspan="5" style="width:80px;">
								<img class="ratingEmoji img-fluid mukRound" style="width:100%;" src="${contextPath }/resources/img/5.svg">
							</td>
							<td>
								<h5 class="ratingInfo fw-bold"></h5>
								<span class="ratingStar"></span>
								<span class="rating"></span>
							</td>
						</tr>
						<tr>
							<td class="mukSubText">
								<span class="nickName"></span>
								·
								<span class="roomName"></span>
							</td>
						</tr>
						<tr>
							<td class="reviewContent"></td>
						</tr>
						<tr>
							<td class="createDate mukMutedText"></td>
						</tr>
						<tr>
							<td class="align-middle businessReplyTable pt-3 pb-3" colspan="2" style="display:none">
								<div class="p-4" style="background:#fafafa; border-radius:20px;">
									<table class="replyTable table table-borderless" style="margin-bottom:0px; padding:0;">
										<tr class="align-middle">
											<td style="width:30px; padding-bottom:10px">
												<c:forEach items="${hotelImgList }" var="i" varStatus="status">
													<c:if test="${i.fileThumbnail=='Y' }">
														<img class="img-fluid mukRound" src="${contextPath }/resources/uploadFiles/${i.fileModifyName}" style="width:24px; height:24px; border-radius:50%;">
													</c:if>
												</c:forEach>
											</td>
											<td style="padding-bottom:10px"><h6 class="fw-bold" style="margin:0px; padding-top:3px; display:inline-block;">${hotel.hotelName }</h6></td>
										</tr>
										<tr class="viewReplyTr" colspan="2">
											<td colspan="2" class="businessReply"></td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<!-- 리뷰 리스트 끝 -->
		
		<!-- 호텔 정보 시작 -->
		<div id="hotelInfoList" class="mukDisplayNone">
			<h4 class="fw-bold pb-3">기본 정보</h4>
			<div id="hotelInfo">${hotel.hotelInfo }</div>
			
			<h4 class="fw-bold pt-5 pb-3">위치</h4>
			<div class="pb-3">${hotel.hotelAddress }<span id="searchMap" class="p-1 fw-bold">길찾기</span></div>
			<div id="map" class="mukRound" style="width:540px;height:300px;"></div>
			
		</div>
		<!-- 호텔 정보 끝 -->
	</div>
	
	
	
	
	<!-- 객실 정보 불러오기 시작 -->
	<script>
		$(document).ready(function(){
			var roomDiv = $("#roomDiv").clone();
			roomDiv.prop("style").removeProperty("display");
			
			
			$.roomList = function(){
				const inout = $("#daterangepicker").val().split(" - ");
				
				const checkin = new Date(inout[0]);
				const checkout = new Date(inout[1]);
				
				var diff = checkout - checkin;
				var currDay = 24 * 60 * 60 * 1000;
				var journey = parseInt(diff/currDay);
	
				$.ajax({
					url: "${contextPath}/selectAllRoom.ho",
					data: {
						hotelId: ${hotel.hotelId},
						checkinDate: $("input[name=checkinDate]").val(),
						checkoutDate: $("input[name=checkoutDate]").val()
					},
					success: (data)=>{
						
						$("#roomDivList").html("");
						
						if(data.length==0) {
							$("#hasRoom1").css("display", "none");
							$("#hasRoom2").css("display", "none");
							$("#hasNoRoom").prop("style").removeProperty("display");
						} else {
							$("#hasNoRoom").css("display", "none");
							$("#hasRoom1").prop("style").removeProperty("display");
							$("#hasRoom2").prop("style").removeProperty("display");
						}
						
						for(var i of data) {
							var roomDiv2 = roomDiv.clone();
							roomDiv2.find(".roomId").val(i.roomId);
							roomDiv2.find(".roomName").html(i.roomName);
							roomDiv2.find(".roomIntro").html(i.roomIntro);
							roomDiv2.find(".checkinTime").html(i.checkinTime);
							roomDiv2.find(".checkoutTime").html(i.checkoutTime);
							roomDiv2.find(".roomPrice").html((i.roomPrice*journey).toLocaleString()+"원");
							roomDiv2.find(".roomImg").prop("src", "${contextPath }/resources/uploadFiles/"+i.thumbnail);
							if(i.emptyRoom==0) {
								roomDiv2.find("button").text("예약불가");
								roomDiv2.find("button").attr("disabled",true).removeClass("mukButton").addClass("disabledMukButton");
							} else if(i.emptyRoom<2) {
								roomDiv2.find(".emptyRoom").prop("style").removeProperty("display");
							}
							$("#roomDivList").append('<div class="room col pb-3" style="border-bottom:1px solid #f1f1f1">'+roomDiv2.html()+'</div>');
						
							
							// 리뷰리스트 객실별 리뷰보기 용도
							$("select[name=searchByRoom]").append('<option value="'+i.roomId+'">'+i.roomName+'</option>');
						}
					},
					error: (data)=>{
						console.log(data);
					}
				});
			}
			$.roomList();
		});
	</script>
	<!-- 객실 정보 불러오기 끝 -->
	
	
	
	
	<!-- 리뷰리스트 보기 시작 -->
	<script>
		$(document).ready(function(){
			var reviewDiv = $("#review").clone();
			reviewDiv.prop("style").removeProperty("display");
			
			$.reviewList = function(){
				// 리뷰 불러오기
				$("#reviewListRow").html("");
				$.ajax({
					url: "${contextPath}/reviewList.ho",
					data: {
						hotelId: ${hotel.hotelId},
						orderBy: $("#reviewCategory select[name=orderBy]").val(),
						searchByRoom: $("#reviewCategory select[name=searchByRoom]").val()
					},
					success: (data)=>{
						reviewList = data.reviewList;
						const avgRating = data.avgRating;
						const reviewCount = data.reviewCount;
						
						if(reviewList.length==0) {
							$("#hasNoSubReview").prop("style").removeProperty("display");
							if($("#reviewCategory select[name=searchByRoom]").val()!=0) {
								var selectedRoom = $("#reviewCategory select[name=searchByRoom]").val();
								selectedRoom = $("option[value="+selectedRoom+"]").html();
								$("#hasNoSubReview").find(".mukSubText").html(selectedRoom+"의 첫번째 리뷰어가 되어주세요");
							} else {
								$("#hasNoSubReview").find(".mukSubText").html("${hotel.hotelName}의 첫번째 리뷰어가 되어주세요");
							}
						} else {
							$("#hasNoSubReview").css("display", "none");
						}
						
						if(avgRating==0) {
							$("#starInfo").prop("src", "${contextPath }/resources/img/1.svg");
							$(".avgRating").text("");
						} else {
							$("#starInfo").prop("src", "${contextPath }/resources/img/"+avgRating.toFixed(0)+".svg");
							$(".avgRating").text(avgRating.toFixed(1));
						}
						$(".reviewCount").text(reviewCount);
						
						var ratingStar="";
						for(var j=1;j<=5;j++) {
							if(j<=avgRating) {
								ratingStar = ratingStar+'<i class="fa-solid fa-star" style="color:#FFD600"></i>';
							} else if(j-avgRating>0 && j-avgRating<1) {
								var x = (1-(j-avgRating))*100;
								ratingStar = ratingStar+'<i class="fa-solid fa-star" style="background:linear-gradient(90deg, #FFD600 '+x+'%, #f1f1f1 '+x+'%); color:transparent; -webkit-background-clip:text;"></i>';
							} else {
								ratingStar = ratingStar+'<i class="fa-solid fa-star" style="color:#f1f1f1"></i>';
							}
						}
						$("#ratingStar").html(ratingStar);
						
						for(const r of reviewList) {
							reviewDiv.find("input[name=reviewId]").val(r.reviewId);
							reviewDiv.find(".nickName").html(r.nickName);
							reviewDiv.find(".roomName").html(r.roomName);
							reviewDiv.find(".reviewContent").html(r.reviewContent.replace(/(?:\r\n|\r|\n)/g, '<br/>'));
							reviewDiv.find(".rating").html(r.rating.toFixed(1));
							reviewDiv.find(".createDate").html(r.createDate);
							
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
								reviewDiv.find(".ratingInfo").text("여기만한 곳은 어디에도 없을 거예요.");
								reviewDiv.find(".ratingEmoji").prop("src", "${contextPath }/resources/img/5.svg");
							} else if(r.rating==4) {
								reviewDiv.find(".ratingInfo").text("여기라면 다음에 또 이용할 거예요.");
								reviewDiv.find(".ratingEmoji").prop("src", "${contextPath }/resources/img/4.svg");
							} else if(r.rating==3) {
								reviewDiv.find(".ratingInfo").text("기대 이상이네요.");
								reviewDiv.find(".ratingEmoji").prop("src", "${contextPath }/resources/img/3.svg");
							} else if(r.rating==2) {
								reviewDiv.find(".ratingInfo").text("조금만 더 신경 써 주세요.");
								reviewDiv.find(".ratingEmoji").prop("src", "${contextPath }/resources/img/2.svg");
							} else {
								reviewDiv.find(".ratingInfo").text("별로예요.");
								reviewDiv.find(".ratingEmoji").prop("src", "${contextPath }/resources/img/1.svg");
							}
							
							if(r.businessReply!=null) {
								reviewDiv.find(".businessReplyTable").prop("style").removeProperty("display");
								reviewDiv.find(".businessReply").html(r.businessReply.replace(/(?:\r\n|\r|\n)/g, '<br/>'));
							} else {
								reviewDiv.find(".businessReplyTable").css("display","none");
							}
							
							$("#reviewListRow").append(reviewDiv.clone());
						}
					},
					error: (data)=>{
						console.log(data);
					}
				});
			}
			$.reviewList();

			$("#reviewCategory select").change(function(){
				$.reviewList();
			});
		});
	</script>
	<!-- 리뷰리스트 보기 끝 -->
	
	
	
	
	
	<!-- 호텔 찜하기 버튼 시작 -->
	<script>
		$(document).ready(function(){
			$("#likeHotelButton").on("click", function(){
				if(${!empty loginUser}) {
					
					if($(this).css("color")=="rgb(233, 233, 233)") {
						$(this).css("color", "#6BB6EC");
						$.ajax({
							url: "${contextPath}/insertLikeHotel.ho",
							data: {
								id: "${loginUser.id}",
								hotelId: ${hotel.hotelId}
							},
							success: (data)=>{
							},
							error: (data)=>{
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
				}
			});
		});
	</script>
	<!-- 호텔 찜하기 버튼 끝 -->
	
	
	
	<!-- 예약 버튼 시작 -->
	<script>
		$(document).on("click", ".reserveButton", function(){
			if(${!empty loginUser}) {
				const roomId = $(this).parent().parent().parent().find(".roomId").val();
				const checkinTime = $(this).parent().parent().parent().find(".checkinTime").text();
				const checkoutTime = $(this).parent().parent().parent().find(".checkoutTime").text();
				
				$("input[name=roomId]").val(roomId);
				$("input[name=checkinTime]").val(checkinTime);
				$("input[name=checkoutTime]").val(checkoutTime);
				
				$("form").submit();
			}
		});
	</script>
	<!-- 예약 버튼 끝 -->
	
	
	
	
	<!-- 작성 가능한 리뷰 시작 -->
	<script>
		$(document).ready(function(){
			$.writableReview = function(){
				if(${!empty loginUser}) {
					$("#writableReviewList").html("");
					$.ajax({
						url: "${contextPath}/writableReview.ho",
						data: {
							id: "${loginUser.id}",
							hotelId: ${hotel.hotelId}
						},
						success: (data)=>{
							if(data.length>0) {
								for(const i of data) {
									$("#writableReviewModal").modal('show');
									$("#writableReviewList").html(
											$("#writableReviewList").html()
											+"<div class='writableReview' data-bs-target=''#writeReviewModal' data-bs-toggle='modal'>"+i.roomName + " · " + i.checkinDate + "-" + i.checkoutDate + " 방문"
											+"<input type='hidden' name='reservationId' value='" + i.reservationId + "'>"
											+"</div>");
								}
							} else {
								$("#writableReviewDiv").css("display", "none");
							}
						},
						error: (data)=>{
						}
					});
				}
				$(document).on('click', ".writableReview", function() {
					const reservationId = $("input[name=reservationId]").val();
					$.writeReviewModal(reservationId);
				});
			}
		});
	</script>
	<div class="modal fade" id="writableReviewModal" aria-hidden="true" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered text-center">
			<div class="modal-content">
				<div class="modal-body mt-3 mb-3">
					<h4 class="fw-bold pb-3" style="color:#6BB6EC">${loginUser.nickName }님의 리뷰를 기다리고 있어요</h4>
					<div id="writableReviewList" class="mukMutedText"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- 작성 가능한 리뷰 끝 -->
	
	<!-- 리뷰 작성 모달 시작 -->
	<div class="modal fade" id="writeReviewModal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered text-center">
			<div class="modal-content">
				<div class="modal-body">
					<div class="text-center mt-3 mb-3">
						<div class="star-rating space-x-4 mx-auto">
							<input type="hidden" name="rating" required>
							<input type="radio" id="5-star" value="5" name="starRating" v-model="ratings"/>
							<label for="5-star" class="star starLabel pr-4"><h2 class="fa-solid fa-star"></h2></label>
							<input type="radio" id="4-star" value="4" name="starRating" v-model="ratings"/>
							<label for="4-star" class="star starLabel"><h2 class="fa-solid fa-star"></h2></label>
							<input type="radio" id="3-star" value="3" name="starRating" v-model="ratings"/>
							<label for="3-star" class="star starLabel"><h2 class="fa-solid fa-star"></h2></label>
							<input type="radio" id="2-star" value="2" name="starRating" v-model="ratings"/>
							<label for="2-star" class="star starLabel"><h2 class="fa-solid fa-star"></h2></label>
							<input type="radio" id="1-star" value="1" name="starRating" v-model="ratings" />
							<label for="1-star" class="star starLabel"><h2 class="fa-solid fa-star"></h2></label>
						</div>
						<span id="ratingInfo" class="mukMutedText">별점을 채워주세요.</span>
					</div>
					<input type="hidden" name="memberId" value="${loginUser.id }">
					<input type="hidden" name="reservationId">
					<textarea class="form-control mb-3" name="reviewContent" rows="5" style="height:200px; resize:none" placeholder="내용" required></textarea>
					<button id="insertReviewButton" class="mukButton mb-3" style="width:80%" data-bs-dismiss="modal">작성하기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			$.writeReviewModal = function(reservationId) {
				$("#writeReviewModal").modal('show');
				$("#writeReviewModal").find('input[name=reservationId]').val(reservationId);
			};
			var nowRating="별점을 채워주세요.";
			$(".starLabel").on("mouseleave", function(){
				$("#ratingInfo").text(nowRating);
			});
			$(".starLabel").on("mouseover", function(){
				if($(this).prev().val()==5) {
					$("#ratingInfo").text("여기만한 곳은 어디에도 없을 거예요.");
				} else if($(this).prev().val()==4) {
					$("#ratingInfo").text("여기라면 다음에 또 이용할 거예요.");
				} else if($(this).prev().val()==3) {
					$("#ratingInfo").text("기대 이상이네요.");
				} else if($(this).prev().val()==2) {
					$("#ratingInfo").text("조금만 더 신경 써 주세요.");
				} else {
					$("#ratingInfo").text("별로예요.");
				}
			});
			$("input[type=radio]").on("click", function(){
				if($(this).val()==5) {
					$("#ratingInfo").text("여기만한 곳은 어디에도 없을 거예요.");
					nowRating="여기만한 곳은 어디에도 없을 거예요.";
				} else if($(this).val()==4) {
					$("#ratingInfo").text("여기라면 다음에 또 이용할 거예요.");
					nowRating="여기라면 다음에 또 이용할 거예요.";
				} else if($(this).val()==3) {
					$("#ratingInfo").text("기대 이상이네요.");
					nowRating="기대 이상이네요.";
				} else if($(this).val()==2) {
					$("#ratingInfo").text("조금만 더 신경 써 주세요.");
					nowRating="조금만 더 신경 써 주세요.";
				} else {
					$("#ratingInfo").text("별로예요.");
					nowRating="별로예요.";
				}
			});
			// 리뷰 작성 버튼
			$("#insertReviewButton").on("click", function(){
				for(var i=1;i<=5;i++) {
					if($("#"+i+"-star").is(":checked")) {
						$("input[name=rating]").val(i);
					}
				}
				$.ajax({
					url: "${contextPath}/insertReview.ho",
					data: {
						memberId: "${loginUser.id}",
						reservationId: $("input[name=reservationId]").val(),
						rating: $("input[name=rating]").val(),
						reviewContent: $("textarea[name=reviewContent]").val()
					},
					success: (data)=>{
						$("#writeReviewModal").find("textarea").val("");
						$.reviewList();
					},
					error: (data)=>{
					}
				});
			});
		});
	</script>
	<!-- 리뷰 작성 모달 끝 -->
	
	
	
	
	
	<script>
		var hotelInfo = $("#hotelInfo").html().replace(/(?:\r\n|\r|\n)/g, '<br/>');
		var hotelIntro = $("#hotelIntro").html().replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$("#hotelInfo").html(hotelInfo);
		$("#hotelIntro").html(hotelIntro);
	</script>
	
	
	
	
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

			// 길찾기
			const url = "https://map.kakao.com/link/to/${hotel.hotelName},"+${hotel.hotelGeoY}+","+${hotel.hotelGeoX};
			$("#searchMap").on("click", function(){
				window.open(url, "_blank", "width=800, height=400", true);
			});
		}
 	</script>
 	<!-- 지도 끝 -->

	
	<!-- daterangepicker 기본설정, 날짜 기입 시작 -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<script>
		let today = new Date();
		let startDate;
		let endDate;

		if(${!empty checkinDate && !empty checkoutDate}) {
			startDate = "${checkinDate}";
			endDate = "${checkoutDate}";
		} else {
			startDate = today.getFullYear()+'-'+today.getMonth()+'-'+today.getDate();
			endDate = new Date(today.getFullYear(), today.getMonth(), today.getDate()+1);
		}
		
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
			autoApply: true
		});
		
		const inout = $("#daterangepicker").val().split(" - ");
		$("input[name=checkinDate]").val(inout[0]);	
		$("input[name=checkoutDate]").val(inout[1]);
		
		const checkin = new Date(inout[0]);
		const checkout = new Date(inout[1]);
		
		var diff = checkout - checkin;
		var currDay = 24 * 60 * 60 * 1000;
		var journey = parseInt(diff/currDay);
		$("#daterangepicker").parent().find("label").text(journey+"박 "+(journey+1)+"일");
		
		$("#daterangepicker").on("change", function(){
			const inout = $(this).val().split(" - ");
			$("input[name=checkinDate]").val(inout[0]);
			$("input[name=checkoutDate]").val(inout[1]);
			const checkin = new Date(inout[0]);
			const checkout = new Date(inout[1]);
			
			var diff = checkout - checkin;
			var currDay = 24 * 60 * 60 * 1000;
			journey = parseInt(diff/currDay);
			$(this).parent().find("label").text(journey+"박 "+(journey+1)+"일");
			
			$.roomList();
		});
	</script>
	<!-- daterangepicker 기본설정, 날짜 기입 끝 -->
	
	
	<!-- 리스트 버튼 시작 -->
	<script>
		$(document).ready(function(){
			$("#roomListButton").on("click", function(){
				$(this).addClass("mukCategory");
				$("#reviewListButton").removeClass("mukCategory");
				$("#hotelInfoButton").removeClass("mukCategory");
				
				$("#roomList").removeClass("mukDisplayNone");
				$("#reviewList").addClass("mukDisplayNone");
				$("#hotelInfoList").addClass("mukDisplayNone");
			});
			$("#reviewListButton").on("click", function(){
				$(this).addClass("mukCategory");
				$("#roomListButton").removeClass("mukCategory");
				$("#hotelInfoButton").removeClass("mukCategory");
				
				$("#roomList").addClass("mukDisplayNone");
				$("#reviewList").removeClass("mukDisplayNone");
				$("#hotelInfoList").addClass("mukDisplayNone");
				$.writableReview();
			});
			$("#hotelInfoButton").on("click", function(){
				$(this).addClass("mukCategory");
				$("#roomListButton").removeClass("mukCategory");
				$("#reviewListButton").removeClass("mukCategory");
				
				$("#roomList").addClass("mukDisplayNone");
				$("#hotelInfoList").removeClass("mukDisplayNone");
				$("#reviewList").addClass("mukDisplayNone");
				
				$.viewMap();
			});
		});
	</script>
	<!-- 리스트 버튼 끝 -->
	
	
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

	<!-- 룸디테일 모달 시작 -->
	<div id="roomDetailModal" class="modal modal-lg fade modal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body m-3">
					<div class="row row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-2 g-3">
						<div class="col col-7">
							<div class="row">
								<div class="col">
									<img id="roomDetailModal_roomImg" class="img-fluid mukRound h-100" src="#" style="background-color:#F9F9F9;">
								</div>
							</div>
							<div id="roomDetailModal_roomImgList" class="row justify-content-start mt-1 gx-1 gy-0">
								<div id="roomDetailModal_roomImgDiv" class="col col-3" style="display:none;">
									<img class="img-fluid h-100 roomDetailModal_roomImg" src="#" style="border-radius:5px;">
								</div>
							</div>
						</div>
						<div class="col col-5">
							<h4 id="roomDetailModal_roomName" class="fw-bold pb-3"></h4>
							<div id="roomDetailModal_roomInfo" class='mb-3 mukSubText'></div>
							<div id="roomDetailModal_checkin" class="mukSubText"></div>
							<div id="roomDetailModal_checkout" class="mukSubText"></div>
						</div>
					</div>
					<button type="button" class="mukButton mt-3" style="width:100%" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			var roomImgDiv = $("#roomDetailModal_roomImgDiv").clone();
			
			$(document).on("click", ".roomImg", function(){
				$.ajax({
					url: "${contextPath}/roomDetail.ho",
					data: {
						roomId: $(this).parent().parent().find(".roomId").val()
					},
					success: (data)=>{
						const room = data.room;
						const roomImgList = data.roomImgList;
						$("#roomDetailModal_roomName").html(room.roomName);
						$("#roomDetailModal_roomImg").prop("src", "${contextPath }/resources/uploadFiles/"+roomImgList[0].fileModifyName);
						
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
						
						$("#roomDetailModal_roomInfo").html(room.roomInfo.replace(/(?:\r\n|\r|\n)/g, '<br/>'));
						$("#roomDetailModal_checkin").html("체크인 "+room.checkinTime);
						$("#roomDetailModal_checkout").html("체크아웃 "+room.checkoutTime);
						
						$(document).on("click", ".roomDetailModal_roomImg", function(){
							var src = $("#roomDetailModal_roomImg").prop("src");
							$("#roomDetailModal_roomImg").prop("src", $(this).prop("src"));
							$(this).prop("src", src);
						});
					},
					error: (data)=>{
					}
				});
			});
		});
	</script>
	<!-- 룸이미지 모달 끝 -->
</body>
</html>