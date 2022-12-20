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
	.myHover:hover {cursor: pointer; background-color: rgba(205, 92, 92, 0.1);}
	.mukMutedText {color:#B9B9B9;}
	
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
</style>
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
	
	<div class="container-sm mt-5 mb-5" style="padding-top:80px">
		<form action="${contextPath }/insertHotel.ho" class="row g-2 row-cols-1" method="post" enctype="multipart/form-data">
			<input type="hidden" name="entId" value="${ loginUser.id }">
			<div class="col form-floating mb-3 mt-3">
				<input type="text" class="hotelName form-control" name="hotelName" value="${hotel.hotelName }" required>
				<label for="hotelName">호텔명</label>
			</div>
			<div class="col form-floating mb-3 mt-3">
				<input type="hidden" class="hotelGeoX" name="hotelGeoX">
				<input type="hidden" class="hotelGeoY" name="hotelGeoY">
				<input type="text" class="hotelAddress form-control" name="hotelAddress" value="${hotel.hotelAddress }" onclick="sample4_execDaumPostcode()" required>
				<label for="hotelAddress">주소</label>
			</div>
			<div id="map" class="mukRound" style="width:540px;height:300px;"></div>
			<div class="col form-floating mb-3 mt-3">
				<input type="number" class="form-control" name="star" value="${hotel.star }" min="1" max="5" required>
				<label for="roomPrice">등급</label>
			</div>
			<div class="col form-floating mb-3 mt-3">
				<input type="tel" class="form-control m-input" name="hotelPhone" value="${hotel.hotelPhone }" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13"/>
				<label for="hotelPhone">전화번호</label>
			</div>
			<div class="col form-floating mb-3 mt-3">
				<h5 class="fw-bold">어떤 옵션을 제공할지 선택하세요.</h5>
				<table class="hotelOptionTable table table-borderless align-middle text-center">
					<tr>
						<td>
							<input type="hidden" name="wifi" value='Y'>
							<h2><i class="fa-solid fa-wifi"></i></h2>
							와이파이
						</td>
						<td>
							<input type="hidden" name="park" value='Y'>
							<h2><i class="fa-solid fa-square-parking"></i></h2>
							주차
						</td>
						<td>
							<input type="hidden" name="amenity" value='Y'>
							<h2><i class="fa-solid fa-gift"></i></h2>
							어메니티
						</td>
						<td>
							<input type="hidden" name="breakfast" value="Y">
							<h2><i class="fa-solid fa-utensils"></i></h2>
							조식
						</td>
						<td>
							<input type="hidden" name="fitness" value="Y">
							<h2><i class="fa-solid fa-dumbbell"></i></h2>
							피트니스
						</td>
						<td>
							<input type="hidden" name="swim" value="Y">
							<h2><i class="fa-solid fa-water-ladder"></i></h2>
							수영장
						</td>
					</tr>
				</table>
			</div>
			
			<div class="form-floating mb-3 mt-3">
				<textarea class="form-control" name="hotelIntro" rows="2" style="height:150px; resize:none" required>${hotel.hotelIntro}</textarea>
				<label for="hotelIntro" class="form-label">호텔 한줄소개</label>
			</div>
			
			<div class="form-floating mb-3 mt-3">
				<textarea class="form-control" name="hotelInfo" rows="10" style="height:500px; resize:none" required>${hotel.hotelInfo }</textarea>
				<label for="hotelInfo" class="form-label">호텔 설명</label>
			</div>
			
			<div class="col mb-3 mt-3">
				<h5 class="fw-bold">호텔 사진을 등록하세요.</h5>
				<div class="mb-3">
					<input type="file" class="form-control" name="hotelImg">
				</div>
				<div class="mb-3">
					<input type="file" class="form-control" name="hotelImg">
				</div>
				<div class="mb-3">
					<input type="file" class="form-control" name="hotelImg">
				</div>
				<div class="mb-3">
					<input type="file" class="form-control" name="hotelImg">
				</div>
				<div class="mb-3">
					<input type="file" class="form-control" name="hotelImg">
				</div>
			</div>
			<div class="d-grid gap-2">
				<button type="submit" class="mukButton" style="width:100%; align:bottom !important">등록하기</button>
			</div>
		</form>
	</div>
	
	
	<!-- 사진 첨부 시작 -->
	<script>
// 	    $("#hotelImg").click(function(){
// 	    	$('#myFile').click();
// 	    });
	    
// 	    const myFile = document.querySelector('#myFile');
// 	    const hotelImg = document.querySelector('#hotelImg');
    
// 	    myFile.addEventListener('change', ()=>{
// 	    	const reader = new FileReader();
// 	    	reader.onload = function(e){
// 				console.log(e);		    		
// 				hotelImg.src = e.target.result;
// 	    	};
// 	    	reader.readAsDataURL(myFile.files[0]);
// 	    });
	</script>
	<!-- 사진 첨부 끝 -->
	
	
	
	<!-- 호텔 옵션 선택 -->
	<script>
		$(".hotelOptionTable").find("td").on("click", function(){
			if($(this).css("color")=="rgb(33, 37, 41)") {
				$(this).css("color", "lightgray");
				$(this).find("input[type=hidden]").val("N");
			} else {
				$(this).prop("style").removeProperty("color");
				$(this).find("input[type=hidden]").val("Y");
			}
		});
	</script>
	<!-- 호텔 옵션 선택 끝 -->
	
	
	<!-- 지도 시작 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4aaeb935cb2fd15933272e12d906ced0&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
		var map = new kakao.maps.Map(mapContainer, mapOption); 
			
		$.viewMap = function() {
			var geocoder = new kakao.maps.services.Geocoder();
			
			geocoder.addressSearch($(".hotelAddress").val(), function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					$(".hotelGeoX").val(result[0].x);
					$(".hotelGeoY").val(result[0].y);
					console.log($(".hotelGeoX").val());
					console.log($(".hotelGeoY").val());
					var marker = new kakao.maps.Marker({
					    map: map,
					    position: coords
					});
					map.setCenter(coords);
			    }
			});
		}
 	</script>
 	<!-- 지도 끝 -->
	
	
	<!-- 주소찾기 시작 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				
				oncomplete : function(data) {
	
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
							&& /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					$("input[name=hotelAddress]").val(roadAddr);
					$.viewMap();
				}
			}).open();
		}
	</script>
	<!-- 주소찾기 끝 -->
	
	
	<!-- 전화번호 입력 설정 시작 -->
	<script>
		function autoHypenTel(str) {
			str = str.replace(/[^0-9]/g, '');
			var tmp = '';

			if (str.substring(0, 2) == 02) {
				// 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
				if (str.length < 3) {
					return str;
				} else if (str.length < 6) {
					tmp += str.substr(0, 2);
					tmp += '-';
					tmp += str.substr(2);
					return tmp;
				} else if (str.length < 10) {
					tmp += str.substr(0, 2);
					tmp += '-';
					tmp += str.substr(2, 3);
					tmp += '-';
					tmp += str.substr(5);
					return tmp;
				} else {
					tmp += str.substr(0, 2);
					tmp += '-';
					tmp += str.substr(2, 4);
					tmp += '-';
					tmp += str.substr(6, 4);
					return tmp;
				}
			} else {
				// 핸드폰 및 다른 지역 전화번호 일 경우
				if (str.length < 4) {
					return str;
				} else if (str.length < 7) {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3);
					return tmp;
				} else if (str.length < 11) {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3, 3);
					tmp += '-';
					tmp += str.substr(6);
					return tmp;
				} else {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3, 4);
					tmp += '-';
					tmp += str.substr(7);
					return tmp;
				}
			}

			return str;
		}
		
		
		$('input[type=tel]').keyup(function(event) {
			event = event || window.event;
			var _val = this.value.trim();
			this.value = autoHypenTel(_val);
		});
	</script>
	<!-- 전화번호 입력 설정 끝 -->
	
	<!-- 호텔 정보 엔터 구현 시작 -->
	<script>
		var hotelIntro = "${hotel.hotelIntro}".replace(/<br>/g, '\n'));
		console.log(hotelIntro);
		console.log(hotelIntro.replace(/<br>/g, '\n'));
		$("textarea[name=hotelIntro]").val("${hotel.hotelIntro}".replace(/<br>/g, '\n'));
		
		
		$("button[type=submit]").on("click", function(){
			var content = $("textarea[name=hotelInfo]").val();
			content = content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			$("textarea[name=hotelInfo]").val(content);
		});
	</script>
	<!-- 호텔 정보 엔터 구현 끝 -->
</body>
</html>