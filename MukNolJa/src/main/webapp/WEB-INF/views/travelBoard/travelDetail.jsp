<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
  	*{font-family: 'Noto Sans KR', sans-serif;}
	h1{text-align: center; font-weight: 900;}
	h6{text-align: center; font-weight: bold; color: gray;}
	#travelBtn{float: right; margin-top: 70px; margin-bottom: 10px;}
	#travelBtn button{font-size: 20px; color: gray; background: white; border: none; margin-left: 10px;}
	#carouselExampleInterval{height: 600px; margin-bottom: 10px;}
	#carouselExampleInterval img{height: 600px;}
	#detailContent{border-top: 2px solid gray; padding: 10px; margin-bottom: 20px;}
	#travelReply{margin-top: 40px;}
	#button-addon2{background: #6BB6EC; border-color: lightgray; color: white;}
	#button-addon2:hover{background: white; border-color: lightgray; color: #6BB6EC;}
	.travelInfo td{height: 30px;}
	.travelInfo td:nth-child(2){color: gray;}
	.replyProfile img{border-radius: 50%; width: 40px; height: 40px; margin-bottom: 10px; float:left;}
	.replyProfile table{font-size: 12px; vertical-align: middle;}
	.buttons{background: white !important; border: none; font-size: 13px;}
	.buttons:hover{background: white !important; border: none; font-size: 13px; color: black!important; font-weight: 700;}
	#travelReply input[readonly]{background: white;}
	.replyContent{clear:both; margin-left: 33px; margin-top: 15px;}
	.replyContent textarea{resize:none; border: none; border-radius: 10px; padding: 10px; width: 100%; font-size: 15px; outline: none;}
</style>
</head>
<body>

	<jsp:include page="../member/menubar.jsp"/>
	
	<div class="container">
	
		<br><br><br><br><br><br><br>
			<h1>${title}</h1>
			
			<br>
			
			<h6>${addr}</h6>
			
			<div id="travelBtn">
				<button id="print"><span><i class="fa-solid fa-print"></i></span></button>
				<button id="travelCount"><span><i class="fa-solid fa-eye"></i> 30</span></button>
			</div>
			
		<table class="table text-center mt-5 mb-5">
			<tr>
				<td scope="col">
					<h5>사진보기</h5>
				</td>
				<td scope="col">
					<h5>상세정보</h5>
				</td>
				<td scope="col">
					<h5>댓글보기</h5>
				</td>
			</tr>
		</table>
		<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
		  <c:if test="${ tList != null }">
			  <div class="carousel-inner carouselImg">
				    <div class="carousel-item active" data-bs-interval="5000">
				      <img src="${ tList[0] }" class="d-block w-100" alt="...">
				    </div>
			  	<c:forEach items="${ tList }" var="t" begin="1">
			  		<div class="carousel-item" data-bs-interval="4000">
				      <img src="${ t }" class="d-block w-100" alt="...">
				    </div>
			    </c:forEach>
			  </div>
		  </c:if>
		  <c:if test="${ tList == null }">
		  	<div class="carousel-inner carouselImg">
				    <div class="carousel-item active" data-bs-interval="5000">
				      <img src="${ contextPath }/resources/img/basicImage.png" class="d-block w-100" alt="...">
				    </div>
			 </div>
		  </c:if>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
		
		<br><br>
		
		<h4>상세정보</h4>
		
		<div id="detailContent">
			${overview}${ rlist }
		</div>
		
		<div id="map" style="width:100%;height:350px;"></div>
		
		<div class="row" style="margin-top: 30px;">
			<div class="travelInfo col">
				<table>
					<tr>
						<td width="150px;"> 문의 및 안내</td>
						<td>${ infoList[0] }</td>
					</tr>
					<tr>
						<td> 주소</td>
						<td>${ addr }</td>
					</tr>
					<tr>
						<td> 휴일</td>
						<td>${ infoList[3] }</td>
					</tr>
					<tr>
						<td> 유모차대여정보</td>
						<td>${ infoList[5] }</td>
					</tr>
					<tr>
						<td> 애완동물동반</td>
						<td>${ infoList[6] }</td>
					</tr>
					<tr>
						<td> 신용카드가능정보</td>
						<td>${ infoList[7] }</td>
					</tr>
				</table>
			</div>
			<div class="travelInfo col">
				<table>
					<tr>
						<td width="130px;"> 개장일</td>
						<td>${ infoList[1] }</td>
					</tr>
					<tr>
						<td> 이용시간</td>
						<td>${ infoList[4] }</td>
					</tr>
					<tr>
						<td> 주차</td>
						<td>${ infoList[2] }</td>
					</tr>
					<tr>
						<td> 체험안내</td>
						<td>${ infoList[9] }</td>
					</tr>
					<tr>
						<td> 체험가능연령</td>
						<td>${ infoList[8] }</td>
					</tr>
				</table>
			</div>
		</div>
		
		<!-- 댓글입력 -->
		<form method="POST">
		<div id="travelReply">
			<h5 class="mb-3"><i class="fa-solid fa-pen-to-square"></i> 댓글<span>0</span></h5>
			<div class="input-group mb-3">
				<c:if test="${ loginUser == null }">
					<input type="text" class="form-control" placeholder="로그인 후 이용해주세요" aria-label="Recipient's username" aria-describedby="button-addon2" readonly>
				</c:if>
				<c:if test="${ loginUser != null }">
					<input type="text" class="form-control" placeholder="댓글을 입력해주세요" aria-label="Recipient's username" aria-describedby="button-addon2" id="replyContent">
				</c:if>
				<button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="bi bi-send"></i></button>
			</div>
		</div>
		</form>
		
		<c:forEach items="${ rlist }" var="r">
			<div class="reply" style="margin-top: 30px;">
					<div class="replyProfile">
						<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMjVfMTgz%2FMDAxNjY2NzA4NjI5ODgx.xP4DuaOg_fn_wnYQ0icZAdibPZj01TpMH-owvohB7l4g.FkOjV2Nh8vi18cE0h5A-6ItHqqBMPgxW3lRCS_9g028g.JPEG.ymtlfet%2FIMG_6191.JPG&type=sc960_832">
						<table style="float:left; margin-left: 10px;">
							<tr>
								<td>${ r.nickName }</td>
							</tr>
							<tr>
								<td style="color: gray;">${ r.replyModifyDate }</td>
							</tr>
						</table>
						<c:if test="${ r.replyWriter == loginUser.id }">
							<div style="float:right;">
								<button class="buttons">수정</button>
								<button class="buttons">삭제</button>
							</div>
						</c:if>
						<c:if test="${ r.replyWriter != loginUser.id }">
							<div style="float:right; display:none;">
								<button class="buttons">수정</button>
								<button class="buttons">삭제</button>
							</div>
						</c:if>
					</div>
					<div class="replyContent">
						<textarea readonly>${ r.replyContent }</textarea>
					</div>
					<hr style="margin-top: 10px; border-color: gray;">
			</div>
		</c:forEach>
		
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		
		
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca321a5811ec7bd78b88fbdc6d97e558"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${mapy}, ${mapx}), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${mapy}, ${mapx}); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    
	</script>
	
	<script>
		$('#print').click(function(){
			window.print();
		});
		
		console.log($('.reply').clone());
		document.getElementById('button-addon2').addEventListener('click', function(){
			$.ajax({
				url: '${contextPath}/insertReply.pa',
				data: {replyContent:document.getElementById('replyContent').value,
					   refBoardId:${contentId}, replyWriter:"${loginUser.id}"},
				success: (data) =>{
					console.log(data);
// 					<div style="margin-top: 30px;">
// 					<div class="replyProfile">
// 						<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMjVfMTgz%2FMDAxNjY2NzA4NjI5ODgx.xP4DuaOg_fn_wnYQ0icZAdibPZj01TpMH-owvohB7l4g.FkOjV2Nh8vi18cE0h5A-6ItHqqBMPgxW3lRCS_9g028g.JPEG.ymtlfet%2FIMG_6191.JPG&type=sc960_832">
// 						<table style="float:left; margin-left: 10px;">
// 							<tr>
// 								<td>${ r.nickName }</td>
// 							</tr>
// 							<tr>
// 								<td style="color: gray;">${ r.replyModifyDate }</td>
// 							</tr>
// 						</table>
// 						<c:if test="${ r.replyWriter == loginUser.id }">
// 						<div style="float:right;">
// 							<button class="buttons">수정</button>
// 							<button class="buttons">삭제</button>
// 						</div>
// 						</c:if>
// 						<c:if test="${ r.replyWriter != loginUser.id }">
// 						<div style="float:right; display:none;">
// 							<button class="buttons">수정</button>
// 							<button class="buttons">삭제</button>
// 						</div>
// 						</c:if>
// 					</div>
// 					<div style="clear:both; margin-left: 33px; margin-top: 15px;">
// 						<textarea style="resize:none; border: none; border-radius: 10px; padding: 10px; width: 100%; font-size: 15px; outline: none;" readonly>${ r.replyContent }</textarea>
// 					</div>
// 					<hr style="margin-top: 10px; border-color: gray;">
// 			</div>
				},
				error: (data) =>{
					console.log(data);
				}
			});
		});
		
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>