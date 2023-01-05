<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹놀자-${ title }</title>
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
	#travelReply{margin-top: 100px;}
	#button-addon2{background: #6BB6EC; border-color: lightgray; color: white;}
	#button-addon2:hover{background: white; border-color: lightgray; color: #6BB6EC;}
	.travelInfo td{height: 30px;}
	.travelInfo td:nth-child(2){color: gray;}
	.replyProfile img{border-radius: 50%; width: 40px; height: 40px; margin-bottom: 10px; float:left;}
	.replyProfile table{font-size: 12px; vertical-align: middle;}
	.buttons{background: white !important; border: none; font-size: 13px; opacity: 0.7;}
	.buttons:hover{background: white !important; border: none; font-size: 13px; color: tomato!important; font-weight: 700;}
	.reportButton{font-size: 15px; border: none; background: white;}
	#travelReply input[readonly]{background: white;}
	.replyContent{clear:both; margin-left: 33px; margin-top: 15px;}
	.replyContent textarea{resize:none; border: none; border-radius: 10px; padding: 10px; width: 100%; font-size: 15px; outline: none;}
	.mukButton {transition: all 0.3s; background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
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
			${overview}
		</div>
		${infoList }
		<div id="map" style="width:100%;height:350px;"></div>
		
		<div class="row" style="margin-top: 30px;">
			<div class="travelInfo col">
				<table>
					<tr>
						<td  width="150px;"> 행사장소</td>
						<td>${ infoList[5] }</td>
					</tr>
					<tr>
						<td> 주소</td>
						<td>${ addr }</td>
					</tr>
					<tr>
						<td> 행사장위치안내</td>
						<td>${ infoList[7] }</td>
					</tr>
					<tr>
						<td> 관람가능연령</td>
						<td>${ infoList[0] }</td>
					</tr>
					<tr>
						<td> 공연시간</td>
						<td>${ infoList[8] }</td>
					</tr>
					<tr>
						<td> 행사프로그램</td>
						<td>${ infoList[9] }</td>
					</tr>
					<tr>
						<td> 주최자정보</td>
						<td>${ infoList[11] }</td>
					</tr>
					<tr>
						<td> 주최자연락처</td>
						<td>${ infoList[12] }</td>
					</tr>
					<tr>
						<td> 이용요금</td>
						<td>${ infoList[15] }</td>
					</tr>
				</table>
			</div>
			<div class="travelInfo col">
				<table>
					<tr>
						<td width="150px;"> 행사시작일</td>
						<td>${ infoList[6] }</td>
					</tr>
					<tr>
						<td> 행사종료일</td>
						<td>${ infoList[3] }</td>
					</tr>
					<tr>
						<td> 할인정보</td>
						<td>${ infoList[2] }</td>
					</tr>
					<tr>
						<td> 예매처</td>
						<td>${ infoList[1] }</td>
					</tr>
					<tr>
						<td> 행사홈페이지</td>
						<td>${ infoList[4] }</td>
					</tr>
					<tr>
						<td> 관람소요시간</td>
						<td>${ infoList[10] }</td>
					</tr>
					<tr>
						<td> 주관사정보</td>
						<td>${ infoList[13] }</td>
					</tr>
					<tr>
						<td> 주관사연락처</td>
						<td>${ infoList[14] }</td>
					</tr>
				</table>
			</div>
		</div>
		
		<!-- 이미 신고 -->
		<div class="modal fade" id="alreadyReReport" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-body" style="border: none!important; margin-top: 30px; text-align: center; font-size: 20px;">
		        이미 신고한 댓글입니다.
		      </div>
		      <div class="modal-footer" style="border: none!important; margin: auto;">
		        <button type="button" class="buttons" data-bs-dismiss="modal" style="font-size: 14px; margin-bottom: 30px;">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 진짜 신고 -->
		<div class="modal fade" id="realReportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-body" style="border: none!important; margin-top: 10px; margin-left: 10px; margin-right: 10px; text-align: center; font-size: 20px;">
		      	<h4>신고 내용 작성</h4>
		        <input type="text" class="form-control" id="reportTitle" style="margin-bottom:20px; margin-top: 20px;" placeholder="제목">
		        <textarea class="form-control" id="reportContent" style="resize: none; height: 200px;" placeholder="내용"></textarea>
		        <input type="hidden" id="refReply">
		      </div>
		      <div class="modal-footer" style="border: none!important; margin: auto;">
		        <button type="button" class="mukButton" style="font-size: 14px; margin-bottom: 20px;" id="realReport">보내기</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 신고 완료 -->
		<div class="modal fade" id="endReport" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-body" style="border: none!important; margin-top: 30px; text-align: center; font-size: 20px;">
		        신고 접수가 완료되었습니다.
		      </div>
		      <div class="modal-footer" style="border: none!important; margin: auto;">
		        <button type="button" class="buttons" data-bs-dismiss="modal" style="font-size: 14px; margin-bottom: 30px;">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
			
		<!-- 댓글입력 -->
		<form method="POST" id="replyForm">
			<input type="hidden" name="contentId" value="${ contentId }">
			<div id="travelReply">
				<h5 class="mb-3"><i class="fa-solid fa-pen-to-square"></i> 댓글<span id="replyCount">&nbsp;${ replyCount }</span></h5>
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
			
			<!-- 댓글 내용 -->
			<div id="reply" style="margin-top: 30px;">
			<c:forEach items="${ rlist }" var="r">
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
								<button class="buttons deleteReply"><i class="fa-solid fa-trash-can"></i></button>
								<input type="hidden" value="${ r.replyId }" name="replyId">
							</div>
						</c:if>
						<c:if test="${ r.replyWriter != loginUser.id }">
							<div style="float:right;">
								<button class="buttons reportReply" type="button">신고</button>
								<input type="hidden" value="${ r.replyId }" name="replyId">
							</div>
						</c:if>
					</div>
					<div class="replyContent">
						<textarea readonly>${ r.replyContent }</textarea>
					</div>
					<hr style="margin-top: 10px; border-color: gray;">
			</c:forEach>
			
			<input type="hidden" name="realDeleteRepId">
			</div>
		</form>
		
		<br><br><br><br><br><br><br><br><br>
		
		
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
		
		document.getElementById('button-addon2').addEventListener('click', function(){
			$.ajax({
				url: '${contextPath}/insertReply.tr',
				data: {replyContent:document.getElementById('replyContent').value,
					   refBoardId:${contentId}, replyWriter:"${loginUser.id}"},
				success: (data) =>{
					console.log(data);
					
					document.getElementById('reply').innerHTML = '';
					
					for(const r of data){
						var profileImg = '<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMjVfMTgz%2FMDAxNjY2NzA4NjI5ODgx.xP4DuaOg_fn_wnYQ0icZAdibPZj01TpMH-owvohB7l4g.FkOjV2Nh8vi18cE0h5A-6ItHqqBMPgxW3lRCS_9g028g.JPEG.ymtlfet%2FIMG_6191.JPG&type=sc960_832">';
						var profileInfo = '<table style="float:left; margin-left: 10px;"><tr><td>' + r.nickName + '</td></tr><tr><td style="color: gray;">' + r.replyModifyDate + '</td></tr></table>';
						var deleteR = '<div style="float:right;"><button class="buttons deleteReply" type="button"><i class="fa-solid fa-trash-can"></i></button><input type="hidden" value="' + r.replyId + '" name="replyId"></div>';
						var reportR = '<div style="float:right;"><button class="buttons reportReply" type="button">신고</button><input type="hidden" value="${ r.replyId }" name="replyId"></div>';
						var replyContent = '<div class="replyContent"><textarea readonly>' + r.replyContent +'</textarea></div>';
						var hr = '<hr style="margin-top: 10px; border-color: gray;">';
						var realDeleteRepId = '<input type="hidden" name="realDeleteRepId">';
						var replyProfile = '';
						if(r.replyWriter == '${loginUser.id}'){
							replyProfile = '<div class="replyProfile">' + profileImg + profileInfo + deleteR + '</div>';
						}else{
							replyProfile = '<div class="replyProfile">' + profileImg + profileInfo + reportR + '</div>';
						}
						document.getElementById('reply').innerHTML += (replyProfile + replyContent + hr) + realDeleteRepId;
					}
					
					document.getElementById('replyContent').value = '';
					document.getElementById('replyCount').innerText = Number(document.getElementById('replyCount').innerText) + 1;
				},
				error: (data) =>{
					console.log(data);
				}
			});
		});
		
		const form = document.getElementById('replyForm');
		
		$(document).on('click', '.deleteReply', function(){
			console.log($(this));
			const ReplyId = $(this).parent().find('input').val();
			console.log(ReplyId);
			$('input[name=realDeleteRepId]').val(ReplyId);
			form.action = '${contextPath}/deleteReply.tr';
			form.submit();
		});
		
		<!-- 댓글신고 모달 -->
		$(document).on('click', '.reportReply', function(){
			if('${loginUser.id}' == ''){
				$(this).attr('disabled', true);
				alert('로그인 후 신고해주세요.');
				location.href='${contextPath}/loginView.me';
			}
			
			$('#reportTitle').val("");
			$('#reportContent').val("");
			
			console.log($(this).parent().find('input').val());
			$.ajax({
				url: '${contextPath}/checkReport.pa',
				data: {memberId: '${loginUser.id}', targetId:$(this).parent().find('input').val(), reportClassification: 'R'},
				success: (data) =>{
					console.log(data);
					if(data == 0){
						$('#refReply').val($(this).parent().find('input').val());
						$('#realReportModal').modal('show');
					}else if(data == 1){
						$('#alreadyReReport').modal('show');
					}
				},
				error: (data) =>{
					console.log(data);
				}
			});
		});
		
		
		<!-- 진짜 신고 -->
		$(document).on('click', '#realReport', function(){
			$.ajax({
				url: '${contextPath}/insertReport.pa',
				data: {memberId: '${loginUser.id}', targetId:$(this).parent().parent().find('#refReply').val(), reportClassification: 'R',
					   reportContent:$('#reportContent').val(), reportTitle:$('#reportTitle').val()},
				success: (data) =>{
					console.log("성공");
					console.log(data);
					if(data == 1){
						$('#realReportModal').modal('hide');
						$('#endReport').modal('show');
					}
				},
				error: (data) =>{
					console.log("실패");
					console.log(data);
				}
			});
		});
		
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>