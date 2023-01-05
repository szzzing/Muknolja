<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹놀자 - 여행친구찾기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
  	*{font-family: 'Noto Sans KR', sans-serif;}
	.list-group li{width: 100px; height: 70px; text-align: center; padding: 20px;}
	#list1{margin-top:50px; margin-bottom: 50px;}
	h1{text-align: center; font-weight: 900;}
	.page-link{color:#3C988D;}
	#input{height: 78%;}
	.page-link:focus, .page-link:hover {color: #fff; background-color: #3C988D;}
	.mukButton {transition: all 0.3s; background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	ol.numbered {
	  list-style: none;
	  border-left: 3px solid RGB(107, 182, 236,0.7);
	  counter-reset: numbered-list;
	  margin-left: 10px;
	  position: relative;
	}
	ol.numbered li {
	  font-size: 16px;
	  line-height: 1.2;
	  margin-bottom: 30px;
	  padding-left: 10px;
	}
	ol.numbered li:last-child {
	  border-left: 3px solid white;
	  margin-left: -3px;
	}
	ol.numbered li:before {
	  background-color: #6BB6EC;
	 
	  border-radius: 50%;
	  color: white;
	  content: counter(numbered-list, decimal);
	  counter-increment: numbered-list;
	  display: block;
	  font-weight: bold;
	  width: 30px;
	  height: 30px;
	  margin-top: -0.4em;
	  line-height: 30px;
	  position: absolute;
	  left: -17px;
	  text-align: center;
	  padding-top:-10px;
	  
	}
 	.card img{height: 250px;}
	.card{margin-bottom: 30px; cursor: pointer;}
	.card td{width: 95px; font-size: 14px; color: gray; margin-right: auto;}
	#button-addon2{background: #6BB6EC; border-color: lightgray; color: white;}
	#button-addon2:hover{background: white; border-color: lightgray; color: #6BB6EC;}
	.pagination a{color: #6BB6EC;}
	.pagination a:hover{background: #6BB6EC; color: white;}
	#carouselExampleInterval{height: 350px; margin-top: 80px;}
	#carouselExampleInterval img{height:350px;}
	.compDate label{color: #6BB6EC; font-size: 13px;}
	#gender label{color: #6BB6EC; font-size: 13px;}
	#location label{color: #6BB6EC; font-size: 13px;}
	.participate{color: tomato;}
</style>
</head>
<body style="background-color:white;">
	
	
	<jsp:include page="../member/menubar.jsp"/>
	
	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="10000">
				<img src="resources/img/adadad.png" class="d-block w-100 adimg" alt="...">
			</div>
			<div class="carousel-item" data-bs-interval="2000">
				<img src="resources/img/adadad.png" class="d-block w-100 adimg" alt="...">
			</div>
			<div class="carousel-item">
				<img src="resources/img/adadad.png" class="d-block w-100 adimg" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	
	<div class="container">
		<input type="hidden" name="partyStartDate" id="partyStartDate">
		<input type="hidden" name="partyEndDate" id="partyEndDate">
		<br>
		<h1 class="fw-bold" style="color: #6BB6EC; font-size: 55px; margin-bottom: 50px; margin-top: 20px;">여행친구찾기</h1>
		
		<!-- 글쓰기버튼 -->
			<c:if test="${ loginUser == null }">
				<button type="button" class="writeButton mukButton" style="width: 150px; display: none;" id="writeButton">글쓰기</button>
			</c:if>
			<c:if test="${ loginUser != null }">
				<div  style="float: right; margin-bottom: 30px;">
					<button type="button" class="writeButton mukButton" style="width: 150px;" id="writeButton">글쓰기</button>
				</div>
			</c:if>
		
		<!-- 검색하기 -->
			<div class="row" style="clear: both;">
			<div class="col">
				<div id="location" class="form-floating">
					<select id="selectLocation"class="form-select searchCondition" aria-label="Default select example" name="partyArea">
						<option selected value="전체">전체</option>
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="대전">대전</option>
						<option value="대구">대구</option>
						<option value="광주">광주</option>
						<option value="부산">부산</option>
						<option value="울산">울산</option>
						<option value="세종">세종</option>
						<option value="경기">경기</option>
						<option value="강원">강원</option>
						<option value="충북">충북</option>
						<option value="충남">충남</option>
						<option value="경북">경북</option>
						<option value="경남">경남</option>
						<option value="전북">전북</option>
						<option value="전남">전남</option>
						<option value="제주">제주</option>
					</select>
					<label for="floatingSelect">지역</label>
				</div>
			</div>
			
			<div class="col">
				<div class="compDate form-floating mb-3">
					<input type="text" class="travelDate form-control searchCondition" id="daterangepicker" name="daterangepicker">
					<label for="floatingInput">날짜선택</label>
				</div>
			</div>
			
			<div class="col">
				<div id="gender" class="form-floating">
				  <select class="gender form-select searchCondition" id="partyGender" aria-label="Floating label select example" name="partyGender">
				    <option selected disabled>성별</option>
				    <option value="여자만">여자만</option>
				    <option value="남자만">남자만</option>
				    <option value="무관">무관</option>
				  </select>
				  <label for="floatingSelect">성별</label>
				</div>
			</div>
			
			<div class="col">
				<div class="input-group" id="input">
					<input type="text" class="searchInput1 form-control searchCondition" placeholder="검색하기" aria-label="Recipient's username" aria-describedby="button-addon2" name="searchValue">
					<button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="fa-solid fa-magnifying-glass"></i></button>
				</div>
			</div>
			</div>
			
		<!-- list카드 -->
			<div class="row row-cols-1 row-cols-sm-2 row-cols-lg-4 justify-content-start" style="margin-top: 20px;">
				<c:forEach items="${ pList }" var="p">
					<div class="partyCard col" style="margin-bottom: 30px;">
						<div class="card card-cover h-100 overflow-hidden\">
						  <img src="${ contextPath }/resources/uploadFiles/${p.thumbnail}" class="card-img-top">
						  <div class="card-body">
						  	<h5 style="margin-bottom: 20px;white-space:nomal;line-height:1.2;height:2.5em;overflow:hidden">${ p.partyTitle }</h5>
						  	  <c:set var="courseList" value="${fn:split(p.partyCourse,'/')}" />
						  	  <div>
								  <ol class="numbered">
									  <c:forEach items="${ courseList }" var="course" end="3">
									  	<li style="white-space:no-wrap;height:1.2em;overflow:hidden;">${ course }</li>
									  </c:forEach>
								  </ol>
							  </div>
							 <table class="mb-auto">
							 	<tr>
							 		<td><i class="fa-solid fa-location-dot"></i> ${ p.partyArea }</td>
							 		<c:if test="${ p.nowParticipate != p.maxParticipate }">
							 			<td><i class="fa-solid fa-users"></i> <span>${ p.nowParticipate }/${ p.maxParticipate }</span></td>
							 		</c:if>
							 		<c:if test="${ p.nowParticipate == p.maxParticipate }">
							 			<td width="100px;"><i class="fa-solid fa-users participate"></i> <span class="participate">마감</span></td>
							 		</c:if>
							 		<td><i class="fa-solid fa-heart"></i> ${ p.partyGender }</td>
							 		<td><i class="fa-regular fa-comment-dots"></i> ${ p.replyCount }개</td>
							 	</tr>
							 </table>
							 <input type="hidden" value="${ p.partyId }" class="partyId">
							 <input type="hidden" value="${ p.nickName }" class="nickName">
						  </div>
						</div>
					</div>
				</c:forEach>
			</div>
			
		<!-- 페이징 -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination d-flex justify-content-center">
			    <li class="page-item">
			    	<c:url var="goBack" value="${ loc }">
			    		<c:param name="page" value="${ pi.currentPage-1 }"/>
			    	</c:url>
			      	<a class="page-link" href="${ goBack }" aria-label="Previous">
			        	<span aria-hidden="true"><i class="fa-solid fa-angle-left"></i></span>
			      	</a>
			    </li>
			    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			    	<c:url var="goNum" value="${ loc }">
			    		<c:param name="page" value="${ p }"/>
			    	</c:url>
				    <li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
			    </c:forEach>
			    <li class="page-item">
			    	<c:url var="goNext" value="${ loc }">
			    		<c:param name="page" value="${ pi.currentPage+1 }"/>
			    	</c:url>
				    <a class="page-link" href="${ goNext }" aria-label="Next">
				    	<span aria-hidden="true"><i class="fa-solid fa-angle-right"></i></span>
				    </a>
			    </li>
			  </ul>
			</nav>
		
		</div>
		
		<jsp:include page="../common/footer.jsp"/>
		<script>
			<!-- 동행 상세보기 -->
			const partyCards = document.getElementsByClassName('card');
			for(const partyCard of partyCards){
				partyCard.addEventListener('click', function(){
				var partyId = partyCard.querySelectorAll('input')[0].value;
				var nickName = partyCard.querySelectorAll('input')[1].value;
					location.href = '${contextPath}/selectParty.pa?pId=' + partyId + '&writer=' + nickName;
				});
			}
			
			<!-- 동행 글 쓰기 -->
			const writeButton = document.getElementById('writeButton');
			writeButton.addEventListener('click', function(){
				location.href = '${contextPath}/partyWrite.pa';
			});
			
			window.onload = () => {
				$.ajax({
		    		url: 'selectAd.me',
		    		data: {type:'P'},
		    		success: (data) => {
		    			const adimgs = document.getElementsByClassName('adimg');

		    			for(const i in data){
		    				adimgs[i].src = 'resources/uploadFiles/' + data[i];
		    			}
		    		}
		    	});
				
				var page = 1;
				var maxPage = 1;
				
				$('.searchCondition').on('change keyup', function(){
					var partyArea = $('#selectLocation').val();
					var partyDate = $('#daterangepicker').val();
					var partyGender = $('#partyGender').val();
					var searchValue = $('#input').find('input').val();
					var partyStartDate = partyDate.split(" ~ ")[0] + "";
					var partyEndDate = partyDate.split(" ~ ")[1] + "";
					console.log(partyStartDate);
					console.log(partyEndDate);
					$.ajax({
						url: '${contextPath}/searchParty.pa',
						data: {page: page, searchValue: searchValue, partyArea: partyArea,
							   partyGender: partyGender, partyStartDate: partyStartDate, partyEndDate: partyEndDate},
						success: (data) =>{
							console.log("성공");
							console.log(data);
							for(const search of data.searchList){
								console.log(search);
							}
						},
						error: (data) =>{
							console.log("실패");
							console.log(data);
						}
					});
				});
				
			}

		</script>
		<script>
			<!-- datepicker -->
			$(function(){
				$('#daterangepicker').daterangepicker();
				$("#daterangepicker").daterangepicker({
				    locale: {
				    "separator": " ~ ",                     // 시작일시와 종료일시 구분자
				    "format": 'YYYY-MM-DD',     // 일시 노출 포맷
				    "applyLabel": "확인",                    // 확인 버튼 텍스트
				    "cancelLabel": "취소",                   // 취소 버튼 텍스트
				    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
				    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
				    },
// 				    minDate: new Date(),
				    autoApply: true,                         // 확인/취소 버튼 사용여부
				});
				
			});
		</script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
</body>
</html>