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
	ul li {
		list-style: none;
		float: left;
		padding: 10px;
	}
	#likeHotelButton {
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
	
/* 	별점 관련 */
	.star-rating {
		color:#e9e9e9;
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


	.mukRound {border-radius: 10px;}
	.mukButton {background: #6BB6EC; color:white; height:40px; border-radius: 10px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	.myHover:hover {cursor: pointer; background-color: rgba(205, 92, 92, 0.1);}
	.mukMutedText {color:#B9B9B9;}
</style>
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body>
	<!-- 모달 시작 -->
	<div id="mukModal" class="modal fade modal-sm" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered text-center">
			<div class="modal-content">
				<div class="modal-body">
					<p class="modalContent mt-3 mb-3"></p>
					<button type="button" class="mukButton mb-3" style="width:80%" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$.viewModal = function(text) {
			$(".modalContent").text(text);
			$("#mukModal").modal('show');
		};
	</script>
	<!-- 모달 끝 -->
	
	
	
	
	<!-- 예약 전송용 form 시작 -->
	<form action="writeReservation.ho" method="post">
		<input type="hidden" name="roomId">
		<input type="hidden" name="checkinDate">
		<input type="hidden" name="checkoutDate">
	</form>
	<!-- 예약 전송용 form 끝 -->
	
	<div class="container mt-5 mb-5" style="min-width:540px">
		<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-2 justify-content-start">
		
			<div class="col col-lg-auto pt-5">
				<img class="mukRound" style="width:500px; height:300px; background-color:#F9F9F9;">
			</div>
			<div class="col-lg-auto pt-5">
				<h1 class="fw-bold">${hotel.hotelName }
					<i id="likeHotelButton" class="fa-solid fa-bookmark"
						<c:if test="${empty loginUser }">style="color:#E9E9E9"</c:if>
						<c:if test="${!empty loginUser && isLikeHotel==0 }">style="color:#E9E9E9"</c:if>
						<c:if test="${!empty loginUser && isLikeHotel==1 }">style="color:#6BB6EC"</c:if>
					>
					</i>
				</h1>
				<span class="mukMutedText">${hotel.star }성급</span>
				<div class="mt-1 mb-1">${hotel.hotelIntro }</div>
				<table class="mt-3 mb-3">
					<tr>
						<td>
							<i class="fa-solid fa-phone"></i>
						</td>
						<td>
							${hotel.hotelPhone }
						</td>
					</tr>
					<tr>
						<td class="align-top">
							<i class="fa-solid fa-location-dot"></i>
						</td>
						<td>
							${hotel.hotelAddress }
						</td>
					</tr>
				</table>
				<h4 class="fw-bold"><i class="fa-solid fa-star" style="color:#FFD600"></i> 4.5</h4>
			</div>
		</div>

		
		<div class="row row-cols-4 justify-content-start text-center mt-5 mb-5" style="border-bottom:1px solid #e9e9e9">
			<div class="col col-auto p-2 mukMutedText" id="roomListButton" scope="col" style="border-bottom:3px solid #6BB6EC; color:#6BB6EC; font-weight:bold; cursor:pointer">
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
		<div id="roomList" class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-2">
			<div class="col col-lg-3">
				<div class="mb-3 form-floating">
					<input type="text" class="form-control" id="daterangepicker" name="daterangepicker">
					<label for="daterangepicker">1박 2일</label>
				</div>
				<div class="mb-3 form-floating">
					<select class="form-select" name="accept">
						<option selected>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
					<label for="accept">인원</label>
				</div>
			</div>
			<div class="col col-lg-9">
				<c:forEach items="${ roomArray }" var="r">
					<div class="col">
						<table class="table table-borderless">
							<tr>
								<td style="width:300px" rowspan="3">
									<img class="hotelImg mukRound" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMTlfMTYy%2FMDAxNjY2MTc4MTIyNzky.aXnPx9QwmchutQ7kHiWYYxGSZbZ9LRetTeUPgIaTJbkg.YEphq3iONv1O2z9kjPZo-tl_gUzLazQljGyLSvpxExAg.JPEG.abcd5z%2FIMG_2083.jpg&type=sc960_832" width="300px" height="200px" style="background: lightgray">
								</td>
								<td colspan="2" class="align-top">
									<input type="hidden" class="roomId" value="${r.roomId }">
									<h4 class="roomName lh-1 fw-bold">${r.roomName }</h4>
									<span>${r.roomIntro }</span><br>
									<span class="checkinTime">${r.checkinTime }</span>~
									<span class="checkoutTime">${r.checkoutTime }</span><br>
									<small class="text-muted">더 많은 정보</small>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="align-middle">
									<h4 class="lh-1 fw-bold" style="margin:0px"><fmt:formatNumber value="${r.roomPrice }" pattern="#,###원"/></h4>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="align-bottom text-end" style="height:40px">
									<button type="button" class="reserveButton mukButton" style="width:100%">예약하기</button>
								</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<!-- 객실 리스트 끝 -->
		
		
		
		<!-- 리뷰 리스트 시작 -->
		<div id="reviewList" style="display:none">
			<div class="text-center pt-5 pb-5" style="border-bottom: 1px solid #e9e9e9">
				<h2 class="fw-bold">최고예요!</h2>
				<div style="display:inline-block">
					<h2 class="fa-solid fa-star" style="color:#FFD600"></h2>
					<h2 class="fa-solid fa-star" style="color:#FFD600"></h2>
					<h2 class="fa-solid fa-star" style="color:#FFD600"></h2>
					<h2 class="fa-solid fa-star" style="color:#FFD600"></h2>
					<h2 class="fa-solid fa-star" style="color:#FFD600"></h2>
				</div>
				<h2 class="fw-bold" style="display:inline-block">4.5</h2>
				<h4 class="pt-3">10개의 리뷰</h4>
			</div>
			
			<div id="reviewListRow" class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-1 pt-5 pb-5">
				<div id="review" class="col mt-3 mb-3" style="border-bottom: 1px solid #e9e9e9; display:none">
					<input type="hidden" name="reviewId">
					<table class="table table-borderless">
						<tr>
							<td rowspan="4" style="width:60px;"><span style="font-size:60px">😀</span></td>
							<td>
								<h5 class="ratingInfo fw-bold">전체적으로 만족스러웠어요.</h5>
								<span class="ratingStar">
								</span>
								<span class="rating">5.0</span>
							</td>
						</tr>
						<tr>
							<td class="mukMutedText">
								<span class="nickName">닉네임</span>
								·
								<span class="roomName">디럭스 트윈 객실</span>
							</td>
						</tr>
						<tr>
							<td class="reviewContent">리뷰 내용</td>
						</tr>
						<tr>
							<td class="createDate mukMutedText">2022.11.13</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<!-- 리뷰 리스트 끝 -->
		
		<!-- 호텔 정보 시작 -->
		<div id="hotelInfo" style="display:none">
			<h4 class="fw-bold pt-5 pb-3">기본 정보</h4>
			${hotel.hotelInfo }
			
			<h4 class="fw-bold pt-5 pb-3">위치</h4>
			<p>${hotel.hotelAddress } <span id="searchMap">길찾기</span></p>
			<div id="map" class="mukRound" style="width:540px;height:300px;"></div>
			
			<h4 class="fw-bold pt-5 pb-3">편의시설 및 서비스</h4>
			<div class="row text-center">
				<div class="col col-auto">
					<h4 <c:if test="${hotel.wifi=='N' }">style="color:#E9E9E9"</c:if>>
						<i class="fa-solid fa-wifi"></i>
					</h4>
					와이파이
				</div>
				<div class="col col-auto">
					<h4 <c:if test="${hotel.park=='N' }">style="color:#E9E9E9"</c:if>>
						<i class="fa-solid fa-square-parking"></i>
					</h4>
					주차
				</div>
				<div class="col col-auto">
					<h4 <c:if test="${hotel.amenity=='N' }">style="color:#E9E9E9"</c:if>>
						<i class="fa-solid fa-gift"></i>
					</h4>
					어메니티
				</div>
				<div class="col col-auto">
					<h4 <c:if test="${hotel.breakfast=='N' }">style="color:#E9E9E9"</c:if>>
						<i class="fa-solid fa-utensils"></i>
					</h4>
					조식
				</div>
				<div class="col col-auto">
					<h4 <c:if test="${hotel.fitness=='N' }">style="color:#E9E9E9"</c:if>>
						<i class="fa-solid fa-dumbbell"></i>
					</h4>
					피트니스
				</div>
				<div class="col col-auto">
					<h4 <c:if test="${hotel.amenity=='N' }">style="color:#E9E9E9"</c:if>>
						<i class="fa-solid fa-water-ladder"></i>
					</h4>
					수영장
				</div>
			</div>
		</div>
		<!-- 호텔 정보 끝 -->
	</div>
	
	
	
	<!-- 리뷰리스트 보기 시작 -->
	<script>
		$.reviewList = function(){
			// 리뷰 불러오기
			var reviewDiv = $("#review").clone();
			console.log(reviewDiv);
			
			$.ajax({
				url: "${contextPath}/reviewList.ho",
				data: {
					hotelId: ${hotel.hotelId}
				},
				success: (data)=>{
					console.log(data);
					for(const i of data) {
						reviewDiv.prop("style").removeProperty("display");
						reviewDiv.find("input[name=reviewId]").val(i.reviewId);
						reviewDiv.find(".nickName").html(i.nickName);
						reviewDiv.find(".roomName").html(i.roomName);
						reviewDiv.find(".reviewContent").html(i.reviewContent);
						reviewDiv.find(".rating").html(i.rating+".0");
						reviewDiv.find(".createDate").html(i.createDate);
						
						var ratingStar="";
						console.log("점수"+i.rating+i.roomName);
						for(var j=1;j<=5;j++) {
							if(j<=i.rating) {
								console.log(j);
								ratingStar = ratingStar+'<i class="fa-solid fa-star" style="color:#FFD600"></i>';
							} else {
								ratingStar = ratingStar+'<i class="fa-solid fa-star" style="color:#e9e9e9"></i>';
							}
						}
						console.log(ratingStar);
						reviewDiv.find(".ratingStar").html(ratingStar);
						
						if(i.rating==5) {
							reviewDiv.find(".ratingInfo").text("여기만한 곳은 어디에도 없을 거예요.");
						} else if(i.rating==4) {
							reviewDiv.find(".ratingInfo").text("여기라면 다음에 또 이용할 거예요.");
						} else if(i.rating==3) {
							reviewDiv.find(".ratingInfo").text("기대 이상이네요.");
						} else if(i.rating==2) {
							reviewDiv.find(".ratingInfo").text("조금만 더 신경 써 주세요.");
						} else {
							reviewDiv.find(".ratingInfo").text("별로예요.");
						}
						
						$("#reviewListRow").append('<div id="review" class="col mt-3 mb-3" style="border-bottom: 1px solid #e9e9e9">'+reviewDiv.html()+'</div>');
					}
				},
				error: (data)=>{
					console.log(data);
				}
			});
		}
		$.reviewList();
	</script>
	<!-- 리뷰리스트 보기 끝 -->
	
	
	
	
	
	<!-- 호텔 찜하기 버튼 시작 -->
	<script>
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
							console.log(data);
						},
						error: (data)=>{
							console.log(data);
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
			} else {
				$.viewModal("로그인 후 이용해주세요.");
			}
		});
	</script>
	<!-- 호텔 찜하기 버튼 끝 -->
	
	
	
	<!-- 예약 버튼 시작 -->
	<script>
		$(".reserveButton").on("click", function(){
			if(${!empty loginUser}) {
				const roomId = $(this).parent().parent().parent().find(".roomId").val();
				const checkinTime = $(this).parent().parent().parent().find(".checkinTime").text();
				const checkoutTime = $(this).parent().parent().parent().find(".checkoutTime").text();
				
				$("input[name=roomId]").val(roomId);
				$("input[name=checkinTime]").val(checkinTime);
				$("input[name=checkoutTime]").val(checkoutTime);
				
				$("form").submit();
			} else {
				$.viewModal("로그인 후 이용해주세요.");
			}
		});
	</script>
	<!-- 예약 버튼 끝 -->
	
	
	
	
	<!-- 작성 가능한 리뷰 시작 -->
	<script>
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
										+"<div class='writableReview'>"+i.roomName + " · " + i.checkinDate + "-" + i.checkoutDate + " 방문"
										+"<input type='hidden' name='reservationId' value='" + i.reservationId + "'>"
										+"</div>");
							}
						} else {
							$("#writableReviewDiv").css("display", "none");
						}
					},
					error: (data)=>{
						console.log(data);
					}
				});
			}
			$(document).on('click', ".writableReview", function() {
				const reservationId = $("input[name=reservationId]").val();
				$.writeReviewModal(reservationId);
			});
		}
	</script>
	<div class="modal fade" id="writableReviewModal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered text-center">
			<div class="modal-content">
				<div class="modal-body mt-3 mb-3">
					<h4 class="fw-bold pb-3" style="color:#6BB6EC">${loginUser.nickName }님의 리뷰를 기다리고 있어요</h4>
					<div id="writableReviewList" class="mukMutedText">
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
							<label for="5-star" class="star pr-4"><h2 class="fa-solid fa-star"></h2></label>
							<input type="radio" id="4-star" value="4" name="starRating" v-model="ratings"/>
							<label for="4-star" class="star"><h2 class="fa-solid fa-star"></h2></label>
							<input type="radio" id="3-star" value="3" name="starRating" v-model="ratings"/>
							<label for="3-star" class="star"><h2 class="fa-solid fa-star"></h2></label>
							<input type="radio" id="2-star" value="2" name="starRating" v-model="ratings"/>
							<label for="2-star" class="star"><h2 class="fa-solid fa-star"></h2></label>
							<input type="radio" id="1-star" value="1" name="starRating" v-model="ratings" />
							<label for="1-star" class="star"><h2 class="fa-solid fa-star"></h2></label>
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
		$.writeReviewModal = function(reservationId) {
			$("#writeReviewModal").modal('show');
			$("#writeReviewModal").find('input[name=reservationId]').val(reservationId);
		};
		var nowRating="별점을 채워주세요.";
		$("label").on("mouseleave", function(){
			$("#ratingInfo").text(nowRating);
		});
		$("label").on("mouseover", function(){
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
			var content = $("textarea[name=reviewContent]").val();
			content = content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			$("textarea[name=reviewContent]").val(content);

			$.ajax({
				url: "${contextPath}/insertReview.ho",
				data: {
					memberId: "${loginUser.id}",
					reservationId: $("input[name=reservationId]").val(),
					rating: $("input[name=rating]").val(),
					reviewContent: $("textarea[name=reviewContent]").val()
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
	<!-- 리뷰 작성 모달 끝 -->
	
	
	
	
	
	
	
	<!-- 지도 시작 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4aaeb935cb2fd15933272e12d906ced0&libraries=services"></script>
	<script>
		$.viewMap = function() {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
	
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			var geocoder = new kakao.maps.services.Geocoder();
			geocoder.addressSearch("${hotel.hotelAddress}", function(result, status) {
			
				if (status === kakao.maps.services.Status.OK) {
					
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					var marker = new kakao.maps.Marker({
					    map: map,
					    position: coords
					});
					
					map.setCenter(coords);
					
					// 길찾기
					const url = "https://map.kakao.com/link/to/${hotel.hotelName},"+result[0].y+","+result[0].x;
					$("#searchMap").on("click", function(){
						window.open(url, "_blank", "width=800, height=400", true);
					});
			    }
			});
		}
 	</script>
 	<!-- 지도 끝 -->


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
		
		const inout = $("#daterangepicker").val().split(" - ");
		$("input[name=checkinDate]").val(inout[0]);
		$("input[name=checkoutDate]").val(inout[1]);
		
		$("#daterangepicker").on("change", function(){
			const inout = $(this).val().split(" - ");
			$("input[name=checkinDate]").val(inout[0]);
			$("input[name=checkoutDate]").val(inout[1]);
			const checkin = new Date(inout[0]);
			const checkout = new Date(inout[1]);
			console.log($("input[name=checkinDate]").val());
			console.log($("input[name=checkoutDate]").val());
			
			var diff = checkout - checkin;
			var currDay = 24 * 60 * 60 * 1000;
			const journey = parseInt(diff/currDay);
			$(this).parent().find("label").text(journey+"박 "+(journey+1)+"일");
		});
	</script>
	<!-- daterangepicker 기본설정, 날짜 기입 끝 -->
	
	
	<!-- 리스트 버튼 시작 -->
	<script>
		$("#roomListButton").on("click", function(){
			$(this).css({"border-bottom":"3px solid #6BB6EC", "color":"#6BB6EC", "font-weight":"bold"});
			$("#reviewListButton").prop("style").removeProperty("border-bottom");
			$("#reviewListButton").prop("style").removeProperty("color");
			$("#reviewListButton").prop("style").removeProperty("font-weight");
			$("#hotelInfoButton").prop("style").removeProperty("border-bottom");
			$("#hotelInfoButton").prop("style").removeProperty("color");
			$("#hotelInfoButton").prop("style").removeProperty("font-weight");
			
			$("#roomList").prop("style").removeProperty("display");
			$("#reviewList").css("display", "none");
			$("#hotelInfo").css("display", "none");
		});
		$("#reviewListButton").on("click", function(){
			$.writableReview();
			$(this).css({"border-bottom":"3px solid #6BB6EC", "color":"#6BB6EC", "font-weight":"bold"});
			$("#roomListButton").prop("style").removeProperty("border-bottom");
			$("#roomListButton").prop("style").removeProperty("color");
			$("#roomListButton").prop("style").removeProperty("font-weight");
			$("#hotelInfoButton").prop("style").removeProperty("border-bottom");
			$("#hotelInfoButton").prop("style").removeProperty("color");
			$("#hotelInfoButton").prop("style").removeProperty("font-weight");
			
			$("#reviewList").prop("style").removeProperty("display");
			$("#roomList").css("display", "none");
			$("#hotelInfo").css("display", "none");
		});
		$("#hotelInfoButton").on("click", function(){
			$(this).css({"border-bottom":"3px solid #6BB6EC", "color":"#6BB6EC", "font-weight":"bold"});
			$("#reviewListButton").prop("style").removeProperty("border-bottom");
			$("#reviewListButton").prop("style").removeProperty("color");
			$("#reviewListButton").prop("style").removeProperty("font-weight");
			$("#roomListButton").prop("style").removeProperty("border-bottom");
			$("#roomListButton").prop("style").removeProperty("color");
			$("#roomListButton").prop("style").removeProperty("font-weight");
			
			$("#hotelInfo").prop("style").removeProperty("display");
			$("#reviewList").css("display", "none");
			$("#roomList").css("display", "none");
			
			$.viewMap();
		});
	</script>
	<!-- 리스트 버튼 끝 -->
	

	
</body>
</html>