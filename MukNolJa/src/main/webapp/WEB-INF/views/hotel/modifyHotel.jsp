<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${hotel.hotelName } :: 호텔 정보 수정</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
  	* {font-family: 'Noto Sans KR', sans-serif;}
  	input {font-family: 'Noto Sans KR', sans-serif;}
  	select {font-family: 'Noto Sans KR', sans-serif;}
  	.form-control {border:1px solid #e9e9e9 !important; border-radius:20px !important}
	.form-select {border:1px solid #e9e9e9 !important; border-radius:20px !important}
  	::-webkit-scrollbar {width:5px;}
	::-webkit-scrollbar-thumb {background-color:#e9e9e9; border-radius:10px;}
	::-webkit-scrollbar-track {opacity:0;}
	
	ul li {
		list-style: none;
		float: left;
		padding: 10px;
	}
	
	.mukCheckbox { width:auto; display: block; position:relative; padding-left:30px; margin-bottom: 10px; cursor: pointer; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
	.mukCheckbox input[type="checkbox"] { display: none; }
	.on { width: 24px; height: 24px; border:2px solid #f1f1f1; border-radius:4px; position: absolute; top: 0; left: 0; }
	.mukCheckbox input[type="checkbox"]:checked + .on { background: #6BB6EC; border:2px solid #6BB6EC; }
	.on:after { content: ""; position: absolute; display: none; }
	.mukCheckbox input[type="checkbox"]:checked + .on:after { display: block; }
	.on:after { width: 8px; height: 14px; border: solid #fff; border-radius:1px; border-width: 0 2px 2px 0; -webkit-transform: rotate(45deg); -ms-transform: rotate(45deg); transform: rotate(45deg); position: absolute; left: 6px; bottom: 5px; }

	#hotelTable td {
		margin:0px;
		padding:0px;
	}
	.hotel {cursor:pointer}
    .mukRound {border-radius: 8px;}
	.mukButton {transition: all 0.5s; background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	.myHover:hover {cursor: pointer; background-color: rgba(205, 92, 92, 0.1);}
	.mukMutedText {color:#B9B9B9;}
	
	#searchAddressButton {color:#6bb6ec; cursor:pointer;}
	#searchAddressButton:hover {text-decoration:underline;}
</style>
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
	
	<div class="container container-sm mt-5 mb-5" style="max-width:800px;">
		<form action="${contextPath }/updateHotel.ho" class="row g-2 row-cols-1" method="post" enctype="multipart/form-data">
			<input type="hidden" name="entId" value="${ loginUser.id }">
			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<h5 class="fw-bold pb-3">호텔 이름</h5>
				<input type="hidden" class="form-control" name="hotelId" value="${hotel.hotelId }">
				<input type="text" class="hotelName form-control" name="hotelName" value="${hotel.hotelName }" required>
			</div>
			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<input type="hidden" class="hotelGeoX" name="hotelGeoX" value="${hotel.hotelGeoX }">
				<input type="hidden" class="hotelGeoY" name="hotelGeoY" value="${hotel.hotelGeoY }">
				<h5 class="fw-bold pb-3">주소</h5>
				<span id="hotelAddress" class="pe-3">${hotel.hotelAddress }</span><span id="searchAddressButton" class="fw-bold" onclick="sample4_execDaumPostcode()">주소검색</span>
				<input type="hidden" class="hotelAddress pe-3form-control " name="hotelAddress" value="${hotel.hotelAddress }" required>
				<div id="map" class="mukRound mt-3" style="width:100%;height:300px;"></div>
			</div>
			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<h5 class="fw-bold pb-3">전화번호</h5>
				<input type="tel" class="form-control m-input" name="hotelPhone" value="${hotel.hotelPhone }" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13"/>
			</div>
			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<h5 class="fw-bold pb-3">등급</h5>
				<div class="row row-cols-3 row-cols-sm-3 row-cols-md-3 row-cols-lg-5">
					<div class="col">
						<label for=5star class="star mukCheckbox">
							<input type="checkbox" id="5star" value="5"><span class="on"></span>
							5성급
						</label>
					</div>
					<div class="col">
						<input type="hidden" name="star">
						<label for=4star class="star mukCheckbox">
							<input type="checkbox" id="4star" value="4"><span class="on"></span>
							4성급
						</label>
					</div>
					<div class="col">
						<label for=3star class="star mukCheckbox">
							<input type="checkbox" id="3star" value="3"><span class="on"></span>
							3성급
						</label>
					</div>
					<div class="col">
						<label for=2star class="star mukCheckbox">
							<input type="checkbox" id="2star" value="2"><span class="on"></span>
							2성급
						</label>
					</div>
					<div class="col">
						<label for=1star class="star mukCheckbox">
							<input type="checkbox" id="1star" value="1"><span class="on"></span>
							1성급
						</label>
					</div>
				</div>
			</div>
			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<h5 class="fw-bold pb-3">시설</h5>
				<div class="row row-cols-3 row-cols-sm-3 row-cols-md-3 row-cols-lg-6">
					<div class="col">
						<label for="wifi" class="mukCheckbox">
							<input type="hidden" name="wifi" value="${hotel.wifi }">
							<input type="checkbox" name='install' id="wifi"><span class="on"></span>
							와이파이
						</label>
					</div>
					<div class="col">
						<label for="breakfast" class="mukCheckbox">
							<input type="hidden" name="breakfast" value="${hotel.breakfast }">
							<input type="checkbox" name='install' id="breakfast"><span class="on"></span>
							조식
						</label>
					</div>
					<div class="col">
						<label for="amenity" class="mukCheckbox">
							<input type="hidden" name="amenity" value="${hotel.amenity }">
							<input type="checkbox" name='install' id="amenity"><span class="on"></span>
							어메니티
						</label>
					</div>
					<div class="col">
						<label for="park" class="mukCheckbox">
							<input type="hidden" name="park" value="${hotel.park }">
							<input type="checkbox" name='install' id="park"><span class="on"></span>
							주차
						</label>
					</div>
					<div class="col">
						<label for="swim" class="mukCheckbox">
							<input type="hidden" name="swim" value="${hotel.swim }">
							<input type="checkbox" name='install' id="swim"><span class="on"></span>
							수영장
						</label>
					</div>
					<div class="col">
						<label for="fitness" class="mukCheckbox">
							<input type="hidden" name="fitness" value="${hotel.fitness }">
							<input type="checkbox" name='install' id="fitness"><span class="on"></span>
							피트니스
						</label>
					</div>
				</div>
			</div>
			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<h5 class="fw-bold pb-3">호텔 소개</h5>
				<textarea class="form-control" name="hotelIntro" rows="2" style="height:150px; resize:none" required>${hotel.hotelIntro}</textarea>
			</div>
			
			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<h5 class="fw-bold pb-3">상세정보</h5>
				<textarea class="form-control" name="hotelInfo" rows="10" style="height:500px; resize:none" required>${hotel.hotelInfo }</textarea>
			</div>
			
			<div class="col mb-5 pb-5" style="border-bottom:1px solid #f1f1f1">
				<h5 class="fw-bold pb-3" style="display:inline-block">사진</h5>
				<span class="mukMutedText insertImgButton">최소 1장, 최대 5장의 사진을 등록할 수 있습니다.</span>
				<span id="insertImgButton" class="fw-bold" style="color:#6bb6ec; cursor:pointer">사진추가</span>
				<div id="newImgDiv" class="col-2" style="display:none">
					<img src="#" class="img-fluid mukRound">
					<input type="file" name="newImg" style="display:none">
				</div>
				<input type="hidden" name="originalImgCount">
				<input type="hidden" name="deleteImg">
				<div id="hotelImgList" class="row g-3">
					<c:forEach items="${hotelImgList }" var="img">
						<div class="col-2 currImg">
							<img class="img-fluid mukRound h-100" id="${img.fileModifyName }${img.fileThumbnail }" src="${ contextPath }/resources/uploadFiles/${img.fileModifyName}">
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="d-grid gap-2">
				<button type="button" id="submitButton" class="mukButton" style="width:100%; align:bottom !important">수정하기</button>
			</div>
		</form>
	</div>
	
	
	<!-- 사진 첨부 시작 -->
	<script>
		$("input[name=originalImgCount]").val($("#hotelImgList").children().length);
		
	    $(".currImg").click(function(){
	    	const img = $(this).find("img").attr("id");
	    	$("input[name=deleteImg]").val($("input[name=deleteImg]").val()+img+"/");
	    	$(this).remove();
	    	$.viewInsertImgButton();
	    });
	    
	    $("#insertImgButton").on("click", function(){
	    	$("#newImgDiv").find("input[name=newImg]").click();
	    });
	    
	    $("input[name=newImg]").on("change", function(e) {
			var tmp = e.target.files[0];
			var img = URL.createObjectURL(tmp);
			
			console.log($(this).parent().find("input"));
			var div = $(this).parent().clone();

			div.find("img").attr("src", img);
			div.prop("style").removeProperty("display");
			div.addClass("newImg");
			$("#hotelImgList").append(div);
			$.viewInsertImgButton();
		});
	    
	    $(document).on('click', '.newImg', function(){
	    	$(this).remove();
	    	$.viewInsertImgButton();
	    });
	    
	    $.viewInsertImgButton=()=>{
	    	const count = $("#hotelImgList").children().length;
	    	if(count>=5) {
	    		$("#insertImgButton").css("display", "none");
	    	} else {
	    		$("#insertImgButton").prop("style").removeProperty("display");
	    	}
	    }
	    $.viewInsertImgButton();
	    
	</script>
	<!-- 사진 첨부 끝 -->
	
	
	
	<!-- 호텔 옵션 선택 -->
	<script>
		// 기존 옵션
		var star = ${hotel.star};
		$("#"+star+"star").prop("checked", true);
		$("input[name=star]").val(star);
		
		$("input[name=install]").each(function(index, item){
			if($(this).parent().find("input[type=hidden]").val()=='Y') {
				$(this).prop("checked", true);
			} else {
				$(this).prop("checked", false);
			}
		});
		
		$(".star").on("click", function(){
			const checkboxes = $(".star").find("input[type=checkbox]");
			for(cb of checkboxes) {
				cb.checked = false;
			}
			$(this).find("input[type=checkbox]").prop('checked',true);
			$("input[name=star]").val($(this).find("input[type=checkbox]").val());
			console.log($("input[name=star]").val());
		});
		
		$("input[name=install]").on("click", function(){
			if($(this).is(':checked')) {
				$(this).parent().find("input[type=hidden]").val("Y");
			} else {
				$(this).parent().find("input[type=hidden]").val("N");
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
					$("#hotelAddress").text(roadAddr);
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
	
	<!-- 호텔 정보 엔터 구현, newImgDiv 삭제 시작 -->
	<script>
		$("#submitButton").on("click", function(){
			if($("#hotelImgList").children().length>0) {
				$("#newImgDiv").remove();
				$("form").submit();
			} else {
				alert("1개 이상의 이미지를 첨부해주세요.");
			}
		});
	</script>
	<!-- 호텔 정보 엔터 구현 끝 -->
</body>
</html>