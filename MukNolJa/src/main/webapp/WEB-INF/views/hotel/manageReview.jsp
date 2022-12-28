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
	.form-control {border:1px solid #e9e9e9 !important; border-radius:20px !important}
	.form-select {border:1px solid #e9e9e9 !important; border-radius:20px !important}
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
	
	.modifyReplyButton {transition: all 0.3s; color:#6bb6ec;}
	.modifyReplyButton:hover {transition: all 0.3s; opacity:0.8;}
	.insertReplyButton {transition: all 0.3s; color:#6bb6ec;}
	.insertReplyButton:hover {transition: all 0.3s; opacity:0.8;}
	
	.replyTable tr td {padding:0px;}
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
			
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 mb-5">
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-4 pb-3 mb-5" style="border-bottom:1px solid #e9e9e9">
					<h1 class="h2 fw-bold">리뷰 관리</h1>
				</div>
				
				<div class="reviewList">
					<div id="category">
						<select class="form-select" name="searchByRoom" style="width:300px; display:inline-block;">
							<option selected value="0">전체 객실</option>
							<c:forEach items="${roomList }" var="r">
								<option value="${r.roomId }">${r.roomName }</option>
							</c:forEach>
						</select>
						<select class="form-select" name="orderBy" style="width:100px; display:inline-block; float:right;">
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
									<td class="text-center" rowspan="5" style="width:60px;">
										<div class="ratingEmoji" style="font-size:60px"></div>
										<div class="hasReply mt-2" style="background:#6BB6EC; border-radius:10px; color:white; padding:2px 4px;">답변완료</div>
									</td>
									<td colspan="2">
										<h5 class="fw-bold">
											[<span class="reservationId"></span>번 예약]
											<span class="roomName"></span>
										</h5>
										<span class="ratingStar"></span>
										<span class="rating"></span>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="mukSubText">
										<span class="nickName fw-bold"></span>
										·
										<span class="checkinDate"></span>
										~
										<span class="checkoutDate"></span> 숙박
									</td>
								</tr>
								<tr>
									<td colspan="2" class="reviewContent"></td>
								</tr>
								<tr>
									<td class="mukMutedText"><span class="createDate"></span></td>
									<td class="text-end mukMutedText">
										<h4 class="writeReplyButton bi bi-chevron-down" style="display:inline-block; margin-bottom:0px; cursor:pointer;"></h4>
									</td>
								</tr>
								<tr>
									<td class="align-middle textarea pt-3 pb-3" colspan="2" style="display:none">
										<div class="p-4" style="background:#fafafa; border-radius:20px;">
											<table class="replyTable table table-borderless" style="margin-bottom:0px; padding:0;">
												<tr class="align-middle">
													<td style="width:30px; padding-bottom:10px"><img id="hotelImg" class="img-fluid" style="width:24px; height:24px; border-radius:50%;" src="${contextPath }/resources/uploadFiles/${hotelImgList[0].fileModifyName}"></td>
													<td colspan="2" style="padding-bottom:10px"><h5 class="fw-bold" style="margin:0px; padding-top:3px; display:inline-block;">${hotel.hotelName }</h5></td>
												</tr>
												<tr class="writeReplyTr align-bottom" style="display:none;">
													<td colspan="2"><textarea style="background:none; padding:0; border:0px !important; width:100%; height:48px; resize:none" required></textarea></td>
													<td style="width:30px;"><div class="insertReplyButton fa-solid fa-message" style="color:#6bb6ec; float:right; cursor:pointer;"></div></td>
												</tr>
												<tr class="viewReplyTr" colspan="2" style="display:none;">
													<td colspan="2" class="businessReply"></td>
													<td class="align-bottom" style="width:30px;"><small class="modifyReplyButton" style="color:#6bb6ec; float:right; cursor:pointer;">수정</small></td>
												</tr>
											</table>
										</div>
									</td>
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
						$("#reviewList").html("");
						
						const reviewDiv2 = reviewDiv.clone();
						const reviewList = data.reviewList;
						for(const r of reviewList) {
							reviewDiv2.find("input[name=reviewId]").val(r.reviewId);
							reviewDiv2.find(".nickName").html(r.nickName);
							reviewDiv2.find(".roomName").html(r.roomName);
							reviewDiv2.find(".reservationId").html(r.reservationId);
							reviewDiv2.find(".reviewContent").html(r.reviewContent.replace(/(?:\r\n|\r|\n)/g, '<br/>'));
							reviewDiv2.find(".rating").html(r.rating.toFixed(1));
							reviewDiv2.find(".createDate").html(r.createDate);
							reviewDiv2.find(".checkinDate").html(r.createDate);
							reviewDiv2.find(".checkoutDate").html(r.createDate);
							if(r.businessReply!=null) {
								reviewDiv2.find("textarea").val(r.businessReply);
								reviewDiv2.find(".businessReply").html(r.businessReply.replace(/(?:\r\n|\r|\n)/g, '<br/>'));
								reviewDiv2.find(".writeReplyTr").css("display", "none");
								reviewDiv2.find(".viewReplyTr").prop("style").removeProperty("display");
								reviewDiv2.find(".hasReply").prop("style").removeProperty("display");
							} else {
								reviewDiv2.find("textarea").val("");
								reviewDiv2.find(".writeReplyTr").prop("style").removeProperty("display");
								reviewDiv2.find(".viewReplyTr").css("display", "none");
								reviewDiv2.find(".hasReply").css("display", "none");
							}
							
							ratingStar="";
							for(var j=1;j<=5;j++) {
								if(j<=r.rating) {
									ratingStar = ratingStar+'<i class="fa-solid fa-star" style="color:#FFD600"></i>';
								} else {
									ratingStar = ratingStar+'<i class="fa-solid fa-star" style="color:#e9e9e9"></i>';
								}
							}
							reviewDiv2.find(".ratingStar").html(ratingStar);
							
							if(r.rating==5) {
								reviewDiv2.find(".ratingEmoji").text("😍");
							} else if(r.rating==4) {
								reviewDiv2.find(".ratingEmoji").text("😀");
							} else if(r.rating==3) {
								reviewDiv2.find(".ratingEmoji").text("🙂");
							} else if(r.rating==2) {
								reviewDiv2.find(".ratingEmoji").text("😐");
							} else {
								reviewDiv2.find(".ratingEmoji").text("🙁");
							}
							
							$("#reviewList").append(reviewDiv2.clone());
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
	
	<!-- 댓글 작성 버튼 -->
	<script>
		$(document).on("click", ".writeReplyButton", function(){
			const table = $(this).parents("table");
			if(table.find(".textarea").css("display")=="none") {
				table.find(".textarea").prop("style").removeProperty("display");
				$(this).addClass("bi-chevron-up");
				$(this).removeClass("bi-chevron-down");
			} else {
				table.find(".textarea").css("display", "none");
				$(this).addClass("bi-chevron-down");
				$(this).removeClass("bi-chevron-up");
			}
		});
		
		$(document).on("click", ".modifyReplyButton", function(){
			$(this).closest("table").find(".viewReplyTr").css("display","none");
			$(this).closest("table").find(".writeReplyTr").prop("style").removeProperty("display");
		});
		
		$(document).on("click", ".insertReplyButton", function(){
			if($(this).closest(".review").find("textarea").val().trim()!="") {
				$.ajax({
					url: "${contextPath}/insertReply.ho",
					data: {
						reviewId: $(this).closest(".review").find("input[name=reviewId]").val(),
						businessReply: $(this).closest("tr").find("textarea").val()
					},
					success: (data)=>{
						console.log(data);
						$(this).closest("table").find(".businessReply").html($(this).closest("tr").find("textarea").val().replace(/(?:\r\n|\r|\n)/g, '<br/>'));
						$(this).closest("table").find(".writeReplyTr").css("display", "none");
						$(this).closest("table").find(".viewReplyTr").prop("style").removeProperty("display");
					},
					error: (data)=>{
						console.log(data);
					}
				});
			} else {
				alert("내용을 입력해주세요.");
			}
		});
	</script>
	<!-- 댓글 작성 버튼 -->
</body>
</html>