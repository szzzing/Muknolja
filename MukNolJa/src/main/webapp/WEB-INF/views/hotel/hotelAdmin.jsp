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
	.mukRound {border-radius: 8px;}
	.mukButton {background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
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
	

	
	<div class="container-sm mt-5 mb-5">
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
							${hotel.hotelPhone }
						</td>
					</tr>
					<tr>
						<td class="align-top">
							<i class="fa-solid fa-location-dot"></i>
							${hotel.hotelAddress }
						</td>
					</tr>
				</table>
				<h4 class="fw-bold">
					<i class="fa-solid fa-star" style="color:#FFD600"></i>
					<span class="avgRating"></span>
				</h4>
			</div>
		</div>
		<a href="${ contextPath }/writeHotel.ho">호텔만들기</a>
		<a href="${ contextPath }/writeRoom.ho">객실만들기</a>
	</div>
		
	
	
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