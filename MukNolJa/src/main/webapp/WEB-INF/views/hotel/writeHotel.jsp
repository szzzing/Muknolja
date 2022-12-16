<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>호텔 등록하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<style>
	.mukButton {background: #6BB6EC; color:white; height:40px; border-radius: 10px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
</style>
</head>
<body>
	<div class="container mt-5 mb-5" style="max-width:800px;">
		<h2 class="fw-bold p-5" style="text-align:center;">호텔 등록하기</h2>
		<form method="post">
		</form>
		<form action="${contextPath }/insertHotel.ho" class="row g-2 row-cols-1" method="post" enctype="multipart/form-data">
			<input type="hidden" name="entId" value="${ loginUser.id }">
			<div class="col form-floating mb-3 mt-3">
				<input type="text" class="form-control" name="hotelName" required>
				<label for="hotelName">호텔명</label>
			</div>
			<div class="col form-floating mb-3 mt-3">
				<input type="text" id="sample4_roadAddress" class="form-control" name="hotelAddress" onclick="sample4_execDaumPostcode()">
				<label for="hotelAddress">주소</label>
				<span id="guide" style="color:#fff;display:none"></span>
			</div>
			<div class="col form-floating mb-3 mt-3">
				<input type="number" class="form-control" name="star" min="1" max="5" required>
				<label for="roomPrice">등급</label>
			</div>
			<div class="col form-floating mb-3 mt-3">
				<input type="tel" class="form-control m-input" name="hotelPhone" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13"/>
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
				<textarea class="form-control" name="roomInfo" rows="2" style="height:60px; resize:none" required></textarea>
				<label for="roomInfo" class="form-label">호텔 한줄소개</label>
			</div>
			
			<div class="form-floating mb-3 mt-3">
				<textarea class="form-control" name="hotelInfo" rows="10" style="height:300px; resize:none" required></textarea>
				<label for="roomInfo" class="form-label">호텔 설명</label>
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
			</div>
			<div class="d-grid gap-2">
				<button type="submit" class="mukButton" style="width:100%; align:bottom !important">등록하기</button>
			</div>
		</form>
	</div>
	
	
	<!-- 사진 첨부 시작 -->
	<script>
		$(".photoButton").on("click", function() {
			const input = $("input[type=file]");
			input.trigger("click");
			console.log($("input[type=file]"));
		});
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
	
	
	
	<!-- 주소찾기 시작 -->
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
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
// 							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
// 							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
// 							if (roadAddr !== '') {
// 								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
// 							} else {
// 								document.getElementById("sample4_extraAddress").value = '';
// 							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
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
		$("button[type=submit]").on("click", function(){
			var content = $("textarea[name=hotelInfo]").val();
			content = content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			$("textarea[name=hotelInfo]").val(content);
		});
	</script>
	<!-- 호텔 정보 엔터 구현 끝 -->
</body>
</html>